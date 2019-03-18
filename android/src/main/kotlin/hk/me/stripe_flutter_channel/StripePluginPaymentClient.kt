package hk.me.stripe_flutter_channel

import com.stripe.android.TokenCallback
import com.stripe.android.model.Card
import com.stripe.android.model.Token
import java.lang.Exception

typealias OnCardTokenGenerateSucceeded = (String?) -> Unit

fun StripePluginClient.createCardToken(cardNumber: String, expireMonth: Int, expireYear: Int, cvc: String, onSucceed: OnCardTokenGenerateSucceeded, onFailure: OnActionFailed) {
    this.client.createToken(Card(cardNumber, expireMonth, expireYear, cvc), object : TokenCallback {
        override fun onSuccess(token: Token?) {
            onSucceed(token?.id)
        }

        override fun onError(error: Exception?) {
            onFailure(error)
        }
    })
}