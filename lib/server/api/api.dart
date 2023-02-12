import 'dart:convert';
import 'dart:ffi';

import 'package:bet_app/models/bet_model.dart';
import 'package:bet_app/screens/bets_screen/cubit/bet_cubit.dart';
import 'package:dio/dio.dart';
import 'package:jwt_decode/jwt_decode.dart';

import '../../models/login_response.dart';

class Api {
  Future<LoginResponse?> signInByCredentials(
      {required String username, required String password}) async {
    try {
      Map<String, String> body = {'username': username, 'password': password};
      final response =
          await Dio().post('http://31.31.202.80:3000/auth/login', data: body);
      print(response.data);

      return LoginResponse.fromJson(response.data);
    } on DioError catch (e, st) {
      print(e);
    }
  }

  Future<bool> registerInApp(
      {required String username, required String email}) async {
    try {
      Map<String, String> body = {'username': username, 'email': email};
      final response =
          await Dio().post('http://31.31.202.80:3000/auth/login', data: body);
      return response.statusCode == 201;
    } on DioError catch (e, st) {
      return false;
    }
  }

  Future addBet(
      {required String sportType,
      required String league,
      required String teamFirst,
      required String teamSecond,
      required double bettingOdds,
      required double probability,
      required String bet,
      required String comment,
      required String token}) async {
    try {
      Map<String, dynamic> body = {
        "sportType": sportType,
        "league": league,
        "teamFirst": teamFirst,
        "teamSecond": teamSecond,
        "bettingOdds": bettingOdds,
        "probability": probability,
        "bet": bet,
        "comment": comment
      };
      final response =
          await Dio().post('http://31.31.202.80:3000/betting-advice',
              data: body,
              options: Options(headers: {
                "Content-Type": "application/json",
                "Authorization": "Bearer $token",
              }));
      if (response.statusCode == 201) {
        print("dasdasd");
      }
    } on DioError catch (e, st) {}
  }

  Future deleteBet({required String token, required int id}) async {
    try {
      final response =
          await Dio().delete('http://31.31.202.80:3000/betting-advice/$id',
              options: Options(headers: {
                "Content-Type": "application/json",
                "Authorization": "Bearer $token",
              }));
      if (response.statusCode == 200) {
        print("dasdasd");
      }
    } on DioError catch (e, st) {}
  }

  Future<List<BetModel>?> getBets(String token) async {
    try {
      final response =
          await Dio().get('http://31.31.202.80:3000/betting-advice',
              options: Options(headers: {
                "Content-Type": "application/json",
                "Authorization": "Bearer $token",
              }));
      print(response.data);
      List res = response.data;
      if (response.statusCode == 200) {
        return res.map((r) => BetModel.fromJson(r)).toList();
      }
    } on DioError catch (e, st) {}
  }
}
