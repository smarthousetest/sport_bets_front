// ignore_for_file: prefer_const_constructors

import 'dart:core';
import 'package:bet_app/const.dart';
import 'package:bet_app/screens/auth/auth_cubit.dart';
import 'package:bet_app/screens/auth/auth_state.dart';
import 'package:bet_app/screens/bets_screen/cubit/bet_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';

class TapBet extends StatefulWidget {
  String? sportType;
  String? league;
  String? teamFirst;
  String? teamSecond;
  String? bettingOdds;
  String? probability;
  String? bet;
  String? comment;
  int? bettingId;
  bool? betSuccess;
  TapBet(
      {super.key,
      this.bet,
      this.bettingOdds,
      this.comment,
      this.league,
      this.probability,
      this.sportType,
      this.teamFirst,
      this.teamSecond,
      this.bettingId,
      this.betSuccess});

  @override
  State<TapBet> createState() => _TapBetState();
}

class _TapBetState extends State<TapBet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
          if (state is NotAuthState) {
            if (state.isAdmin)
              return Text(
                "Статус ставки: ${widget.betSuccess}",
                style: TextStyle(color: Colors.white, fontSize: 12),
              );
          }
          return Container();
        }),
        actions: [
          BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
            context.read<AuthBloc>().checkOnAdmin;
            if (state is NotAuthState) {
              if (state.isAdmin)
                // ignore: curly_braces_in_flow_control_structures
                return Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          context
                              .read<BetCubit>()
                              .changeStatus(widget.bettingId!, true);
                        },
                        child: Text(
                          'Зашла',
                          style: TextStyle(color: Colors.green),
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      GestureDetector(
                        onTap: () {
                          context
                              .read<BetCubit>()
                              .changeStatus(widget.bettingId!, false);
                        },
                        child: Text(
                          'Не зашла',
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      GestureDetector(
                        onTap: () {
                          context
                              .read<BetCubit>()
                              .changeStatus(widget.bettingId!, null);
                        },
                        child: Text(
                          'Не сыграла',
                          style: TextStyle(color: Colors.red),
                        ),
                      )
                    ],
                  ),
                );
            }
            return Container();
          })
        ],
        backgroundColor: mainColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0,
      ),
      backgroundColor: mainColor,
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 0),
            child: Center(
                child: Text(
              widget.teamFirst ?? "",
              style: GoogleFonts.bitter(
                  fontWeight: FontWeight.w600,
                  fontSize: 24,
                  color: Colors.white),
            )),
          ),
          // Image.network(
          //   "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b4/Zenit_St_Peterburg_logo.svg/300px-Zenit_St_Peterburg_logo.svg.png",
          //   width: 60,
          //   height: 60,
          // ),
          Padding(
              padding: const EdgeInsets.only(left: 5, right: 5),
              child:
                  Container(height: 60, child: Image.asset('assets/vs.jpg'))),
          Padding(
            padding: EdgeInsets.all(5),
            child: Center(
                child: Text(
              widget.teamSecond ?? "",
              style: GoogleFonts.bitter(
                  fontWeight: FontWeight.w600,
                  fontSize: 24,
                  color: Colors.white),
            )),
          ),
          Divider(
            height: 50,
            thickness: 2,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              "Спорт: ${widget.sportType}",
              style: GoogleFonts.abel(
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                  color: Colors.white),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 50, right: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Страна: Испания",
                  style: GoogleFonts.abel(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
                Text(
                  "Лига: ${widget.league}",
                  style: GoogleFonts.abel(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 50, right: 50),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Стаква: ${widget.bet}",
                    style: GoogleFonts.abel(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                  Text(
                    "Кэф-т: ${widget.bettingOdds}",
                    style: GoogleFonts.abel(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  )
                ]),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 40),
            child: Text(
              "Вероятность захода",
              style: TextStyle(color: Colors.white),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 10, top: 20),
            child: new LinearPercentIndicator(
              width: 170.0,
              animation: true,
              animationDuration: 1000,
              lineHeight: 20.0,
              leading: new Text("left content"),
              trailing: new Text("right content"),
              percent: double.parse(widget.probability!) / 100,
              center: Text(widget.probability.toString()),
              linearStrokeCap: LinearStrokeCap.butt,
              progressColor: Color(0xff1cfffd),
            ),
          ),

          Divider(
            thickness: 0.1,
            height: 50,
            color: Colors.white,
          ),
          Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
              child: Text(
                "Коментарий: ${widget.comment}",
                style: GoogleFonts.abel(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              )),
          Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(
                'assets/tran.png',
              ),
              Padding(
                padding: const EdgeInsets.only(top: 0, bottom: 100),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Color(0xff1cfffd), width: 3)),
                  height: 60,
                  width: 250,
                  child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.transparent)),
                      onPressed: () {},
                      child: Text(
                        "Отслеживать событие",
                        style: GoogleFonts.ballet(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontSize: 15,
                            fontWeight: FontWeight.w600),
                      )),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
