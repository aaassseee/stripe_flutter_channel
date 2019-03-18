# stripe_flutter_channel

Integration between Stripe payment gateway and flutter using native library iOS and Android

## Getting Started
To use this plugin, add shared_preferences as a [dependency in your pubspec.yaml file](https://flutter.io/platform-plugins/).

Usage
---
###### Create Stripe flutter using constructor with publishable key
```dart
StripeFlutterChannel stripeClient = StripeFlutterChannel(stripePublishableKey, backendServerLink);
```

###### Monitor instance is initialized
```dart
bool _isInit = false;

onInitialized() {
    setState(() {
      _isInit = stripeClient.initializeNotifier.value;
    });
}

stripeClient.initializeNotifier.addListener(onInitialized);

///Remember to dispose listeners when page deallocate
stripeClient.initializeNotifier.removeListener(onInitialized);
```

###### Create card token by card info
```dart
String cardToken = await stripeClient.getCardToken('4242424242424242', 5, 2020, '123');
```

###### Create charge request to your backend server
```dart
bool isCharged = await stripeClient.createCharge(cardToken, /*10.29*/1029, chargeRequestId: 'YOUR_CHARGE_REQUEST_ID')
```