import 'package:blog/screens/auth_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../bloc/settings_bloc.dart';
import '../models/user_model.dart';
import 'components/settings_menu.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: BlocConsumer<SettingsBloc, SettingsState>(
        listener: (context, state) {
          if (state is SettingsSuccessState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                  content: Text(state.message), backgroundColor: Colors.green),
            );
          } else if (state is SettingsErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                  content: Text(state.message), backgroundColor: Colors.red),
            );
          }
        },
        builder: (context, state) {
          return state is SettingsLoadingState
              ? Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.blue,
                        // backgroundImage: AssetImage('images/my_pic.jfif'),
                      ),

                      SettingsMenu(
                        label: "Email",
                        text: user.email,
                        press: (value) {
                          if (value.isNotEmpty) {
                            BlocProvider.of<SettingsBloc>(context)
                                .add(UpdateEmailEvent(value));
                          }
                        },
                      ),
                      SettingsMenu(
                        label: "Password",
                        text: user.password,
                        press: (value) {
                          if (value.isNotEmpty) {
                            BlocProvider.of<SettingsBloc>(context)
                                .add(UpdatePasswordEvent(value));
                          }
                        },
                      ),
                      SettingsMenu(
                        label: "Mobile Number",
                        text: user.contactNumber,
                        press: (value) {
                          if (value.isNotEmpty) {
                            BlocProvider.of<SettingsBloc>(context)
                                .add(UpdateMobileNumberEvent(value));
                          }
                        },
                      ),
                      SettingsMenu(
                        label: "Ward Number",
                        text: user.wardNumber,
                        press: (value) {
                          if (value.isNotEmpty) {
                            BlocProvider.of<SettingsBloc>(context)
                                .add(UpdateWardNumberEvent(value));
                          }
                        },
                      ),
                      ElevatedButton(
                        onPressed: () async{
                          SharedPreferences prefs = await SharedPreferences.getInstance();
                          prefs.clear();
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (context) => SignInScreen()),
                          );
                        },
                        child: Text('Logout'),
                      ),
                    ],
                  ),
                );
        },
      ),
    );
  }
}
