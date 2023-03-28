import 'package:dio/dio.dart';
import 'package:movie_drama/core/error/exceptions.dart';
import 'package:movie_drama/core/network/api_constaces.dart';
import 'package:movie_drama/core/network/error_message_model.dart';
import 'package:movie_drama/movies/data/models/movie_details_model.dart';
import 'package:movie_drama/movies/data/models/movie_model.dart';
import 'package:movie_drama/movies/data/models/recommendation_model.dart';
import 'package:movie_drama/movies/domain/entities/movie_details.dart';
import 'package:movie_drama/movies/domain/usecases/get_movie_details_usecase.dart';
import 'package:movie_drama/movies/domain/usecases/get_recommendation_movies_usecase.dart';

abstract class BaseMovieRemoteDataSource {
  Future<List<MovieModel>> getNowPlayingMovies();
  Future<List<MovieModel>> getPopularMovies();
  Future<List<MovieModel>> getTopRatedMovies();
  Future<MovieDetails> getMovieDetails(MovieDetailsParameters parameters);
  Future<List<RecommendationModel>> getRecommendationMovies(
      RecommendationParameters parameters);
}

class MovieRemoteDataSource extends BaseMovieRemoteDataSource {
  @override
  Future<List<MovieModel>> getNowPlayingMovies() async {
    var response = await Dio().get(ApiConstances.nowPlayingMoviesPath);

    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data["results"] as List)
          .map((e) => MovieModel.fromJson(e)));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    var response = await Dio().get(ApiConstances.popularMoviesPath);

    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data["results"] as List)
          .map((e) => MovieModel.fromJson(e)));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<MovieModel>> getTopRatedMovies() async {
    var response = await Dio().get(ApiConstances.topRatedMoviesPath);

    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data["results"] as List)
          .map((e) => MovieModel.fromJson(e)));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<MovieDetails> getMovieDetails(
      MovieDetailsParameters parameters) async {
    var response =
        await Dio().get(ApiConstances.movieDetails(parameters.movieId));

    if (response.statusCode == 200) {
      return MovieDetailsModel.fromJson(response.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(
          response.data,
        ),
      );
    }
  }

  @override
  Future<List<RecommendationModel>> getRecommendationMovies(
      RecommendationParameters parameters) async {
    var response =
        await Dio().get(ApiConstances.recommendationMovies(parameters.movieId));
    if (response.statusCode == 200) {
      return List<RecommendationModel>.from((response.data["results"] as List)
          .map((e) => RecommendationModel.fromJson(e)));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(
          response.data,
        ),
      );
    }
  }
}
