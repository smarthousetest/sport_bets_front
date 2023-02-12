import 'package:bet_app/components/credit_card.dart';
import 'package:bet_app/const.dart';
import 'package:bet_app/payment.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_credit_card/credit_card_brand.dart';
import 'package:flutter_yookassa_sdk/flutter_yookassa_sdk.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

class PaymentScreen extends StatefulWidget {
  PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
              )),
        ),
        backgroundColor: mainColor,
        body: Column(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.only(top: 100),
                child: CreditCard(),
              ),
            ),
            Container(
                height: 50,
                width: 100,
                child: ElevatedButton(
                    onPressed: () async {
                      Payment payment = Payment();
                      payment.inputData;
                      try {
                        final paymentData = await FlutterYookassaSdk.instance
                            .tokenization(payment.inputData);
                      } on YooKassaException catch (err) {
                        print("Error");
                      }
                    },
                    child: Text("Pay")))
          ],
        ));
  }
}
