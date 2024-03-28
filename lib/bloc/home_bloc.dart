import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<IdCardEvent, HomeState> {
  HomeBloc() : super(HomeInitialState()) {
    on<IdCardEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
