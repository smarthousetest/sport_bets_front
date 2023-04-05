import 'package:bet_app/screens/subscription_screen/sub_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SubScreenAdmin extends StatefulWidget {
  const SubScreenAdmin({super.key});

  @override
  State<SubScreenAdmin> createState() => _SubScreenAdminState();
}

class _SubScreenAdminState extends State<SubScreenAdmin> {
  TextEditingController textEditingController1 = TextEditingController();
  TextEditingController textEditingController2 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Новые подписки"),
        leadingWidth: 100,
        leading: IconButton(
            onPressed: () {
              context.read<SubCubit>().getSub();
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
              keyboardType: TextInputType.number,
              controller: textEditingController1,
              enableSuggestions: false,
              autocorrect: false,
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                hintText: "Кол-во дней",
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
              keyboardType: TextInputType.number,
              controller: textEditingController2,
              enableSuggestions: false,
              autocorrect: false,
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                hintText: "Цена",
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
                context.read<SubCubit>().addSub(
                    int.parse(textEditingController1.text),
                    int.parse(textEditingController2.text));
                context.read<SubCubit>().getSub();
                Navigator.pop(context);
              },
              child: Text('Выложить'))
        ]),
      ),
    );
  }
}
