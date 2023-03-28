import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_drama/movies/presentation/screens/movies_screen.dart';
import 'package:movie_drama/tvs/presentation/screens/tv_screen.dart';

part 'main_app_event.dart';
part 'main_app_state.dart';

class MainAppBloc extends Bloc<MainAppEvent, MainAppState> {
  MainAppBloc() : super(MainAppState()) {
    on<ChangeCurrentIndexEvent>(_changeCurrentIndex);
  }

  static MainAppBloc get(context) => BlocProvider.of(context);

  FutureOr<void> _changeCurrentIndex(
      ChangeCurrentIndexEvent event, Emitter<MainAppState> emit) {
    emit(
      MainAppState(
        currentIndex: event.currentIndex,
      ),
    );
  }
}
