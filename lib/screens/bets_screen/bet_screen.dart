import 'package:bet_app/cards_model.dart';
import 'package:bet_app/const.dart';
import 'package:bet_app/models/bet_model.dart';
import 'package:bet_app/screens/bets_screen/cubit/bet_cubit.dart';
import 'package:bet_app/screens/bets_screen/cubit/bet_state.dart';
import 'package:bet_app/screens/bets_screen/tap_bets_screen.dart';
import 'package:bet_app/server/api/api.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BetsScreen extends StatefulWidget {
  const BetsScreen({super.key});

  @override
  State<BetsScreen> createState() => _BetsScreenState();
}

class _BetsScreenState extends State<BetsScreen> {
  @override
  Widget build(BuildContext context) {
    context.read<BetCubit>().getBets();
    context.read<BetCubit>().emit(BetLoading());
    return Scaffold(
        backgroundColor: mainColor,
        body: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
          child:
              BlocBuilder<BetCubit, BetCubitState>(builder: (context, state) {
            if (state is BetLoading) {
              return Center(child: CircularProgressIndicator());
            }
            if (state is BetLoaded) {
              return GridView.builder(
                itemCount: state.betModel!.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  List<BetModel> list = state.betModel!.reversed.toList();
                  return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TapBet(
                                      teamFirst: list[index].teamFirst,
                                      teamSecond: list[index].teamSecond,
                                      bet: list[index].bet,
                                      bettingOdds: list[index].bettingOdds,
                                      sportType: list[index].sportType,
                                      league: list[index].league,
                                      comment: list[index].comment,
                                      probability: list[index].probability,
                                    )));
                      },
                      child: CardModel(
                        teamFirst: list[index].teamFirst!,
                        teamSecond: list[index].teamSecond!,
                        index: index,
                      ));
                },
              );
            }
            if (state is BetIsEmpty) {
              return Center(
                child: Text("Is Emty"),
              );
            }
            return Text("data");
          }),
        ));
  }
}
