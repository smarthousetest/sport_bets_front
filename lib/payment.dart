import 'dart:convert';

import 'package:bet_app/const.dart';
import 'package:bet_app/models/login_response.dart';
import 'package:bet_app/models/payment_model.dart';
import 'package:bet_app/screens/auth/auth_cubit.dart';
import 'package:bet_app/screens/pay.dart';
import 'package:bet_app/screens/profile_cubit/profile_cubit.dart';
import 'package:bet_app/screens/webView.dart';
import 'package:bet_app/server/api/api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  Future<void> getToken(
      BuildContext context, int subId, String subPrice, int days) async {
    try {
      var clientApplicationKey = "<Ключ для клиентских приложений>";
      var amount =
          Amount(value: double.parse(subPrice), currency: Currency.rub);
      var shopId = '967194';
      var tokenizationModuleInputData = TokenizationModuleInputData(
        isLoggingEnabled: true,
        tokenizationSettings: const TokenizationSettings(
          PaymentMethodTypes.bankCard,
        ),
        clientApplicationKey:
            'test_OTY3MTk0s5n5YmYu4k6kk1G5Mf6DKjo-DC5xv-CW7hc',
        title: "Подписка на ${days}",
        subtitle: "",
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
        GetPaymentModel? url;
        if (authToken != null) {
          url = await Api().sendPaymentToken(
              token: token, subscriptionId: subId, authToken: authToken);
        }
        if (url!.confirmationUrl!.isNotEmpty) {
          var controller = WebViewController()
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
            ..loadRequest(Uri.parse('${url.confirmationUrl}'));
          await showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    title: Text("Подтверждение"),
                    content: Container(
                      height: 250,
                      child: MyWebView(
                        controller: controller,
                      ),
                    ),
                  ));
          PaymentStatusModel? status =
              await Api().getPayment(authToken!, url!.paymentId!);
          print(status!.paymentStatus);
          if (status.paymentStatus == 'succeeded') {
            LoginResponse? newToken =
                await Api().refreshToken(authToken: authToken);
            await storage.delete(key: 'key');
            await storage.write(key: 'key', value: newToken!.accessToken!);
          }
        }
      } else if (result is ErrorTokenizationResult) {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(content: Text(result.error)));
      }
    } catch (e) {
      print(e);
    }
  }
}
