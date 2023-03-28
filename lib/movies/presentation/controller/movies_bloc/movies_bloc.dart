import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_drama/core/usecase/base_usecase.dart';
import 'package:movie_drama/core/utils/enums.dart';
import 'package:movie_drama/movies/domain/usecases/get_now_playing_movies_usecase.dart';
import 'package:movie_drama/movies/domain/usecases/get_popular_movies_usecase.dart';
import 'package:movie_drama/movies/domain/usecases/get_top_rated_movies_usecase.dart';
import 'package:movie_drama/movies/presentation/controller/movies_bloc/movies_events.dart';
import 'package:movie_drama/movies/presentation/controller/movies_bloc/movies_states.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetNowPlayingMoviesUsecase getNowPlayingMoviesUsecase;
  final GetPopularMoviesUsecase getPopularMoviesUsecase;
  final GetTopRatedMoviesUsecase getTopRatedUsecase;
  MoviesBloc(
    this.getNowPlayingMoviesUsecase,
    this.getPopularMoviesUsecase,
    this.getTopRatedUsecase,
  ) : super(const MoviesState()) {
    on<GetNowPlayingMoviesEvent>(_getNowPlayingMovies);

    on<GetPopularMoviesEvent>(_getPopularMovies);

    on<GetTopRatedMoviesEvent>(_getTopRatedMovies);
  }

  FutureOr<void> _getNowPlayingMovies(
      GetNowPlayingMoviesEvent event, Emitter<MoviesState> emit) async {
    final result = await getNowPlayingMoviesUsecase(const NoParams());
    result.fold(
      (l) => emit(
        state.copyWith(
          nowPlayingMessage: l.message,
          nowPlayingState: RequestState.error,
        ),
      ),
      (r) => emit(
        state.copyWith(
          nowPlayingMovies: r,
          nowPlayingState: RequestState.loaded,
        ),
      ),
    );
  }

  FutureOr<void> _getPopularMovies(
      GetPopularMoviesEvent event, Emitter<MoviesState> emit) async {
    final result = await getPopularMoviesUsecase(const NoParams());
    result.fold(
      (l) => emit(
        state.copyWith(
          popularMessage: l.message,
          popularState: RequestState.error,
        ),
      ),
      (r) => emit(
        state.copyWith(
          popularMovies: r,
          popularState: RequestState.loaded,
        ),
      ),
    );
  }

  FutureOr<void> _getTopRatedMovies(
      GetTopRatedMoviesEvent event, Emitter<MoviesState> emit) async {
    final result = await getTopRatedUsecase(const NoParams());
    result.fold(
      (l) => emit(
        state.copyWith(
          topRatedMessage: l.message,
          topRatedState: RequestState.error,
        ),
      ),
      (r) => emit(
        state.copyWith(
          topRatedMovies: r,
          topRatedState: RequestState.loaded,
        ),
      ),
    );
  }
}
