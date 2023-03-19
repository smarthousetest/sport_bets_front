import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

const mainColor = Color(0xff02040a);
const seconColor = Color.fromARGB(255, 180, 255, 127);

class ApiConst {
  String api = 'http://31.31.202.80:3000/';
  String? conformationUrl;
}

class SecureStorage {
  final FlutterSecureStorage flutterSecureStorage = FlutterSecureStorage();

  Future<void> saveToken({required String token}) async {
    await flutterSecureStorage.write(key: 'access_token', value: token);
  }

  Future<String?> getToken() async =>
      await flutterSecureStorage.read(key: 'access_token');
  Future<void> clearToken() async =>
      await flutterSecureStorage.delete(key: 'access_token');
}
