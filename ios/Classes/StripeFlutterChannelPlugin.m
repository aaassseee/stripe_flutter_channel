#import "StripeFlutterChannelPlugin.h"

@implementation StripeFlutterChannelPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
    FlutterMethodChannel* channel = [FlutterMethodChannel methodChannelWithName:PLATFORM_CHANNEL_NAME binaryMessenger:[registrar messenger]];
    StripeFlutterChannelPlugin* instance = [[StripeFlutterChannelPlugin alloc] init];
    [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
    if ([METHOD_INIT isEqualToString:call.method]) {
        NSString *publishableKey = call.arguments[PARAMETER_PUBLISHABLE_KEY];
        NSString *appleMerchantId = call.arguments[PARAMETER_APPLE_MERCHANT_ID];

        if(!publishableKey || [publishableKey isKindOfClass:[NSNull class]]) {
            result([FlutterError errorWithCode:CODE_MISSING_PUBLISHABLE_KEY message:ERROR_MESSAGE_MISSING_PUBLISHABLE_KEY details:publishableKey]);
            return;
        }

        _client = appleMerchantId == nil && ![appleMerchantId isKindOfClass:[NSNull class]]? [StripePluginClient createShareInstanceWithPublishableKey:publishableKey] : [StripePluginClient createShareInstanceWithPublishableKey:publishableKey appleMerchantId:appleMerchantId];
        result(_client != nil ? [NSNumber numberWithBool:YES] : [FlutterError errorWithCode:CODE_UNKNOWN_ERROR message:ERROR_MESSAGE_INIT_FAILURE details:nil]);
    } else if ([METHOD_CREATE_CARD_TOKEN isEqualToString:call.method]) {
        NSString *cardNumber = call.arguments[PARAMETER_CARD_NUMBER];
        NSNumber *expireMonth = call.arguments[PARAMETER_CARD_EXPIRE_MONTH];
        NSNumber *expireYear = call.arguments[PARAMETER_CARD_EXPIRE_YEAR];
        NSString *cvc = call.arguments[PARAMETER_CARD_CVC];

        if (!cardNumber || [cardNumber isKindOfClass:[NSNull class]] || [cardNumber isEqualToString:@""]) {
            result([FlutterError errorWithCode:CODE_MISSING_CARD_NUMBER message:ERROR_MESSAGE_MISSING_CARD_NUMBER details:cardNumber]);
            return;
        }

        if (cardNumber.length != 16) {
            result([FlutterError errorWithCode:CODE_WRONG_FORMAT_CARD_NUMBER message:ERROR_MESSAGE_WRONG_FORMAT_CARD_NUMBER details:cardNumber]);
            return;
        }

        if (!expireMonth || [cardNumber isKindOfClass:[NSNull class]]) {
            result([FlutterError errorWithCode:CODE_MISSING_CARD_EXPIRE_MONTH message:ERROR_MESSAGE_MISSING_CARD_EXPIRE_MONTH details:expireMonth]);
            return;
        }

        if ([expireMonth intValue] < 1 || [expireMonth intValue] > 12) {
            result([FlutterError errorWithCode:CODE_WRONG_FORMAT_CARD_EXPIRE_MONTH message:ERROR_MESSAGE_WRONG_FORMAT_CARD_EXPIRE_MONTH details:expireMonth]);
            return;
        }

        if (!expireYear || [cardNumber isKindOfClass:[NSNull class]]) {
            result([FlutterError errorWithCode:CODE_MISSING_CARD_EXPIRE_YEAR message:ERROR_MESSAGE_MISSING_CARD_EXPIRE_YEAR details:expireYear]);
            return;
        }

        if ([expireYear intValue] < [[[NSCalendar currentCalendar] components:NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear fromDate:[NSDate date]] year]) {
            result([FlutterError errorWithCode:CODE_WRONG_FORMAT_CARD_EXPIRE_YEAR message:ERROR_MESSAGE_WRONG_FORMAT_CARD_EXPIRE_YEAR details:expireYear]);
            return;
        }

        if (!cvc || [cvc isKindOfClass:[NSNull class]]) {
            result([FlutterError errorWithCode:CODE_MISSING_CARD_CVC message:ERROR_MESSAGE_MISSING_CARD_CVC details:cvc]);
            return;
        }

        if (cvc.length != 3) {
            result([FlutterError errorWithCode:CODE_WRONG_FORMAT_CARD_CVC message:ERROR_MESSAGE_WRONG_FORMAT_CARD_CVC details:cvc]);
            return;
        }

        [_client createCardTokenWithCardNumber:cardNumber expireMonth:[expireMonth intValue] expireYear:[expireYear intValue] cvc:cvc onGeneratedSucceeded:^(NSString * _Nullable token) {
            result(token);
        } onGeneratedFailed:^(NSError * _Nonnull error) {
            result([FlutterError errorWithCode:CODE_UNKNOWN_ERROR message:error.localizedDescription details:nil]);
        }];
    } else {
        result(FlutterMethodNotImplemented);
    }
}

- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options {
    if ([Stripe handleStripeURLCallbackWithURL:url]) {
        return YES;
    }
    return NO;
}

@end
