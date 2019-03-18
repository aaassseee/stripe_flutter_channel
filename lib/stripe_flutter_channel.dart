import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:stripe_flutter_channel/stripe_channel_constant.dart';

class StripeFlutterChannel {
  static const MethodChannel _channel =
      const MethodChannel(PLATFORM_CHANNEL_NAME);

  String publishableKey, backendServerLink, appleMerchantId;
  ValueNotifier<bool> initializeNotifier = ValueNotifier<bool>(false);

  StripeFlutterChannel(this.publishableKey, this.backendServerLink,
      {this.appleMerchantId}) {
    _init(publishableKey, appleMerchantId: appleMerchantId);
  }

  Future<Null> _init(String publishableKey, {String appleMerchantId}) async {
    try {
      final bool isInitialized = await _channel.invokeMethod(
        METHOD_INIT,
        {
          PARAMETER_PUBLISHABLE_KEY: publishableKey,
          PARAMETER_APPLE_MERCHANT_ID: appleMerchantId,
        },
      );
      this.initializeNotifier.value = isInitialized;
    } on PlatformException catch (e) {
      throw e;
    }
  }

  Future<String> getCardToken(
      String cardNumber, int expireMonth, int expireYear, String cvc) async {
    try {
      final String tokenizedCard = await _channel.invokeMethod(
        METHOD_CREATE_CARD_TOKEN,
        {
          PARAMETER_CARD_NUMBER: cardNumber,
          PARAMETER_CARD_EXPIRE_MONTH: expireMonth,
          PARAMETER_CARD_EXPIRE_YEAR: expireYear,
          PARAMETER_CARD_CVC: cvc,
        },
      );
      return tokenizedCard;
    } on PlatformException catch (e) {
      throw e;
    }
  }

  Future<bool> createCharge(String token, int amount,
      {String chargeRequestId}) async {
    if (token == null) {
      throw PlatformException(
          code: CODE_MISSING_SOURCE,
          message: ERROR_MESSAGE_MISSING_SOURCE,
          details: token);
    }

    if (amount == null) {
      throw PlatformException(
          code: CODE_MISSING_AMOUNT,
          message: ERROR_MESSAGE_MISSING_AMOUNT,
          details: amount);
    }

    if (amount <= 0) {
      throw PlatformException(
          code: CODE_AMOUNT_MUST_GREATER_THAN_ZERO,
          message: ERROR_MESSAGE_AMOUNT_MUST_GREATER_THAN_ZERO,
          details: amount);
    }

    try {
      http.Response response =
          await http.post(getCreateChargeUrl(backendServerLink), body: {
        POST_PARAMETER_CARD_SOURCE: token,
        POST_PARAMETER_CHARGE_AMOUNT: amount.toString(),
        POST_PARAMETER_CHARGE_REQUEST_ID: chargeRequestId
      });
      if (response.statusCode == 200) {
        return true;
      }
    } catch (e) {
      print(e);
    }
    return false;
  }
}
