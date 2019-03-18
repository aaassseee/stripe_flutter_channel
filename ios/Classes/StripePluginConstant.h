//
//  StripePluginConstant.h
//  Stripe Flutter
//
//  Created by Jack Liu on 11/3/2019.
//  Copyright © 2019 Jack Liu. All rights reserved.
//

#pragma mark Channel name
#define PLATFORM_CHANNEL_NAME @"stripe_flutter_channel"

#pragma mark Method name
#define METHOD_INIT @"init"
#define METHOD_CREATE_CARD_TOKEN @"createCardToken"

#pragma mark Parameter name
//init
#define PARAMETER_PUBLISHABLE_KEY @"publishableKey"
#define PARAMETER_APPLE_MERCHANT_ID @"appleMerchantId"
//card
#define PARAMETER_CARD_NUMBER @"cardNumber"
#define PARAMETER_CARD_EXPIRE_MONTH @"expireMonth"
#define PARAMETER_CARD_EXPIRE_YEAR @"expireYear"
#define PARAMETER_CARD_CVC @"cvc"

#pragma mark Error code
#define CODE_UNKNOWN_ERROR @"UNKNOWN_ERROR"
//init
#define CODE_MISSING_PUBLISHABLE_KEY @"MISSING_PUBLISHABLE_KEY"
//tokenize card
#define CODE_MISSING_CARD_NUMBER @"MISSING_CARD_NUMBER"
#define CODE_MISSING_CARD_EXPIRE_MONTH @"MISSING_CARD_EXPIRE_MONTH"
#define CODE_MISSING_CARD_EXPIRE_YEAR @"MISSING_CARD_EXPIRE_YEAR"
#define CODE_MISSING_CARD_CVC @"MISSING_CARD_CVC"
#define CODE_WRONG_FORMAT_CARD_NUMBER @"WRONG_FORMAT_CARD_NUMBER"
#define CODE_WRONG_FORMAT_CARD_EXPIRE_MONTH @"WRONG_FORMAT_CARD_EXPIRE_MONTH"
#define CODE_WRONG_FORMAT_CARD_EXPIRE_YEAR @"WRONG_FORMAT_CARD_EXPIRE_YEAR"
#define CODE_WRONG_FORMAT_CARD_CVC @"WRONG_FORMAT_CARD_CVC"

#pragma mark Error message
//init
#define ERROR_MESSAGE_INIT_FAILURE @"Cannot create instance during initiation!"
#define ERROR_MESSAGE_MISSING_PUBLISHABLE_KEY @"Missing publishable key!"
//tokenize card
#define ERROR_MESSAGE_MISSING_CARD_NUMBER @"Missing card number!"
#define ERROR_MESSAGE_MISSING_CARD_EXPIRE_MONTH @"Missing card expire month!"
#define ERROR_MESSAGE_MISSING_CARD_EXPIRE_YEAR @"Missing card expire year!"
#define ERROR_MESSAGE_MISSING_CARD_CVC @"Missing card cvc!"
#define ERROR_MESSAGE_WRONG_FORMAT_CARD_NUMBER @"Wrong card number format!"
#define ERROR_MESSAGE_WRONG_FORMAT_CARD_EXPIRE_MONTH @"Wrong card expire month format!"
#define ERROR_MESSAGE_WRONG_FORMAT_CARD_EXPIRE_YEAR @"Wrong card expire year format!"
#define ERROR_MESSAGE_WRONG_FORMAT_CARD_CVC @"Wrong card cvc format!"
