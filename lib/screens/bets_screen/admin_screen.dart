import 'package:bet_app/screens/bets_screen/cubit/bet_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  TextEditingController textEditingController1 = TextEditingController();
  TextEditingController textEditingController2 = TextEditingController();
  TextEditingController textEditingController3 = TextEditingController();
  TextEditingController textEditingController4 = TextEditingController();
  TextEditingController textEditingController5 = TextEditingController();
  TextEditingController textEditingController6 = TextEditingController();
  TextEditingController textEditingController7 = TextEditingController();
  TextEditingController textEditingController8 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              context.read<BetCubit>().getBets();
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Padding(
            padding:
                const EdgeInsets.only(left: 50, right: 50, top: 20, bottom: 50),
            child: TextFormField(
              controller: textEditingController1,
              enableSuggestions: false,
              autocorrect: false,
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                hintText: "Команда один",
                hintStyle: TextStyle(color: Colors.black),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(width: 3, color: Colors.black),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(width: 3, color: Colors.black),
                ),
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 50, right: 50, top: 20, bottom: 50),
            child: TextFormField(
              controller: textEditingController2,
              enableSuggestions: false,
              autocorrect: false,
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                hintText: "Команда два",
                hintStyle: TextStyle(color: Colors.black),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(width: 3, color: Colors.black),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(width: 3, color: Colors.black),
                ),
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 50, right: 50, top: 20, bottom: 50),
            child: TextFormField(
              controller: textEditingController3,
              enableSuggestions: false,
              autocorrect: false,
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                hintText: "Лига",
                hintStyle: TextStyle(color: Colors.black),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(width: 3, color: Colors.black),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(width: 3, color: Colors.black),
                ),
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 50, right: 50, top: 20, bottom: 50),
            child: TextFormField(
              controller: textEditingController4,
              enableSuggestions: false,
              autocorrect: false,
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                hintText: "Спорт",
                hintStyle: TextStyle(color: Colors.black),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(width: 3, color: Colors.black),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(width: 3, color: Colors.black),
                ),
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 50, right: 50, top: 20, bottom: 50),
            child: TextFormField(
              controller: textEditingController5,
              enableSuggestions: false,
              autocorrect: false,
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                hintText: "Ставка",
                hintStyle: TextStyle(color: Colors.black),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(width: 3, color: Colors.black),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(width: 3, color: Colors.black),
                ),
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 50, right: 50, top: 20, bottom: 50),
            child: TextFormField(
              keyboardType: TextInputType.numberWithOptions(decimal: true),
               inputFormatters: [
    FilteringTextInputFormatter.allow(RegExp('[0-9.,]')),
  ],
              controller: textEditingController6,
              enableSuggestions: false,
              autocorrect: false,
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                hintText: "Вероятность захода",
                hintStyle: TextStyle(color: Colors.black),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(width: 3, color: Colors.black),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(width: 3, color: Colors.black),
                ),
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 50, right: 50, top: 20, bottom: 50),
            child: TextFormField(
              keyboardType: TextInputType.numberWithOptions(decimal: true),
               inputFormatters: [
    FilteringTextInputFormatter.allow(RegExp('[0-9.,]')),
  ],
              controller: textEditingController7,
              enableSuggestions: false,
              autocorrect: false,
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                hintText: "Кэф",
                hintStyle: TextStyle(color: Colors.black),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(width: 3, color: Colors.black),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(width: 3, color: Colors.black),
                ),
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 50, right: 50, top: 20, bottom: 50),
            child: TextFormField(
              controller: textEditingController8,
              enableSuggestions: false,
              autocorrect: false,
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                hintText: "Коммент",
                hintStyle: TextStyle(color: Colors.black),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(width: 3, color: Colors.black),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(width: 3, color: Colors.black),
                ),
              ),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                context.read<BetCubit>().addBet(
                    textEditingController4.text,
                    textEditingController3.text,
                    textEditingController1.text,
                    textEditingController2.text,
                    double.parse(textEditingController7.text),
                    double.parse(textEditingController6.text),
                    textEditingController5.text,
                    textEditingController8.text);
                context.read<BetCubit>().getBets();
                Navigator.pop(context);
              },
              child: Text('Выложить'))
        ]),
      ),
    );
  }
}
