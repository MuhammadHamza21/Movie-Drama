import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_drama/core/usecase/base_usecase.dart';

import 'package:movie_drama/core/utils/enums.dart';
import 'package:movie_drama/tvs/domain/entities/tv_entity.dart';
import 'package:movie_drama/tvs/domain/usecases/get_on_the_air_usecase.dart';
import 'package:movie_drama/tvs/domain/usecases/get_popular_tv_usecase.dart';
import 'package:movie_drama/tvs/domain/usecases/get_top_rated_tv_usecase.dart';

part 'tv_event.dart';
part 'tv_state.dart';

class TvBloc extends Bloc<TvEvent, TvState> {
  GetOnTheAirUsecase getOnTheAirUsecase;
  GetTopRatedTvUsecase getTopRatedTvUsecase;
  GetPopularTvUsecase getPopularTvUsecase;
  TvBloc(
    this.getOnTheAirUsecase,
    this.getTopRatedTvUsecase,
    this.getPopularTvUsecase,
  ) : super(const TvState()) {
    on<GetOnTheAirTvEvent>(_getOnTheAirTv);
    on<GetPopularTvEvent>(_getPopularTv);
    on<GetTopRatedTvEvent>(_getTopRatedTv);
  }

  FutureOr<void> _getOnTheAirTv(
      GetOnTheAirTvEvent event, Emitter<TvState> emit) async {
    var result = await getOnTheAirUsecase(const NoParams());
    result.fold(
      (l) => emit(
        state.copyWith(
          onTheAirMessage: l.message,
          onTheAirState: RequestState.error,
        ),
      ),
      (r) => emit(
        state.copyWith(
          onTheAitTv: r,
          onTheAirState: RequestState.loaded,
        ),
      ),
    );
  }

  FutureOr<void> _getPopularTv(
      GetPopularTvEvent event, Emitter<TvState> emit) async {
    var result = await getPopularTvUsecase(const NoParams());
    result.fold(
      (l) => emit(
        state.copyWith(
          popularTvMessage: l.message,
          popularTvState: RequestState.error,
        ),
      ),
      (r) => emit(state.copyWith(
        popularTv: r,
        popularTvState: RequestState.loaded,
      )),
    );
  }

  FutureOr<void> _getTopRatedTv(
      GetTopRatedTvEvent event, Emitter<TvState> emit) async {
    var result = await getTopRatedTvUsecase(const NoParams());
    result.fold(
      (l) => emit(state.copyWith(
        topRatedTvMessage: l.message,
        topRatedTvState: RequestState.error,
      )),
      (r) => emit(
        state.copyWith(
          topRatedTv: r,
          topRatedTvState: RequestState.loaded,
        ),
      ),
    );
  }
}
