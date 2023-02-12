import 'package:flutter_yookassa_sdk/flutter_yookassa_sdk.dart';

class Payment {
  final inputData = const TokenizationModuleInputData(
    clientApplicationKey: "test_s6jZq4CQKGlI8supXU7tt0VqYIApIWlNuODvjMFmYCU",
    shopName: "Космические объекты",
    purchaseDescription:
        "Комета повышенной яркости, период обращения — 112 лет",
    amount: Amount(value: 999, currency: Currency.rub()),
    savePaymentMethod: SavePaymentMethod.userSelects,
    shopId: '967194',
    tokenizationSettings: TokenizationSettings(
      paymentMethodTypes: PaymentMethodTypes.bankCard(),
      showYooKassaLogo: false,
    ),
    moneyAuthClientId: 'client_id',
    googlePayParameters: GooglePayParameters(),
  );
}
