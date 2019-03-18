//
//  StripePluginClient.h
//  Stripe Flutter
//
//  Created by Jack Liu on 7/3/2019.
//  Copyright © 2019 The Chromium Authors. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Stripe/Stripe.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^OnActionSucceeded)(void);
typedef void(^OnActionFailed)(NSError *error);

@interface StripePluginClient : NSObject

@property(nonatomic, readonly, getter=getPublishableKey) NSString *publishableKey;
@property(nonatomic, readonly, getter=getAppleMerchantId) NSString *appleMerchantId;

#pragma mark Init
+ (id)createShareInstanceWithPublishableKey:(NSString * _Nonnull)publishableKey;
+ (id)createShareInstanceWithPublishableKey:(NSString * _Nonnull)publishableKey appleMerchantId:(NSString * _Nonnull)appleMerchantId;
+ (id)getShareInstance;
@end

NS_ASSUME_NONNULL_END
