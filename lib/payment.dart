import 'dart:convert';

import 'package:bet_app/const.dart';
import 'package:bet_app/screens/auth/auth_cubit.dart';
import 'package:bet_app/server/api/api.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:yookassa_payments_flutter/yookassa_payments_flutter.dart';

class Payment {
  late WebViewController webViewController;
  // final inputData = TokenizationModuleInputData(
  //   title: "bet",
  //   subtitle: 'bet bet',
  //   clientApplicationKey:
  //       'test_OTY3MTk0s5n5YmYu4k6kk1G5Mf6DKjo-DC5xv-CW7hctest_OTY3MTk0s5n5YmYu4k6kk1G5Mf6DKjo-DC5xv-CW7hc',
  //   savePaymentMethod: SavePaymentMethod.userSelects,
  //   amount: Amount(value: 999.9, currency: Currency.rub),
  //   shopId: '967194',
  //   isLoggingEnabled: false,
  //   moneyAuthClientId: 'r1rtv7bi6467ie40m03r0vdff3qad52i',
  //   googlePayParameters: GooglePayParameters(),
  //   // testModeSettings: TestModeSettings(
  //   //     true, 5, Amount(value: 999, currency: Currency.rub), true),
  // );
  Future<void> getToken() async {
    try {
      var clientApplicationKey = "<Ключ для клиентских приложений>";
      var amount = Amount(value: 999, currency: Currency.rub);
      var shopId = '967194';
      var tokenizationModuleInputData = TokenizationModuleInputData(
        isLoggingEnabled: true,
        tokenizationSettings: const TokenizationSettings(
          PaymentMethodTypes.bankCard,
        ),
        clientApplicationKey:
            'test_OTY3MTk0s5n5YmYu4k6kk1G5Mf6DKjo-DC5xv-CW7hc',
        title: "Космические объекты",
        subtitle: "Комета повышенной яркости, период обращения — 112 лет",
        amount: amount,
        shopId: shopId,
        savePaymentMethod: SavePaymentMethod.on,
      );
      var result = await YookassaPaymentsFlutter.tokenization(
          tokenizationModuleInputData);

      print('print err = ${result}');
      print(result);
      if (result is SuccessTokenizationResult) {
        var token = result.token;
        print('token cur  = $token');
        var paymentMethodType = result.paymentMethodType;
        String? authToken = await storage.read(key: 'key');
        String? url;
        if (authToken != null) {
          url = await Api().sendPaymentToken(
              token: token,
              amount: amount.value,
              currency: amount.currency.toString(),
              authToken: authToken);
        }
        WebViewController controller = WebViewController()
          ..setJavaScriptMode(JavaScriptMode.unrestricted)
          ..setBackgroundColor(const Color(0x00000000))
          ..setNavigationDelegate(
            NavigationDelegate(
              onProgress: (int progress) {
                // Update loading bar.
              },
              onPageStarted: (url) {},
              onPageFinished: (url) {},
              onWebResourceError: (WebResourceError error) {},
              onNavigationRequest: (NavigationRequest request) {
                if (request.url.startsWith('$url')) {
                  return NavigationDecision.prevent;
                }
                return NavigationDecision.navigate;
              },
            ),
          )
          ..loadRequest(Uri.parse('https://flutter.dev'));
      } else if (result is ErrorTokenizationResult) {
        // showDialog(
        //     context: context,
        //     builder: (context) => AlertDialog(content: Text(result.error)));
        return;
      }
    } catch (e) {
      print(e);
    }
  }
}
