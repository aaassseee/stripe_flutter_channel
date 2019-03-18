//
//  StripePluginPaymentClient.h
//  FlutterPackageCreationPlayground
//
//  Created by Jack Liu on 13/3/2019.
//  Copyright © 2019 Jack Liu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StripePluginClient.h"

NS_ASSUME_NONNULL_BEGIN

typedef void(^OnCardTokenGenerateSucceeded)(NSString * _Nullable token);

@interface StripePluginClient(Payment)
#pragma mark Payment
- (void)createCardTokenWithCardNumber:(NSString * _Nonnull)number expireMonth:(int)month expireYear:(int)year cvc:(NSString * _Nonnull)cvc onGeneratedSucceeded:(OnCardTokenGenerateSucceeded _Nonnull)successBlock onGeneratedFailed:(OnActionFailed _Nonnull)failureBlock;
@end
NS_ASSUME_NONNULL_END
