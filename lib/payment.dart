import 'package:flutter/material.dart';
import 'package:yookassa_payments_flutter/yookassa_payments_flutter.dart';

class Payment {
  final inputData = TokenizationModuleInputData(
    title: "bet",
    subtitle: 'bet bet',
    clientApplicationKey:
        'test_OTY3MTk0s5n5YmYu4k6kk1G5Mf6DKjo-DC5xv-CW7hctest_OTY3MTk0s5n5YmYu4k6kk1G5Mf6DKjo-DC5xv-CW7hc',
    savePaymentMethod: SavePaymentMethod.userSelects,
    amount: Amount(value: 999.9, currency: Currency.rub),
    shopId: '967194',
    isLoggingEnabled: false,
    moneyAuthClientId: 'r1rtv7bi6467ie40m03r0vdff3qad52i',
    googlePayParameters: GooglePayParameters(),
  );
  Future<void> getToken() async {
    var result = await YookassaPaymentsFlutter.tokenization(inputData);
    if (result is SuccessTokenizationResult) {
      var token = result.token;
      var paymentMethodType = result.paymentMethodType;
    } else if (result is ErrorTokenizationResult) {
      // showDialog(
      //     context: context,
      //     builder: (context) => AlertDialog(content: Text(result.error)));
      return;
    }
  }
}
