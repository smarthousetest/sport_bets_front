import 'package:bet_app/screens/bets_screen/cubit/bet_cubit.dart';
import 'package:datetime_picker_formfield_new/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  final _formKey = GlobalKey<FormState>();
  final format = DateFormat("yyyy-MM-ddTHH:mm:ss.SSS");
  TextEditingController textEditingController1 = TextEditingController();
  TextEditingController textEditingController2 = TextEditingController();
  TextEditingController textEditingController3 = TextEditingController();
  TextEditingController textEditingController4 = TextEditingController();
  TextEditingController textEditingController5 = TextEditingController();
  TextEditingController textEditingController6 = TextEditingController();
  TextEditingController textEditingController7 = TextEditingController();
  TextEditingController textEditingController8 = TextEditingController();
  TextEditingController textEditingControllerCountry = TextEditingController();
  TextEditingController textEditingControllerMatchTime =
      TextEditingController();
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
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 50, right: 50, top: 20, bottom: 50),
              child: TextFormField(
                validator: (value) {
                  if (value!.isEmpty) return 'Поле не может быть пустым';
                  return null;
                },
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
              padding: const EdgeInsets.only(
                  left: 50, right: 50, top: 20, bottom: 50),
              child: TextFormField(
                validator: (value) {
                  if (value!.isEmpty) return 'Поле не может быть пустым';
                  return null;
                },
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
              padding: const EdgeInsets.only(
                  left: 50, right: 50, top: 20, bottom: 50),
              child: TextFormField(
                validator: (value) {
                  if (value!.isEmpty) return 'Поле не может быть пустым';
                  return null;
                },
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
              padding: const EdgeInsets.only(
                  left: 50, right: 50, top: 20, bottom: 50),
              child: TextFormField(
                validator: (value) {
                  if (value!.isEmpty) return 'Поле не может быть пустым';
                  return null;
                },
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
              padding: const EdgeInsets.only(
                  left: 50, right: 50, top: 20, bottom: 50),
              child: TextFormField(
                validator: (value) {
                  if (value!.isEmpty) return 'Поле не может быть пустым';
                  return null;
                },
                controller: textEditingControllerCountry,
                enableSuggestions: false,
                autocorrect: false,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  hintText: "Страна",
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
              padding: const EdgeInsets.only(
                  left: 50, right: 50, top: 20, bottom: 50),
              child: TextFormField(
                validator: (value) {
                  if (value!.isEmpty) return 'Поле не может быть пустым';
                  return null;
                },
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
              padding: const EdgeInsets.only(
                  left: 50, right: 50, top: 20, bottom: 50),
              child: TextFormField(
                validator: (value) {
                  if (value!.isEmpty) return 'Поле не может быть пустым';
                  if (int.parse(value) > 100 || int.parse(value) == 0)
                    return 'Число должно быть не больше ста и не равно 0';
                  return null;
                },
                keyboardType: TextInputType.number,
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
              padding: const EdgeInsets.only(
                  left: 50, right: 50, top: 20, bottom: 50),
              child: TextFormField(
                validator: (value) {
                  if (value!.isEmpty) return 'Поле не может быть пустым';
                  if (value.contains(',')) return 'Используйте . вместо ,';
                  return null;
                },
                keyboardType: TextInputType.number,
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
              padding: const EdgeInsets.only(
                  left: 50, right: 50, top: 20, bottom: 50),
              child: TextFormField(
                validator: (value) {
                  if (value!.isEmpty) return 'Поле не может быть пустым';
                  return null;
                },
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
            DateTimeField(
              validator: (value) {
                if (value == null) return 'Поле не может быть пустым';
                return null;
              },
              controller: textEditingControllerMatchTime,
              format: format,
              onShowPicker: (context, currentValue) async {
                return await showDatePicker(
                  context: context,
                  firstDate: DateTime(1900),
                  initialDate: currentValue ?? DateTime.now(),
                  lastDate: DateTime(2100),
                ).then((DateTime? date) async {
                  if (date != null) {
                    final time = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.fromDateTime(
                          currentValue ?? DateTime.now()),
                    );
                    return DateTimeField.combine(date, time);
                  } else {
                    return currentValue;
                  }
                });
              },
            ),
            ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    var date =
                        format.parse(textEditingControllerMatchTime.text);
                    context.read<BetCubit>().addBet(
                          textEditingController4.text,
                          textEditingController3.text,
                          textEditingController1.text,
                          textEditingController2.text,
                          double.parse(textEditingController7.text),
                          double.parse(textEditingController6.text),
                          textEditingController5.text,
                          textEditingControllerCountry.text,
                          date.toUtc().toIso8601String(),
                          textEditingController8.text,
                        );
                    context.read<BetCubit>().getBets();
                    Navigator.pop(context);
                  }
                },
                child: Text('Выложить'))
          ]),
        ),
      ),
    );
  }
}
