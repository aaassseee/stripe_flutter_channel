#import <Flutter/Flutter.h>
#import "StripePluginClient.h"
#import "StripePluginConstant.h"
#import "StripePluginPaymentClient.h"

@interface StripeFlutterChannelPlugin : NSObject<FlutterPlugin>
@property (strong, nonatomic) StripePluginClient* client;
@end
