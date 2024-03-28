part of 'application_bloc.dart';

@immutable
abstract class ApplicationState {}

class ApplicationInitialState extends ApplicationState {}

class ApplicationSubmittingState extends ApplicationState {}

class ApplicationSubmittedState extends ApplicationState {}

class ApplicationErrorState extends ApplicationState {
  final String message;
  ApplicationErrorState(this.message);
}