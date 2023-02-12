import 'package:bet_app/models/user_model.dart';
import 'package:bet_app/screens/auth/auth_cubit.dart';
import 'package:bet_app/screens/profile_cubit/profile_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jwt_decode/jwt_decode.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(EmptyProfileState());

  Future takeUserInfo() async {
    String? token = await storage.read(key: 'key');
    Map<String, dynamic> payload = Jwt.parseJwt(token!);
    UserModel userModel = UserModel.fromJson(payload);
    emit(StratProfileState(userModel: userModel));
  }
}
