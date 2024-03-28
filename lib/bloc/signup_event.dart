part of 'signup_bloc.dart';

@immutable
abstract class SignupEvent {}

class SignupUserEvent extends SignupEvent {
  final String fullName;
  final String username;
  final String email;
  final String dob;
  final String contactNumber;
  final String streetName;
  final String area;
  final String city;
  final String state;
  final String wardNumber;

  SignupUserEvent({
    required this.fullName,
    required this.username,
    required this.email,
    required this.dob,
    required this.contactNumber,
    required this.streetName,
    required this.area,
    required this.city,
    required this.state,
    required this.wardNumber,
  });
}
