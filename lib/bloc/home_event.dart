part of 'home_bloc.dart';

@immutable
abstract class IdCardEvent {}

class UserProfile {
  final String fullName;
  final String city;
  final String wardNumber;
  final String profileInfo;

  UserProfile({
    required this.fullName,
    required this.city,
    required this.wardNumber,
    required this.profileInfo,
  });
}