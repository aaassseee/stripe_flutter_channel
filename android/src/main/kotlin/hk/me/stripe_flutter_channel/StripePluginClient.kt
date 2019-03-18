package hk.me.stripe_flutter_channel

import android.content.Context
import com.stripe.android.Stripe
import java.util.concurrent.atomic.AtomicBoolean
import kotlin.Exception

typealias OnActionSucceeded = () -> Unit
typealias OnActionFailed = (exception: Exception?) -> Unit

class StripePluginClient private constructor(context: Context, publishableKey: String, appleMerchantId: String? = null) {

    val client: Stripe = Stripe(context, publishableKey)

    companion object {
        private var INSTANCE: StripePluginClient? = null

        val instance: StripePluginClient? get() = INSTANCE

        fun createShareInstance(context: Context, publishableKey: String, appleMerchantId: String? = null): StripePluginClient? {
            try {
                if (instance == null) {
                    INSTANCE = StripePluginClient(context, publishableKey, appleMerchantId)
                }
                return instance
            } catch (e: Exception) {
                throw e
            }
        }
    }
}