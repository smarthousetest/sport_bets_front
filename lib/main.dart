import 'package:bet_app/const.dart';
import 'package:bet_app/screens/auth/auth_cubit.dart';
import 'package:bet_app/screens/bets_screen/admin_screen.dart';
import 'package:bet_app/screens/bets_screen/bet_screen.dart';
import 'package:bet_app/screens/bets_screen/cubit/bet_cubit.dart';
import 'package:bet_app/screens/profile_cubit/profile_cubit.dart';
import 'package:bet_app/screens/profile_screen.dart';
import 'package:bet_app/screens/splash_screen.dart';
import 'package:bet_app/server/api/api.dart';
import 'package:bottom_bar/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (BuildContext context) => AuthBloc(),
        ),
        BlocProvider<BetCubit>(
          create: (BuildContext context) => BetCubit(),
        ),
        BlocProvider<ProfileCubit>(
          create: (BuildContext context) => ProfileCubit(),
        )
      ],
      child: MaterialApp(
        theme: ThemeData(primaryColor: mainColor),
        home: const SplashScreen(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Widget> _children = [BetsScreen(), ProfileScreen()];
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: false,
      appBar: AppBar(
        elevation: 0.5,
        backgroundColor: mainColor,
        leading: GestureDetector(
            onTap: (() {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AdminScreen(),
                  ));
            }),
            child: Icon(Icons.add, color: Colors.white)),
        actions: [
          Image.asset(
            'assets/main.png',
            height: 50,
            width: 50,
          ),
        ],
        title: _currentIndex == 0
            ? Text(
                "Bets",
                style: GoogleFonts.fugazOne(color: Colors.white),
              )
            : Text(
                "Profile",
                style: GoogleFonts.fugazOne(color: Colors.white),
              ),
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomBar(
        padding: EdgeInsets.all(0),
        showActiveBackgroundColor: false,
        height: 50,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        backgroundColor: mainColor,
        selectedIndex: _currentIndex,
        items: <BottomBarItem>[
          BottomBarItem(
              activeColor: mainColor,
              icon: Image.asset(
                "assets/bet_icon.png",
                color: _currentIndex == 1 ? Colors.grey : Colors.white,
                height: 50,
                width: 50,
              )
              // Image(
              //     height: 50,
              //     width: 50,
              //     image: AssetImage(
              //       "assets/bet_icon.png",
              //     ),
              //     color: _currentIndex == 1 ? Colors.grey : Colors.white),
              ),
          BottomBarItem(
            activeColor: Colors.white,
            icon: Icon(
              Icons.person,
              color: _currentIndex == 0 ? Colors.grey : Colors.white,
            ),
          ),
        ],
        onTap: (position) {
          setState(() {
            _currentIndex = position;
          });
        },
      ),
    );
  }
}
