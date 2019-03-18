//
//  StripePluginPaymentClient.m
//  FlutterPackageCreationPlayground
//
//  Created by Jack Liu on 13/3/2019.
//  Copyright © 2019 Jack Liu. All rights reserved.
//

#import "StripePluginPaymentClient.h"
#import "StripePluginConstant.h"

@implementation StripePluginClient(Payment)

- (void)createCardTokenWithCardNumber:(NSString * _Nonnull)number expireMonth:(int)month expireYear:(int)year cvc:(NSString * _Nonnull)cvc onGeneratedSucceeded:(OnCardTokenGenerateSucceeded _Nonnull)successBlock onGeneratedFailed:(OnActionFailed _Nonnull)failureBlock {
    
    // Remark: Create card by using STPCardParams
    STPCardParams *cardParams = [STPCardParams new];
    cardParams.number = number;
    cardParams.expMonth = month;
    cardParams.expYear = year;
    cardParams.cvc = cvc;
    cardParams.address = [STPAddress new];
    
    [[STPAPIClient sharedClient] createTokenWithCard:cardParams completion:^(STPToken * _Nullable token, NSError * _Nullable error) {
        if (!error) {
            successBlock(token == nil ? nil : token.tokenId);
        } else {
            failureBlock(error);
        }
    }];
}
@end
