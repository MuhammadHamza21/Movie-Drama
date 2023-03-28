import 'package:dartz/dartz.dart';
import 'package:movie_drama/core/error/failure.dart';
import 'package:movie_drama/movies/domain/entities/movie.dart';
import 'package:movie_drama/movies/domain/entities/movie_details.dart';
import 'package:movie_drama/movies/domain/entities/recommendations.dart';
import 'package:movie_drama/movies/domain/usecases/get_movie_details_usecase.dart';
import 'package:movie_drama/movies/domain/usecases/get_recommendation_movies_usecase.dart';

abstract class BaseMovieRepository {
  Future<Either<Failure, List<Movie>>> getNowPlayingMovie();

  Future<Either<Failure, List<Movie>>> getPopularMovies();

  Future<Either<Failure, List<Movie>>> getTopRatedMovies();

  Future<Either<Failure, MovieDetails>> getMovieDetails(
      MovieDetailsParameters parameters);

  Future<Either<Failure, List<Recommendations>>> getRecommendationMovies(
    RecommendationParameters parameters,
  );
}
