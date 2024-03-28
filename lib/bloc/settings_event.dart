part of 'settings_bloc.dart';

@immutable
abstract class SettingsEvent {}

class UpdateProfilePicEvent extends SettingsEvent {}

class UpdateEmailEvent extends SettingsEvent {
  final String newEmail;

  UpdateEmailEvent(this.newEmail);
}

class UpdatePasswordEvent extends SettingsEvent {
  final String newPassword;

  UpdatePasswordEvent(this.newPassword);
}

class UpdateMobileNumberEvent extends SettingsEvent {
  final String newMobileNumber;

  UpdateMobileNumberEvent(this.newMobileNumber);
}

class UpdateWardNumberEvent extends SettingsEvent {
  final String newWardNumber;

  UpdateWardNumberEvent(this.newWardNumber);
}