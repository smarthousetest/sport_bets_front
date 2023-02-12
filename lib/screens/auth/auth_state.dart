import 'package:bet_app/models/user_model.dart';

abstract class AuthState {}

class NotAuthState extends AuthState {}

class AuthLoadingState extends AuthState {}

class AuthSuccessState extends AuthState {}

class RegisterIsSuccess extends AuthState {}

class AuthNoRegistratedAccount extends AuthState {}
