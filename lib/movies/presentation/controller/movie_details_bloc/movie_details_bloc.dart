import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_drama/core/utils/enums.dart';
import 'package:movie_drama/movies/domain/entities/movie_details.dart';
import 'package:movie_drama/movies/domain/entities/recommendations.dart';
import 'package:movie_drama/movies/domain/usecases/get_movie_details_usecase.dart';
import 'package:movie_drama/movies/domain/usecases/get_recommendation_movies_usecase.dart';

part 'movie_details_event.dart';
part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  MovieDetailsBloc(
    this.getMovieDetailsUsecase,
    this.getRecommendationMoviesUsecase,
  ) : super(const MovieDetailsState()) {
    on<GetMovieDetailsEvent>(_getMovieDetails);
    on<GetRecommendationMoviesEvent>(_getRecommendationMovies);
  }
  static MovieDetailsBloc get(context) => BlocProvider.of(context);
  GetMovieDetailsUsecase getMovieDetailsUsecase;
  GetRecommendationMoviesUsecase getRecommendationMoviesUsecase;

  FutureOr<void> _getMovieDetails(
      GetMovieDetailsEvent event, Emitter<MovieDetailsState> emit) async {
    emit(state.copyWith(movieDetailsState: RequestState.loading));
    final result =
        await getMovieDetailsUsecase(MovieDetailsParameters(movieId: event.id));
    result.fold(
      (l) => emit(
        state.copyWith(
          movieDetailsMessage: l.message,
          movieDetailsState: RequestState.error,
        ),
      ),
      (r) => emit(
        state.copyWith(
          movieDetails: r,
          movieDetailsState: RequestState.loaded,
        ),
      ),
    );
  }

  FutureOr<void> _getRecommendationMovies(GetRecommendationMoviesEvent event,
      Emitter<MovieDetailsState> emit) async {
    emit(state.copyWith(recommendationMoviesState: RequestState.loading));
    var response = await getRecommendationMoviesUsecase(
        RecommendationParameters(movieId: event.id));
    response.fold(
      (l) => emit(
        state.copyWith(
          recommendationMoviesMessage: l.message,
          recommendationMoviesState: RequestState.error,
        ),
      ),
      (r) => emit(
        state.copyWith(
          recommendationMovies: r,
          recommendationMoviesState: RequestState.loaded,
        ),
      ),
    );
  }
}
