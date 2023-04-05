import 'dart:convert';
import 'dart:ffi';

import 'package:bet_app/const.dart';
import 'package:bet_app/models/bet_model.dart';
import 'package:bet_app/models/payment_model.dart';
import 'package:bet_app/models/sub_model.dart';
import 'package:bet_app/screens/auth/auth_cubit.dart';
import 'package:dio/dio.dart';
import 'package:intl/intl.dart';

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

  Future registerInApp({
    required String username,
    required String email,
  }) async {
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
      required String country,
      required String matchTime,
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
        "country": country,
        "matchBeginning": matchTime,
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
    } on DioError catch (e, st) {
      print(e);
    }
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

  Future<BetsModel?> getBets(String token) async {
    try {
      final response = await Dio().get('${ApiConst().api}betting-advice',
          options: Options(headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer $token",
          }));
      print(response.data);
      if (response.statusCode == 200) {
        return BetsModel.fromJson(response.data);
      }
    } on DioError catch (e, st) {}
  }

  Future<List<SubModel>?> getSubs(String token) async {
    try {
      final response = await Dio().get('${ApiConst().api}subscription',
          options: Options(headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer $token",
          }));
      print(response.data);
      List responseList = response.data as List;
      print('responce list $responseList');
      if (response.statusCode == 200) {
        return responseList.map((job) => new SubModel.fromJson(job)).toList();
      }
    } on DioError catch (e, st) {}
  }

  Future addSub(
      {required int days, required int price, required String token}) async {
    try {
      Map<String, dynamic> body = {
        "subscriptionDurationInDays": days,
        "subscriptionPrice": price
      };
      final response = await Dio().post('${ApiConst().api}subscription',
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

  Future<PaymentStatusModel?> getPayment(String token, String paymentId) async {
    try {
      print('${ApiConst().api}payment/$paymentId');
      final response =
          await Dio().get('${ApiConst().api}yookassa/payment/$paymentId',
              options: Options(headers: {
                "Content-Type": "application/json",
                "Authorization": "Bearer $token",
              }));
      print(response);
      if (response.statusCode == 200) {
        return PaymentStatusModel.fromJson(response.data);
      }
    } on DioError catch (e, st) {}
  }

  Future<GetPaymentModel?> sendPaymentToken(
      {required String token,
      required int subscriptionId,
      required String authToken}) async {
    Map<String, dynamic> body = {
      "subscriptionId": subscriptionId,
      "token": token
    };
    try {
      final response = await Dio().post('${ApiConst().api}yookassa/payment',
          data: body,
          options: Options(headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer $authToken",
          }));

      return GetPaymentModel.fromJson(response.data);
    } catch (e) {
      print('error $e');
    }
  }

  Future<LoginResponse?> refreshToken({String? authToken}) async {
    try {
      final response = await Dio().post('${ApiConst().api}auth/refresh-token',
          options: Options(headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer $authToken",
          }));
      if (response.statusCode == 201) {
        return LoginResponse.fromJson(response.data);
      }
    } catch (e) {
      print('error $e');
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
