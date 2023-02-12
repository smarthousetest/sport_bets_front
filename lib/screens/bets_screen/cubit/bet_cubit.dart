import 'dart:ffi';

import 'package:bet_app/models/bet_model.dart';
import 'package:bet_app/screens/auth/auth_state.dart';
import 'package:bet_app/screens/bets_screen/cubit/bet_state.dart';
import 'package:bet_app/server/api/api.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../auth/auth_cubit.dart';

class BetCubit extends Cubit<BetCubitState> {
  Api? api = Api();
  BetCubit() : super(NoBetState());

  Future<void> addBet(
      String sportType,
      String league,
      String teamFirst,
      String teamSecond,
      double bettingOdds,
      double probability,
      String bet,
      String comment) async {
    String? token = await storage.read(key: 'key');
    if (token != null) {
      await api?.addBet(
          sportType: sportType,
          league: league,
          teamFirst: teamFirst,
          teamSecond: teamSecond,
          bettingOdds: bettingOdds,
          probability: probability,
          bet: bet,
          comment: comment,
          token: token);
    }
  }

  Future<void> deleteBets(int id) async {
    String? token = await storage.read(key: 'key');
    await api?.deleteBet(token: token!, id: id);
  }

  Future<void> getBets() async {
    Api api = Api();
    emit(BetLoading());
    String? token = await storage.read(key: 'key');
    print("toks = $token");
    if (token != null) {
      List<BetModel>? bet = await api.getBets(token);
      if (bet!.isEmpty) {
        emit(BetIsEmpty());
      } else {
        emit(BetLoaded(betModel: bet));
      }
    }
  }
}
