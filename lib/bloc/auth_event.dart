part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class SignInEvent extends AuthEvent {
  final String username;
  final String password;

  SignInEvent(this.username, this.password);
}