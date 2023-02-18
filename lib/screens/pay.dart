import 'package:bet_app/components/banner.dart';
import 'package:bet_app/components/credit_card.dart';
import 'package:bet_app/const.dart';
import 'package:bet_app/payment.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_credit_card/credit_card_brand.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yookassa_payments_flutter/yookassa_payments_flutter.dart';

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
          title: Text(
            'Оплата подписки',
            style: GoogleFonts.fugazOne(color: Colors.white),
          ),
          backgroundColor: Colors.black,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
              )),
        ),
        backgroundColor: mainColor,
        body: Column(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.only(top: 100),
                child: BannerSub(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Container(
                  height: 50,
                  width: 150,
                  child: ElevatedButton(
                      style: ButtonStyle(
                          side: MaterialStateBorderSide.resolveWith(
                              (states) => BorderSide(color: Colors.white)),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.transparent)),
                      onPressed: () async {
                        Payment payment = Payment();
                        payment.getToken();
                      },
                      child: Text("Оплатить 999 рублей"))),
            )
          ],
        ));
  }
}
