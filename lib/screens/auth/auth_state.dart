import 'package:bet_app/models/user_model.dart';

abstract class AuthState {}

class NotAuthState extends AuthState {
  bool isAdmin = false;
  NotAuthState({required this.isAdmin});
  NotAuthState copyWith({bool? isAdmin}) {
    return NotAuthState(isAdmin: isAdmin ?? this.isAdmin);
  }

  @override
  Object? get props => [isAdmin];
}

class UserIsAdmin extends AuthState {}

class DemoUserState extends AuthState {}

class AuthLoadingState extends AuthState {}

class AuthSuccessState extends AuthState {}

class RegisterIsSuccess extends AuthState {}

class RegisterIsNotSuccess extends AuthState {
  String errorTitle;
  RegisterIsNotSuccess({required this.errorTitle});
  RegisterIsNotSuccess copyWith({String? errorTitle}) {
    return RegisterIsNotSuccess(errorTitle: errorTitle ?? this.errorTitle);
  }

  @override
  Object? get props => [errorTitle];
}

class AuthNoRegistratedAccount extends AuthState {}
