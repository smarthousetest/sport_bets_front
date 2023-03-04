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

class AuthLoadingState extends AuthState {}

class AuthSuccessState extends AuthState {}

class RegisterIsSuccess extends AuthState {}

class AuthNoRegistratedAccount extends AuthState {}
