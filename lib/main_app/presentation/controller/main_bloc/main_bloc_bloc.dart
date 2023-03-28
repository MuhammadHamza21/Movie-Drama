import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_drama/movies/presentation/screens/movies_screen.dart';
import 'package:movie_drama/tvs/presentation/screens/tv_screen.dart';

part 'main_bloc_event.dart';
part 'main_bloc_state.dart';

class MainBloc extends Bloc<MainBlocEvent, MainBlocState> {
  MainBloc() : super(MainBlocState()) {
    on<ChangeCurrentIndexEvent>(_changeCurrentIndex);
  }

  FutureOr<void> _changeCurrentIndex(
      ChangeCurrentIndexEvent event, Emitter<MainBlocState> emit) {
    emit(
      state.copyWith(
        currentIndex: event.currentIndex,
      ),
    );
  }
}
