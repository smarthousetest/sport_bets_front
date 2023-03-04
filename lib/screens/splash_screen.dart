import 'dart:async';

import 'package:bet_app/main.dart';
import 'package:bet_app/screens/auth/auth_cubit.dart';
import 'package:bet_app/screens/auth/auth_screen.dart';
import 'package:bet_app/screens/auth/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatefulWidget {
  AuthState state;
  SplashScreen({super.key, required this.state});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () {
      // ignore: unrelated_type_equality_checks
      if (widget.state is! AuthSuccessState) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Auth()));
      } else {
        // WidgetsBinding.instance!.addPostFrameCallback((_) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => MyHomePage()));
        // });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset('assets/main_splash.png'),
    );
  }
}
