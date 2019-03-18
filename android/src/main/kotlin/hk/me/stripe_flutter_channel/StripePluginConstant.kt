package hk.me.stripe_flutter_channel

const val PLATFORM_CHANNEL_NAME = "stripe_flutter_channel"

const val METHOD_INIT = "init"
const val METHOD_CREATE_CARD_TOKEN = "createCardToken"
const val METHOD_CREATE_CHARGE = "createCharge"

//init
const val PARAMETER_PUBLISHABLE_KEY = "publishableKey"
const val PARAMETER_BACKEND_SERVER_LINK = "backendServerLink"
const val PARAMETER_APPLE_MERCHANT_ID = "appleMerchantId"
//card
const val PARAMETER_CARD_NUMBER = "cardNumber"
const val PARAMETER_CARD_EXPIRE_MONTH = "expireMonth"
const val PARAMETER_CARD_EXPIRE_YEAR = "expireYear"
const val PARAMETER_CARD_CVC = "cvc"
//tokenized
const val PARAMETER_CARD_SOURCE = "cardSource"
//charge
const val PARAMETER_CHARGE_VALUE = "chargeValue"
const val PARAMETER_CHARGE_REQUEST_ID = "chargeRequestId"

const val SCHEME_CREATE_CHARGE = "create_charge"
const val CODE_UNKNOWN_ERROR = "UNKNOWN_ERROR"
//init
const val CODE_MISSING_PUBLISHABLE_KEY = "MISSING_PUBLISHABLE_KEY"
const val CODE_MISSING_BACKEND_SERVER_LINK = "MISSING_BACKEND_SERVER_LINK"
//tokenize card
const val CODE_MISSING_CARD_NUMBER = "MISSING_CARD_NUMBER"
const val CODE_MISSING_CARD_EXPIRE_MONTH = "MISSING_CARD_EXPIRE_MONTH"
const val CODE_MISSING_CARD_EXPIRE_YEAR = "MISSING_CARD_EXPIRE_YEAR"
const val CODE_MISSING_CARD_CVC = "MISSING_CARD_CVC"
const val CODE_WRONG_FORMAT_CARD_NUMBER = "WRONG_FORMAT_CARD_NUMBER"
const val CODE_WRONG_FORMAT_CARD_EXPIRE_MONTH = "WRONG_FORMAT_CARD_EXPIRE_MONTH"
const val CODE_WRONG_FORMAT_CARD_EXPIRE_YEAR = "WRONG_FORMAT_CARD_EXPIRE_YEAR"
const val CODE_WRONG_FORMAT_CARD_CVC = "WRONG_FORMAT_CARD_CVC"
//create charge
const val CODE_MISSING_SOURCE = "MISSING_SOURCE"
const val CODE_MISSING_AMOUNT = "MISSING_AMOUNT"
const val CODE_AMOUNT_MUST_GREATER_THAN_ZERO = "AMOUNT_MUST_GREATER_THAN_ZERO"

//init
const val ERROR_MESSAGE_INIT_FAILURE = "Cannot create instance during initiation!"
const val ERROR_MESSAGE_MISSING_PUBLISHABLE_KEY = "Missing publishable key!"
const val ERROR_MESSAGE_MISSING_BACKEND_SERVER_LINK = "Missing backend server link!"
//tokenize card
const val ERROR_MESSAGE_MISSING_CARD_NUMBER = "Missing card number!"
const val ERROR_MESSAGE_MISSING_CARD_EXPIRE_MONTH = "Missing card expire month!"
const val ERROR_MESSAGE_MISSING_CARD_EXPIRE_YEAR = "Missing card expire year!"
const val ERROR_MESSAGE_MISSING_CARD_CVC = "Missing card cvc!"
const val ERROR_MESSAGE_WRONG_FORMAT_CARD_NUMBER = "Wrong card number format!"
const val ERROR_MESSAGE_WRONG_FORMAT_CARD_EXPIRE_MONTH = "Wrong card expire month format!"
const val ERROR_MESSAGE_WRONG_FORMAT_CARD_EXPIRE_YEAR = "Wrong card expire year format!"
const val ERROR_MESSAGE_WRONG_FORMAT_CARD_CVC = "Wrong card cvc format!"
const val ERROR_MESSAGE_MISSING_SOURCE = "Missing token!"
const val ERROR_MESSAGE_MISSING_AMOUNT = "Missing amount!"
const val ERROR_MESSAGE_AMOUNT_MUST_GREATER_THAN_ZERO = "Amount must be greater than zero!"