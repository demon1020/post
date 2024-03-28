import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'signup_event.dart';

part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc() : super(SignupInitialState()) {
    on<SignupEvent>((event, emit) async {
      if (event is SignupUserEvent) {
        // Implement your signup logic here
        try {
          emit(SignupLoadingState());
          await Future.delayed(Duration(seconds: 2));
          emit(SignupSuccessState('Signed up Successfully'));
        } catch (e) {
          emit(SignupErrorState('Signup failed: $e'));
        }
      }
    });
  }
}
