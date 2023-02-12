import 'package:bet_app/const.dart';
import 'package:bet_app/models/user_model.dart';
import 'package:bet_app/screens/auth/auth_cubit.dart';
import 'package:bet_app/screens/auth/auth_screen.dart';
import 'package:bet_app/screens/auth/auth_state.dart';
import 'package:bet_app/screens/pay.dart';
import 'package:bet_app/screens/profile_cubit/profile_cubit.dart';
import 'package:bet_app/screens/profile_cubit/profile_state.dart';
import 'package:bet_app/server/api/api.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(builder: (context, state) {
      context.read<ProfileCubit>().takeUserInfo();
      if (state is StratProfileState) {
        return Scaffold(
          backgroundColor: mainColor,
          body: Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 150, right: 15, left: 15),
              child: Stack(children: [
                Image.asset('assets/tran.png'),
                Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Nickname: ${state.userModel!.username}",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                      Row(
                        children: [
                          Text("Account status:",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white)),
                          Row(
                            children: [
                              Image.asset(
                                "assets/activate.png",
                                width: 20,
                                height: 20,
                              ),
                              Text("Activate",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white)),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 60, left: 20, right: 20),
                    child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border:
                                Border.all(color: Color(0xff1cfffd), width: 3)),
                        child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(
                                    Colors.transparent)),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => PaymentScreen()));
                            },
                            child: Text(
                              "Оплата",
                              style: TextStyle(color: Colors.white),
                            ))),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 20, left: 20, right: 20),
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border:
                                Border.all(color: Color(0xff1cfffd), width: 3)),
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(
                                    Colors.transparent)),
                            onPressed: () {},
                            child: Text(
                              "Избранное",
                              style: TextStyle(color: Colors.white),
                            ))),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 20, left: 20, right: 20),
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border:
                                Border.all(color: Color(0xff1cfffd), width: 3)),
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(
                                    Colors.transparent)),
                            onPressed: () {},
                            child: Text(
                              "Помощь",
                              style: TextStyle(color: Colors.white),
                            ))),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 20, left: 20, right: 20),
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border:
                                Border.all(color: Color(0xff1cfffd), width: 3)),
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(
                                    Colors.transparent)),
                            onPressed: () {
                              context.read<AuthBloc>().logout();
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Auth(),
                                  ));
                            },
                            child: Text(
                              "Выйти",
                              style: TextStyle(color: Colors.white),
                            ))),
                  )
                ]),
              ]),
            ),
          ),
        );
      }
      return Container();
    });
  }
}
