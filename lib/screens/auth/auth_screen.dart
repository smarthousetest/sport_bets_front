import 'package:bet_app/const.dart';
import 'package:bet_app/main.dart';
import 'package:bet_app/screens/auth/auth_cubit.dart';
import 'package:bet_app/screens/auth/auth_state.dart';
import 'package:bet_app/screens/auth/registr_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class Auth extends StatefulWidget {
  const Auth({super.key});

  @override
  State<Auth> createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  final AuthBloc cubit = AuthBloc();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: mainColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 50),
            child: Image.asset(
              'assets/main_splash.png',
              width: 150,
              height: 150,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 50),
            child: const Text(
              "Авторизация",
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 50, right: 50),
            child: TextFormField(
              controller: email,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: "Email",
                hintStyle: TextStyle(color: Colors.white),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(width: 3, color: Colors.white),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(width: 3, color: Colors.white),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 50, right: 50, top: 20, bottom: 150),
            child: TextFormField(
              controller: password,
              obscureText: true,
              enableSuggestions: false,
              autocorrect: false,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: "Пароль",
                hintStyle: TextStyle(color: Colors.white),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(width: 3, color: Colors.white),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(width: 3, color: Colors.white),
                ),
              ),
            ),
          ),
          BlocBuilder<AuthBloc, AuthState>(
            bloc: cubit,
            builder: (context, state) {
              if (state is NotAuthState) {
                cubit.checkToken();
              }
              if (cubit.state is AuthSuccessState) {
                WidgetsBinding.instance!.addPostFrameCallback((_) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MyHomePage()));
                });
              }
              return Column(children: [
                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(Colors.white)),
                    onPressed: () async {
                      await cubit.sendData(email.text, password.text);
                      // if (cubit.state is AuthSuccessState) {
                      //   Navigator.pushReplacement(
                      //       context,
                      //       MaterialPageRoute(
                      //           builder: (context) => MyHomePage()));
                      // }
                    },
                    child: Text(
                      "Войти",
                      style: GoogleFonts.ballet(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w600),
                    )),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Registr()));
                    },
                    child: Text(
                      "Зарегестрироваться",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )
              ]);
            },
          )
        ],
      ),
    );
  }
}
