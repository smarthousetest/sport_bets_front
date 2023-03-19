import 'dart:convert';
import 'dart:ffi';

import 'package:bet_app/const.dart';
import 'package:bet_app/models/bet_model.dart';
import 'package:dio/dio.dart';

import '../../models/login_response.dart';

class Api {
  Future<LoginResponse?> signInByCredentials(
      {required String username, required String password}) async {
    try {
      Map<String, String> body = {'username': username, 'password': password};
      final response =
          await Dio().post('${ApiConst().api}auth/login', data: body);
      print(response.data);

      return LoginResponse.fromJson(response.data);
    } on DioError catch (e, st) {
      print(e);
    }
  }

  Future registerInApp(
      {required String username, required String email}) async {
    try {
      Map<String, String> body = {'username': username, 'email': email};
      final response =
          await Dio().post('${ApiConst().api}auth/register', data: body);
      return response.statusCode;
      // ignore: nullable_type_in_catch_clause
    } on DioError catch (e, st) {
      Map<String, dynamic> map = e.response!.data;
      return map['message'];
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
        "comment": comment,
        "betSuccessful": null
      };
      final response = await Dio().post('${ApiConst().api}betting-advice',
          data: body,
          options: Options(headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer $token",
          }));
      print(response);
      if (response.statusCode == 201) {
        print("dasdasd");
      }
    } on DioError catch (e, st) {}
  }

  Future deleteBet({required String token, required int id}) async {
    try {
      final response = await Dio().delete('${ApiConst().api}betting-advice/$id',
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
      final response = await Dio().get('${ApiConst().api}betting-advice',
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

  Future<String> sendPaymentToken(
      {required String token,
      required double amount,
      required String currency,
      required String authToken}) async {
    Map<String, dynamic> body = {
      "amount": amount,
      "currency": 'RUB',
      "token": token
    };
    try {
      final response = await Dio().post('${ApiConst().api}yookassa',
          data: body,
          options: Options(headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer $authToken",
          }));
      Map<String, dynamic> map = response.data;
      if (map.containsKey('confirmationUrl')) {
        return map['confirmationUrl'];
      } else {
        return '';
      }
    } catch (e) {
      print('error $e');
      return '';
    }
  }

  Future changeBetStatus({required status, required id, required token}) async {
    Map<String, dynamic> body = {
      "betSuccessful": status,
    };
    try {
      final response = await Dio().patch('${ApiConst().api}betting-advice/$id',
          data: body,
          options: Options(headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer $token",
          }));
      print(response);
      if (response.statusCode == 200) {
        print("dasdasd");
      }
    } on DioError catch (e, st) {}
  }
}
