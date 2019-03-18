package hk.me.stripe_flutter_channel

import android.content.Context
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.PluginRegistry.Registrar
import java.util.*

class StripeFlutterChannelPlugin : MethodCallHandler {

  lateinit var client: StripePluginClient

  companion object {
    private lateinit var register: Registrar

    val context: Context get() = register.context()

    @JvmStatic
    fun registerWith(registrar: Registrar) {
      val channel = MethodChannel(registrar.messenger(), PLATFORM_CHANNEL_NAME)
      register = registrar
      channel.setMethodCallHandler(StripeFlutterChannelPlugin())
    }
  }

  override fun onMethodCall(call: MethodCall, result: Result) {
    when (call.method) {
      METHOD_INIT -> {
        val publishableKey: String? = call.argument<String>(PARAMETER_PUBLISHABLE_KEY)
        val appleMerchantId: String? = call.argument<String>(PARAMETER_APPLE_MERCHANT_ID)

        if (publishableKey == null) {
          result.error(CODE_MISSING_PUBLISHABLE_KEY, ERROR_MESSAGE_MISSING_PUBLISHABLE_KEY, publishableKey)
          return
        }

        try {
          client = StripePluginClient.createShareInstance(context, publishableKey, appleMerchantId)!!
          result.success(true)
        } catch (e: Exception) {
          result.error(CODE_UNKNOWN_ERROR, ERROR_MESSAGE_INIT_FAILURE, e.stackTrace.toString())
        }
      }
      METHOD_CREATE_CARD_TOKEN -> {
        val cardNumber: String? = call.argument<String>(PARAMETER_CARD_NUMBER)
        val expiredMonth: Int? = call.argument<Int>(PARAMETER_CARD_EXPIRE_MONTH)
        val expireYear: Int? = call.argument<Int>(PARAMETER_CARD_EXPIRE_YEAR)
        val cvc: String? = call.argument<String>(PARAMETER_CARD_CVC)

        when {
          cardNumber == null || cardNumber.isEmpty() -> {
            result.error(CODE_MISSING_CARD_NUMBER, ERROR_MESSAGE_MISSING_CARD_NUMBER, cardNumber)
            return
          }
          cardNumber.length != 16 -> {
            result.error(CODE_WRONG_FORMAT_CARD_NUMBER, ERROR_MESSAGE_WRONG_FORMAT_CARD_NUMBER, cardNumber)
            return
          }
          expiredMonth == null -> {
            result.error(CODE_MISSING_CARD_EXPIRE_MONTH, ERROR_MESSAGE_MISSING_CARD_EXPIRE_MONTH, expiredMonth)
            return
          }
          expiredMonth !in 1..12 -> {
            result.error(CODE_MISSING_CARD_EXPIRE_MONTH, ERROR_MESSAGE_MISSING_CARD_EXPIRE_MONTH, expiredMonth)
            return
          }
          expireYear == null -> {
            result.error(CODE_MISSING_CARD_EXPIRE_YEAR, ERROR_MESSAGE_MISSING_CARD_EXPIRE_YEAR, expireYear)
            return
          }
          expireYear < Calendar.getInstance().get(Calendar.YEAR) -> {
            result.error(CODE_WRONG_FORMAT_CARD_EXPIRE_YEAR, ERROR_MESSAGE_WRONG_FORMAT_CARD_EXPIRE_YEAR, expireYear)
            return
          }
          cvc == null -> {
            result.error(CODE_MISSING_CARD_CVC, ERROR_MESSAGE_MISSING_CARD_CVC, cvc)
            return
          }
          cvc.length != 3 -> {
            result.error(CODE_WRONG_FORMAT_CARD_CVC, ERROR_MESSAGE_WRONG_FORMAT_CARD_CVC, cvc)
            return
          }
          else -> {
            client.createCardToken(cardNumber, expiredMonth, expireYear, cvc, { result.success(it) }, { result.error(CODE_UNKNOWN_ERROR, it?.localizedMessage, null) })
          }
        }
      }
      else -> result.notImplemented()

    }
  }
}
