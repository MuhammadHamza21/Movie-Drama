import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_drama/core/error/failure.dart';
import 'package:movie_drama/core/usecase/base_usecase.dart';
import 'package:movie_drama/movies/domain/entities/recommendations.dart';
import 'package:movie_drama/movies/domain/repository/base_movie_repository.dart';

class GetRecommendationMoviesUsecase
    extends BaseUsecase<List<Recommendations>, RecommendationParameters> {
  final BaseMovieRepository baseMovieRepository;

  GetRecommendationMoviesUsecase(this.baseMovieRepository);

  @override
  Future<Either<Failure, List<Recommendations>>> call(
      RecommendationParameters parameters) async {
    return await baseMovieRepository.getRecommendationMovies(parameters);
  }
}

class RecommendationParameters extends Equatable {
  final int movieId;

  const RecommendationParameters({required this.movieId});

  @override
  List<Object?> get props => [movieId];
}
