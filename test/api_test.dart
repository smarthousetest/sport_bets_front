import 'package:bet_app/const.dart';
import 'package:bet_app/models/payment_model.dart';
import 'package:dio/dio.dart';
import 'package:test/test.dart';

void main() async {
  group('group name', () {
    test("Sample tests", () async {
      for (int i = 0; i == 10; i++) {
        final getPaymentTest = await getPayment(
            "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOjIsInVzZXJuYW1lIjoiaWdhIiwiZW1haWwiOiJpZ25hdDAwLTAwQGluYm94LnJ1Iiwicm9sZSI6InVzZXIiLCJpYXQiOjE2ODA2NTQyODIsImV4cCI6MTY4MTI1OTA4Mn0.Tpzzv8yd7-NF1WuvwdTWnwdKbnDLUcC7_ma6_nVUrGc",
            "2bbff42d-000f-5000-9000-1c1b9667d3ac");
        print(getPaymentTest?.paymentStatus);
        expect(getPaymentTest?.paymentStatus, 'succeeded');
        await Future.delayed(Duration(seconds: 1));
      }
    });
    test("Parsing GetPaymentModel fromJson", () async {
      try {
        Map<String, dynamic> testMap = {
          'paymentId': null,
          'paymentStatus': null
        };
        GetPaymentModel.fromJson(testMap);
      } catch (e) {
        print(e.runtimeType);
      }
    });
  });
  test("Sample tests", () {
    Map<String, dynamic> map = {
      "key1": "testValue1",
      "key2": null,
    };
    final result = Tmp.fromJson(map);
    expect(result, null);
  });
  test("Sample tests", () {
    Map<String, dynamic> map = {
      "key1": "testValue1",
      "key2": "testValue2",
    };
    final result = Tmp.fromJson(map);
    expect(
        result,
        Tmp(
          var1: "testValue1",
          var2: "testValue2",
        ));
  });
}

class Tmp {
  String var1;
  String var2;

  Tmp({
    required this.var1,
    required this.var2,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Tmp &&
          runtimeType == other.runtimeType &&
          var1 == other.var1 &&
          var2 == other.var2;

  @override
  int get hashCode => var1.hashCode ^ var2.hashCode;

  static Tmp? fromJson(Map<String, dynamic> json) {
    late final Tmp tmp;
    try {
      tmp = Tmp(
        var1: json["key1"],
        var2: json["key2"],
      );
      return tmp;
    } catch (e) {
      return null;
    }
  }
}

Future<PaymentStatusModel?> getPayment(String token, String paymentId) async {
  try {
    final response =
        await Dio().get('${ApiConst().api}yookassa/payment/$paymentId',
            options: Options(headers: {
              "Content-Type": "application/json",
              "Authorization": "Bearer $token",
            }));
    print(response.data);
    if (response.statusCode == 200) {
      return PaymentStatusModel.fromJson(response.data);
    }
  } on DioError catch (e, st) {
    return null;
  }
}
