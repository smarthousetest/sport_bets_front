import 'package:bet_app/models/user_model.dart';

abstract class ProfileState {}

class StratProfileState extends ProfileState {
  UserModel? userModel;
  StratProfileState({this.userModel});
  StratProfileState copyWith({UserModel? userModel}) {
    return StratProfileState(userModel: userModel ?? this.userModel);
  }

  @override
  Object? get props => [userModel];
}

class EmptyProfileState extends ProfileState {}
