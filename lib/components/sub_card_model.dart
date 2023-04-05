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

class SubCardModel extends StatefulWidget {
  bool isClicked;
  int days;
  String price;
  int id;
  SubCardModel(
      {required this.days,
      required this.price,
      required this.id,
      required this.isClicked});
  @override
  State<SubCardModel> createState() => _SubCardModelState();
}

class _SubCardModelState extends State<SubCardModel> {
  bool isClicked = false;
  @override
  void setState(VoidCallback fn) {
    isClicked = widget.isClicked;
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 200,
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xffff735e)),
        borderRadius: BorderRadius.circular(10),
        color: widget.isClicked ? Colors.yellow : mainColor,
      ),
      child: Stack(
        children: [
          BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
            context.read<AuthBloc>().checkOnAdmin;
            if (state is NotAuthState) {
              if (state.isAdmin)
                return GestureDetector(
                  onTap: () {
                    context.read<BetCubit>().deleteBets(widget.id);

                    context.read<BetCubit>().getBets();
                  },
                  child: Container(
                      height: 30,
                      width: 30,
                      child: SvgPicture.asset('assets/delete.svg')),
                );
            }
            return Container();
          }),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "${widget.days} дней",
                  style: GoogleFonts.bitter(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color: Colors.white),
                ),
                Text(
                  '${widget.price} рублей',
                  style: GoogleFonts.bitter(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color: Colors.white),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
