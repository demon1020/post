import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'application_event.dart';
part 'application_state.dart';

class ApplicationBloc extends Bloc<ApplicationEvent, ApplicationState> {
  ApplicationBloc() : super(ApplicationInitialState()) {
    on<ApplicationEvent>((event, emit) async {
      if (event is SubmitApplicationEvent) {
        emit(ApplicationSubmittingState());
        try {
          // Simulating a delay to show the submitting state
          await Future.delayed(Duration(seconds: 2));
          // Logic to submit the application form
          emit(ApplicationSubmittedState());
        } catch (e) {
          emit(ApplicationErrorState('Failed to submit application: $e'));
        }
      }
    });
  }
}
