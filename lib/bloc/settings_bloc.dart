import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:blog/models/user_model.dart';
part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc() : super(SettingsInitialState()) {
    on<SettingsEvent>((event, emit) async {
      if (event is UpdateProfilePicEvent) {
        // Implement profile picture update logic
        emit(SettingsLoadingState());
        // Simulating a delay to show the loading state
        await Future.delayed(Duration(seconds: 2));
        emit(SettingsSuccessState('Profile picture updated successfully'));
      } else if (event is UpdateEmailEvent) {
        // Implement email update logic
        emit(SettingsLoadingState());
        // Simulating a delay to show the loading state
        user.email = event.newEmail;
        await Future.delayed(Duration(seconds: 2));
        emit(SettingsSuccessState('Email updated successfully'));
      } else if (event is UpdatePasswordEvent) {
        // Implement password update logic
        emit(SettingsLoadingState());
        // Simulating a delay to show the loading state
        user.password = event.newPassword;
        await Future.delayed(Duration(seconds: 2));
        emit(SettingsSuccessState('Password updated successfully'));
      } else if (event is UpdateMobileNumberEvent) {
        // Implement mobile number update logic
        emit(SettingsLoadingState());
        // Simulating a delay to show the loading state
        user.contactNumber = event.newMobileNumber;
        await Future.delayed(Duration(seconds: 2));
        emit(SettingsSuccessState('Mobile number updated successfully'));
      } else if (event is UpdateWardNumberEvent) {
        // Implement ward number update logic
        emit(SettingsLoadingState());
        // Simulating a delay to show the loading state
        user.wardNumber = event.newWardNumber;
        await Future.delayed(Duration(seconds: 2));
        emit(SettingsSuccessState('Ward number updated successfully'));
      }
    });
  }
}
