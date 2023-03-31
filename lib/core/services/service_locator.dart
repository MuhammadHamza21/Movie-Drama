import 'package:get_it/get_it.dart';
import 'package:movie_drama/main_app/presentation/controller/bloc/main_app_bloc.dart';
import 'package:movie_drama/movies/data/datasource/movie_remote_data_source.dart';
import 'package:movie_drama/movies/data/repository/movie_repository.dart';
import 'package:movie_drama/movies/domain/repository/base_movie_repository.dart';
import 'package:movie_drama/movies/domain/usecases/get_movie_details_usecase.dart';
import 'package:movie_drama/movies/domain/usecases/get_now_playing_movies_usecase.dart';
import 'package:movie_drama/movies/domain/usecases/get_popular_movies_usecase.dart';
import 'package:movie_drama/movies/domain/usecases/get_recommendation_movies_usecase.dart';
import 'package:movie_drama/movies/domain/usecases/get_top_rated_movies_usecase.dart';
import 'package:movie_drama/movies/presentation/controller/movie_details_bloc/movie_details_bloc.dart';
import 'package:movie_drama/movies/presentation/controller/movies_bloc/movies_bloc.dart';
import 'package:movie_drama/tvs/data/datasource/tv_remote_data_source.dart';
import 'package:movie_drama/tvs/data/repository/tv_repository.dart';
import 'package:movie_drama/tvs/domain/repository/base_tv_repository.dart';
import 'package:movie_drama/tvs/domain/usecases/get_on_the_air_usecase.dart';
import 'package:movie_drama/tvs/domain/usecases/get_popular_tv_usecase.dart';
import 'package:movie_drama/tvs/domain/usecases/get_similar_tv_usecase.dart';
import 'package:movie_drama/tvs/domain/usecases/get_top_rated_tv_usecase.dart';
import 'package:movie_drama/tvs/domain/usecases/get_tv_details_usecase.dart';
import 'package:movie_drama/tvs/presentation/controller/tv_bloc/tv_bloc.dart';
import 'package:movie_drama/tvs/presentation/controller/tv_details_bloc/tv_details_bloc.dart';

final sl = GetIt.instance;

class ServiceLocator {
  void init() {
    /// Repository
    sl.registerLazySingleton<BaseMovieRepository>(() => MovieRepository(sl()));
    sl.registerLazySingleton<BaseTvRepository>(
      () => TvRepository(baseTvRemoteDataSource: sl()),
    );

    /// Data Source
    sl.registerLazySingleton<BaseMovieRemoteDataSource>(
        () => MovieRemoteDataSource());
    sl.registerLazySingleton<BaseTvRemoteDataSource>(
        () => TvRemoteDataSource());

    /// Usecases
    sl.registerLazySingleton(() => GetNowPlayingMoviesUsecase(sl()));
    sl.registerLazySingleton(() => GetPopularMoviesUsecase(sl()));
    sl.registerLazySingleton(() => GetTopRatedMoviesUsecase(sl()));
    sl.registerLazySingleton(() => GetMovieDetailsUsecase(sl()));
    sl.registerLazySingleton(() => GetRecommendationMoviesUsecase(sl()));
    sl.registerLazySingleton(() => GetOnTheAirUsecase(baseTvRepository: sl()));
    sl.registerLazySingleton(() => GetPopularTvUsecase(baseTvRepository: sl()));
    sl.registerLazySingleton(
        () => GetTopRatedTvUsecase(baseTvRepository: sl()));
    sl.registerLazySingleton(() => GetTvDetailsUsecase(baseTvRepository: sl()));
    sl.registerLazySingleton(() => GetSimilarTvUsecase(baseTvRepository: sl()));

    /// Bloc
    sl.registerFactory(() => MoviesBloc(sl(), sl(), sl()));
    sl.registerFactory(() => MovieDetailsBloc(sl(), sl()));
    sl.registerFactory(() => TvBloc(sl(), sl(), sl()));
    sl.registerFactory(() => TvDetailsBloc(sl(), sl()));
    sl.registerFactory(() => MainAppBloc());
  }
}
