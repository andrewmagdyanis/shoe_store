part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class UserAlreadyLogged extends LoginState {}

class NoUserLogged extends LoginState {}
