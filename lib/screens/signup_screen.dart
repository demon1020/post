import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/signup_bloc.dart';

class SignUpScreen extends StatefulWidget {
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController fullNameController = TextEditingController();
  late final TextEditingController usernameController = TextEditingController();
  late final TextEditingController emailController = TextEditingController();
  late final TextEditingController dobController = TextEditingController();
  late final TextEditingController contactNumberController = TextEditingController();
  late final TextEditingController streetNameController = TextEditingController();
  late final TextEditingController areaController = TextEditingController();
  late final TextEditingController cityController = TextEditingController();
  late final TextEditingController stateController = TextEditingController();
  late final TextEditingController wardNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: BlocConsumer<SignupBloc, SignupState>(
        listener: (context, state) {
          if (state is SignupSuccessState) {
            // Handle successful signup
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.green,
              ),
            );
          } else if (state is SignupErrorState) {
            // Handle signup error
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        builder: (context, state) {
          return state is SignupLoadingState
              ? Center(child: CircularProgressIndicator())
              :SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TextFormField(
                      controller: fullNameController,
                      decoration: InputDecoration(labelText: 'Full Name'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your Full Name';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: usernameController,
                      decoration: InputDecoration(labelText: 'Username'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your User Name';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(labelText: 'Email'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your Email';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: dobController,
                      decoration: InputDecoration(labelText: 'Date of Birth'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your Date of Birth';
                        }
                        return null;
                      },
                      onTap: () async {
                        DateTime? dob = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1900),
                          lastDate: DateTime.now(),
                        );
                        if (dob != null) {
                          // Handle selected date
                          dobController.text = dob.toString().substring(0,10);
                          setState(() {});
                        }
                      },
                    ),
                    TextFormField(
                      controller: contactNumberController,
                      decoration: InputDecoration(labelText: 'Contact Number'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your Contact Number';
                        }
                        return null;
                      },
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: wardNumberController,
                            decoration:
                                InputDecoration(labelText: 'Ward Number'),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your Ward Number';
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: TextFormField(
                            controller: streetNameController,
                            decoration:
                                InputDecoration(labelText: 'Street Name'),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your Street Name';
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                    TextFormField(
                      controller: areaController,
                      decoration: InputDecoration(labelText: 'Area'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your Area';
                        }
                        return null;
                      },
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: cityController,
                            decoration: InputDecoration(labelText: 'City'),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your City';
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: TextFormField(
                            controller: stateController,
                            decoration: InputDecoration(labelText: 'State'),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your State';
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Dispatch SignupUserEvent with user data
                        if (_formKey.currentState!.validate()) {
                          BlocProvider.of<SignupBloc>(context).add(
                            SignupUserEvent(
                              fullName: fullNameController.text,
                              username: fullNameController.text,
                              email: fullNameController.text,
                              dob: fullNameController.text,
                              contactNumber: fullNameController.text,
                              streetName: fullNameController.text,
                              area: fullNameController.text,
                              city: fullNameController.text,
                              state: fullNameController.text,
                              wardNumber: fullNameController.text,
                            ),
                          );
                        }
                      },
                      child: Text('Sign Up'),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
