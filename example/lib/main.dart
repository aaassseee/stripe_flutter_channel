import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stripe_flutter_channel/stripe_flutter_channel.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isInit = false, _isCharged = false;
  String _cardToken;
  StripeFlutterChannel stripeClient;

  ///Own testing server
  ///YOUR_BACKEND_SERVER_LINK
  final backendServerLink = '';

  ///YOUR_PUBLISHABLE_KEY
  final stripePublishableKey = '';

  onInitialized() {
    setState(() {
      _isInit = stripeClient.initializeNotifier.value;
    });
  }

  initStripe() {
    try {
      stripeClient =
          StripeFlutterChannel(stripePublishableKey, backendServerLink);
      stripeClient.initializeNotifier.addListener(onInitialized);
    } on PlatformException catch (e) {
      print(e.toString());
    }

    if (!mounted) return;
  }

  @override
  void initState() {
    super.initState();
    initStripe();
  }

  @override
  void dispose() {
    stripeClient.initializeNotifier.removeListener(onInitialized);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.home),
          title: const Text('Stripe plugin example'),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Text('Is initialized : $_isInit'),
              Text('Card token : $_cardToken'),
              Text('Created charge : $_isCharged'),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: Wrap(
          direction: Axis.vertical,
          spacing: 8,
          children: <Widget>[
            FloatingActionButton(
                child: Icon(Icons.credit_card),
                onPressed: () async {
                  String cardToken = await stripeClient.getCardToken(
                      '4242424242424242', 5, 2020, '123');
                  setState(() {
                    _cardToken = cardToken;
                  });
                }),
            FloatingActionButton(
                child: Icon(Icons.http),
                onPressed: () async {
                  bool isCharged = await stripeClient.createCharge(
                      _cardToken, 1029,
                      chargeRequestId: 'YOUR_CHARGE_REQUEST_ID');
                  setState(() {
                    _isCharged = isCharged;
                  });
                }),
          ],
        ),
      ),
    );
  }
}
