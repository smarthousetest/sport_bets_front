import 'package:bet_app/main.dart';
import 'package:bet_app/models/login_response.dart';
import 'package:bet_app/models/user_model.dart';
import 'package:bet_app/screens/auth/auth_state.dart';
import 'package:bet_app/screens/bets_screen/cubit/bet_cubit.dart';
import 'package:bet_app/screens/profile_cubit/profile_state.dart';
import 'package:bet_app/server/api/api.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:jwt_decode/jwt_decode.dart';

AndroidOptions _getAndroidOptions() => const AndroidOptions(
      encryptedSharedPreferences: true,
    );
final storage = FlutterSecureStorage(aOptions: _getAndroidOptions());

class AuthBloc extends Cubit<AuthState> {
  Api api = Api();
  AuthBloc() : super(NotAuthState(isAdmin: true));
  String token = '';

  Future<void> sendData(String username, String password) async {
    LoginResponse? loginResponse =
        await api.signInByCredentials(username: username, password: password);
    token = loginResponse!.accessToken!;
    saveToken(token);
    // storage.write(key: 'key', value: token);
    if (token.isNotEmpty) {
      emit(AuthSuccessState());
    }
  }

  Future<void> register(String username, String email) async {
    bool request = await api.registerInApp(username: username, email: email);
    if (request) {
      emit(RegisterIsSuccess());
    }
  }

  saveToken(token) async {
    await storage.write(key: 'key', value: token);
    token = await storage.read(key: 'key');
    print("dsadas ${(await storage.read(key: 'key')).toString()}");
  }

  Future checkOnAdmin() async {
    String? token = await storage.read(key: 'key');
    Map<String, dynamic> payload = Jwt.parseJwt(token!);
    UserModel userModel = UserModel.fromJson(payload);
    if (userModel.role == 'user') {
      emit(NotAuthState(isAdmin: false));
    } else {
      emit(NotAuthState(isAdmin: false));
    }
  }

  checkToken() async {
    if ((await storage.read(key: 'key')) != null) {
      token = (await storage.read(key: 'key'))!;
      Map<String, dynamic> payload = Jwt.parseJwt(token!);
      UserModel.fromJson(payload);
      emit(AuthSuccessState());
    }
  }

  logout() {
    storage.delete(key: 'key');
  }
}
