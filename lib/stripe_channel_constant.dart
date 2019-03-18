///Method channel name
const String PLATFORM_CHANNEL_NAME = "stripe_flutter_channel";

///Method name
const String METHOD_INIT = "init";
const String METHOD_CREATE_CARD_TOKEN = "createCardToken";

///Platform channel parameter name
//init
const String PARAMETER_PUBLISHABLE_KEY = "publishableKey";
const String PARAMETER_APPLE_MERCHANT_ID = "appleMerchantId";
//card
const String PARAMETER_CARD_NUMBER = "cardNumber";
const String PARAMETER_CARD_EXPIRE_MONTH = "expireMonth";
const String PARAMETER_CARD_EXPIRE_YEAR = "expireYear";
const String PARAMETER_CARD_CVC = "cvc";

///Backend scheme
const String SCHEME_CREATE_CHARGE = "create_charge";

///Post parameter key
const String POST_PARAMETER_CARD_SOURCE = "source";
const String POST_PARAMETER_CHARGE_AMOUNT = "amount";
const String POST_PARAMETER_CHARGE_REQUEST_ID = "metadata[charge_request_id]";

///Error code key
const String CODE_MISSING_BACKEND_SERVER_LINK = "MISSING_BACKEND_SERVER_LINK";
const String CODE_MISSING_SOURCE = "MISSING_SOURCE";
const String CODE_MISSING_AMOUNT = "MISSING_AMOUNT";
const String CODE_AMOUNT_MUST_GREATER_THAN_ZERO =
    "AMOUNT_MUST_GREATER_THAN_ZERO";

///Error message
const String ERROR_MESSAGE_MISSING_BACKEND_SERVER_LINK =
    "Missing backend server link!";
const String ERROR_MESSAGE_MISSING_SOURCE = "Missing token!";
const String ERROR_MESSAGE_MISSING_AMOUNT = "Missing amount!";
const String ERROR_MESSAGE_AMOUNT_MUST_GREATER_THAN_ZERO =
    "Amount must be greater than zero!";

String getCreateChargeUrl(String backendServerLink) {
  return _createCorrectBackendServerLink(backendServerLink) +
      SCHEME_CREATE_CHARGE;
}

String _createCorrectBackendServerLink(String backendServerLink) {
  return backendServerLink + (backendServerLink.endsWith("/") ? "" : "/");
}
