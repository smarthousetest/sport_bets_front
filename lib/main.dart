import 'package:bet_app/const.dart';
import 'package:bet_app/firebase/firebase_local_notification.dart';
import 'package:bet_app/firebase/firebase_options.dart';
import 'package:bet_app/models/user_model.dart';
import 'package:bet_app/push_notification.dart';
import 'package:bet_app/screens/auth/auth_cubit.dart';
import 'package:bet_app/screens/bets_screen/admin_screen.dart';
import 'package:bet_app/screens/bets_screen/bet_screen.dart';
import 'package:bet_app/screens/bets_screen/cubit/bet_cubit.dart';
import 'package:bet_app/screens/profile_cubit/profile_cubit.dart';
import 'package:bet_app/screens/profile_screen.dart';
import 'package:bet_app/screens/splash_screen.dart';
import 'package:bottom_bar/bottom_bar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'screens/auth/auth_state.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();

  print("Handling a background message: ${message.messageId}");
  print("message: ${message.data}");
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  WebViewPlatform.instance;
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  await messaging.subscribeToTopic('new-betting-advices');
  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );

  print('User granted permission: ${settings.authorizationStatus}');
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    print('Got a message whilst in the foreground!');
    print('Message data: ${message.data}');

    if (message.notification != null) {
      print('Message also contained a notification: ${message.notification}');
    }
  });
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  // await FlutterNotification().registerNotification();
  print('fire token ${await FirebaseMessaging.instance.getToken()}');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final AuthBloc cubit = AuthBloc();
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
        home: BlocBuilder<AuthBloc, AuthState>(
            bloc: cubit,
            builder: (context, state) {
              if (state is NotAuthState) {
                cubit.checkToken();
              }
              // if (cubit.state is AuthSuccessState) {
              //   WidgetsBinding.instance!.addPostFrameCallback((_) {
              //     Navigator.push(context,
              //         MaterialPageRoute(builder: (context) => MyHomePage()));
              //   });
              // }
              return SplashScreen(
                state: state,
              );
            }),
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
  @override
  void initState() {
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      PushNotification notification = PushNotification(
        title: message.notification?.title,
        body: message.notification?.body,
      );
    });
    super.initState();
  }

  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
      context.read<AuthBloc>().checkOnAdmin();
      if (state is NotAuthState) {
        return Scaffold(
          backgroundColor: mainColor,
          extendBody: false,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            elevation: 0.5,
            backgroundColor: mainColor,
            leading: state.isAdmin
                ? GestureDetector(
                    onTap: (() {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AdminScreen(),
                          ));
                    }),
                    child: Icon(Icons.add, color: Colors.white))
                : null,
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
          bottomNavigationBar: SafeArea(
            child: BottomBar(
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
          ),
        );
      }
      return Container();
    });
  }
}
