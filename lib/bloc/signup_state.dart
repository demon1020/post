part of 'signup_bloc.dart';

@immutable
abstract class SignupState {}

class SignupInitialState extends SignupState {}

class SignupLoadingState extends SignupState {}

class SignupSuccessState extends SignupState {
  final String message;
  SignupSuccessState(this.message);
}

class SignupErrorState extends SignupState {
  final String message;
  SignupErrorState(this.message);
}
