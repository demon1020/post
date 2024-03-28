import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/application_bloc.dart';
import '../widgets/single_selection_widget.dart';

class ApplicationScreen extends StatefulWidget {
  @override
  State<ApplicationScreen> createState() => _ApplicationScreenState();
}

class _ApplicationScreenState extends State<ApplicationScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController incomeDetailsController = TextEditingController();
  final TextEditingController panCardNumberController = TextEditingController();
  final TextEditingController workDetailsController = TextEditingController();
  final TextEditingController voterIdNumberController = TextEditingController();
  final TextEditingController reasonForApplyingController =
      TextEditingController();
  final TextEditingController opinionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Application Form'),
      ),
      body: BlocConsumer<ApplicationBloc, ApplicationState>(
        listener: (context, state) {
          if (state is ApplicationSubmittedState) {
            incomeDetailsController.clear();
            panCardNumberController.clear();
            workDetailsController.clear();
            voterIdNumberController.clear();
            reasonForApplyingController.clear();
            opinionController.clear();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                  content: Text('Application submitted successfully'),
                  backgroundColor: Colors.green),
            );
          } else if (state is ApplicationErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                  content: Text(state.message), backgroundColor: Colors.red),
            );
          }
        },
        builder: (context, state) {
          return state is ApplicationSubmittingState
              ? Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
                  padding: EdgeInsets.all(16.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Container(
                          child: Text(
                            'Applying For',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          alignment: Alignment.centerLeft,
                        ),
                        SingleSelectionWidget(
                          options: ['TN Fan Leader', 'Head of Fan Leader'],
                        ),
                        TextFormField(
                          controller: incomeDetailsController,
                          decoration:
                              InputDecoration(labelText: 'Income Details'),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your income details';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.number,
                        ),
                        TextFormField(
                          controller: panCardNumberController,
                          decoration:
                              InputDecoration(labelText: 'Pan Card Number'),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your pan card number';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.number,
                        ),
                        TextFormField(
                          controller: workDetailsController,
                          decoration:
                              InputDecoration(labelText: 'Work Details'),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your work details';
                            }
                            return null;
                          },
                        ),
                        TextFormField(
                          controller: voterIdNumberController,
                          decoration:
                              InputDecoration(labelText: 'Voter ID Number'),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your voter id number';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.number,
                        ),
                        TextFormField(
                          controller: reasonForApplyingController,
                          decoration:
                              InputDecoration(labelText: 'Reason for Applying'),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your reason for applying';
                            }
                            return null;
                          },
                        ),
                        TextFormField(
                          minLines: 1,
                          maxLines: 7,
                          controller: opinionController,
                          decoration: InputDecoration(
                              labelText:
                                  'What will you do if you get this role?'),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your opinion';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              final ApplicationForm form = ApplicationForm(
                                incomeDetails: incomeDetailsController.text,
                                panCardNumber: panCardNumberController.text,
                                workDetails: workDetailsController.text,
                                voterIdNumber: voterIdNumberController.text,
                                reasonForApplying:
                                    reasonForApplyingController.text,
                                opinion: opinionController.text,
                              );
                              BlocProvider.of<ApplicationBloc>(context)
                                  .add(SubmitApplicationEvent(form));
                            }
                          },
                          child: Text('Submit'),
                        ),
                      ],
                    ),
                  ),
                );
        },
      ),
    );
  }
}
