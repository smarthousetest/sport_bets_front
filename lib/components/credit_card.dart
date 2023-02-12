import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CreditCard extends StatefulWidget {
  const CreditCard({super.key});

  @override
  State<CreditCard> createState() => _CreditCardState();
}

class _CreditCardState extends State<CreditCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10, left: 10),
      child: Container(
        height: 200,
        decoration: BoxDecoration(
            border:
                Border.all(color: Color.fromARGB(255, 30, 0, 255), width: 5),
            borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 5, right: 5),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: "Номер карты",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30, left: 15),
                  child: Container(
                    width: 80,
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "MM/YY",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30, right: 23),
                  child: Container(
                    width: 80,
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "CVV",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
