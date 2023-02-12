import 'dart:async';

import 'package:bet_app/main.dart';
import 'package:bet_app/screens/auth/auth_cubit.dart';
import 'package:bet_app/screens/auth/auth_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5), () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => Auth()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset('assets/main_splash.png'),
    );
  }
}
