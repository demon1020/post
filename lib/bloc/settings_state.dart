part of 'settings_bloc.dart';

@immutable
abstract class SettingsState {}

class SettingsInitialState extends SettingsState {}

class SettingsLoadingState extends SettingsState {}

class SettingsSuccessState extends SettingsState {
  final String message;

  SettingsSuccessState(this.message);
}

class SettingsErrorState extends SettingsState {
  final String message;

  SettingsErrorState(this.message);
}