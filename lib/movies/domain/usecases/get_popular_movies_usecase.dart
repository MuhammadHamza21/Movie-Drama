import 'package:dartz/dartz.dart';
import 'package:movie_drama/core/error/failure.dart';
import 'package:movie_drama/core/usecase/base_usecase.dart';
import 'package:movie_drama/movies/domain/entities/movie.dart';
import 'package:movie_drama/movies/domain/repository/base_movie_repository.dart';

class GetPopularMoviesUsecase extends BaseUsecase<List<Movie>, NoParams> {
  final BaseMovieRepository baseMovieRepository;

  GetPopularMoviesUsecase(this.baseMovieRepository);

  @override
  Future<Either<Failure, List<Movie>>> call(NoParams params) async {
    return await baseMovieRepository.getPopularMovies();
  }
}
