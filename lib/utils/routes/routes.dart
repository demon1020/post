import 'package:blog/screens/signup_screen.dart';
import 'package:blog/utils/routes/routes_name.dart';
import 'package:flutter/material.dart';

import '../../screens/application_screen.dart';
import '../../screens/auth_screen.dart';
import '../../screens/dashboard_screen.dart';
import '../../screens/settings_screen.dart';

enum UserRole { user, specialPPL }

UserRole getUserRole() {
  // Implement your logic to get the user's role here
  return UserRole.user; // Return the user's role (user or specialPPL)
}

Map<String, WidgetBuilder> getRoutes() {
  return {
    RouteName.initial : (context) => SignInScreen(), // Common Sign In screen
    RouteName.dashboard: (context) {
      final userRole = getUserRole();
      switch (userRole) {
        case UserRole.user:
          return DashboardScreen(); // User-specific Dashboard screen
        case UserRole.specialPPL:
        // return SpecialPPLDashboardScreen(); // SpecialPPL-specific Dashboard screen
        default:
          return Container(); // Handle other roles or no role
      }
    },
    RouteName.signUp: (context) => SignUpScreen(), // Common Profile screen
    RouteName.settings: (context) => SettingsScreen(), // Common Settings screen
    RouteName.application: (context) => ApplicationScreen(), // SpecialPPL-specific screen
  };
}