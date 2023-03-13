import 'dart:ffi';

import 'package:bet_app/const.dart';
import 'package:bet_app/screens/auth/auth_cubit.dart';
import 'package:bet_app/screens/auth/auth_state.dart';
import 'package:bet_app/screens/bets_screen/cubit/bet_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CardModel extends StatefulWidget {
  String teamFirst;
  String teamSecond;
  int index;
  int id;
  CardModel(
      {required this.teamFirst,
      required this.teamSecond,
      required this.index,
      required this.id});
  @override
  State<CardModel> createState() => _CardModelState();
}

class _CardModelState extends State<CardModel> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 155,
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xffff735e)),
        borderRadius: BorderRadius.circular(10),
        color: mainColor,
      ),
      child: Stack(
        children: [
          BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
            context.read<AuthBloc>().checkOnAdmin;
            if (state is NotAuthState) {
              if (state.isAdmin)
                return Align(
                  alignment: Alignment.topRight,
                  child: GestureDetector(
                    onTap: () {
                      context.read<BetCubit>().deleteBets(widget.id);
                      context.read<BetCubit>().getBets();
                    },
                    child: Container(
                        height: 30,
                        width: 30,
                        child: SvgPicture.asset('assets/delete.svg')),
                  ),
                );
            }
            return Container();
          }),
          Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Padding(
              padding: const EdgeInsets.only(left: 5, right: 5),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xff1cfffd)),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Center(
                      child: Text(
                    widget.teamFirst,
                    style: GoogleFonts.bitter(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: Colors.white),
                  )),
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(left: 5, right: 5),
                child:
                    Container(height: 60, child: Image.asset('assets/vs.jpg'))),
            Padding(
              padding: const EdgeInsets.only(left: 5, right: 5),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xff1cfffd)),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: EdgeInsets.all(5),
                  child: Center(
                      child: Text(
                    widget.teamSecond,
                    style: GoogleFonts.bitter(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: Colors.white),
                  )),
                ),
              ),
            ),
          ]),
        ],
      ),
    );
  }
}
