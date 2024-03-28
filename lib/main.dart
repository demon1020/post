import 'package:blog/bloc/application_bloc.dart';
import 'package:blog/bloc/dashboard_bloc.dart';
import 'package:blog/bloc/home_bloc.dart';
import 'package:blog/bloc/settings_bloc.dart';
import 'package:blog/bloc/signup_bloc.dart';
import 'package:blog/screens/signup_screen.dart';
import 'package:blog/screens/splash_screen.dart';
import 'package:blog/utils/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/auth_bloc.dart';
import 'package:blog/bloc/home_bloc.dart';
import 'package:blog/screens/application_screen.dart';
import 'package:blog/screens/dashboard_screen.dart';
import 'package:blog/screens/home_screen.dart';
import 'package:blog/screens/settings_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthBloc()),
        BlocProvider(create: (context) => DashboardBloc()),
        BlocProvider(create: (context) => HomeBloc()),
        BlocProvider(create: (context) => SettingsBloc()),
        BlocProvider(create: (context) => SignupBloc()),
        BlocProvider(create: (context) => ApplicationBloc()),
      ],
      child: MaterialApp(
        title: 'Blog',
        debugShowCheckedModeBanner: false,
        // routes: getRoutes(),
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: SplashScreen(),
        // home: SignUpScreen(),
      ),
    );
  }
}
