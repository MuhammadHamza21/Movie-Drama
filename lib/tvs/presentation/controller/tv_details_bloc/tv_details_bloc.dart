// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:movie_drama/core/utils/enums.dart';
import 'package:movie_drama/tvs/domain/entities/similar_tv.dart';
import 'package:movie_drama/tvs/domain/entities/tv_details.dart';
import 'package:movie_drama/tvs/domain/usecases/get_similar_tv_usecase.dart';
import 'package:movie_drama/tvs/domain/usecases/get_tv_details_usecase.dart';

part 'tv_details_event.dart';
part 'tv_details_state.dart';

class TvDetailsBloc extends Bloc<TvDetailsEvent, TvDetailsState> {
  GetTvDetailsUsecase getTvDetailsUsecase;
  GetSimilarTvUsecase getSimilarTvUsecase;
  TvDetailsBloc(
    this.getTvDetailsUsecase,
    this.getSimilarTvUsecase,
  ) : super(const TvDetailsState()) {
    on<GetTvDetailsEvent>(_getTvDetails);
    on<GetSimilarTvsEvent>(_getSimilarTvs);
  }

  FutureOr<void> _getTvDetails(
      GetTvDetailsEvent event, Emitter<TvDetailsState> emit) async {
    var result = await getTvDetailsUsecase(TvDetailsParameter(event.tvId));
    result.fold(
      (l) => emit(
        state.copyWith(
          tvDetailsMessage: l.message,
          tvDetailsState: RequestState.error,
        ),
      ),
      (r) => emit(
        state.copyWith(
          tvDetails: r,
          tvDetailsState: RequestState.loaded,
        ),
      ),
    );
  }

  FutureOr<void> _getSimilarTvs(
      GetSimilarTvsEvent event, Emitter<TvDetailsState> emit) async {
    var result =
        await getSimilarTvUsecase(SimilarTvParameter(tvId: event.tvId));
    result.fold(
      (l) => emit(
        state.copyWith(
          similarTvsMessage: l.message,
          similarTvsState: RequestState.error,
        ),
      ),
      (r) => emit(
        state.copyWith(
          similarTvs: r,
          similarTvsState: RequestState.loaded,
        ),
      ),
    );
  }
}
