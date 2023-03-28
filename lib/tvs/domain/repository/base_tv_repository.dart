import 'package:dartz/dartz.dart';
import 'package:movie_drama/core/error/failure.dart';
import 'package:movie_drama/tvs/domain/entities/similar_tv.dart';
import 'package:movie_drama/tvs/domain/entities/tv_details.dart';
import 'package:movie_drama/tvs/domain/entities/tv_entity.dart';
import 'package:movie_drama/tvs/domain/usecases/get_similar_tv_usecase.dart';
import 'package:movie_drama/tvs/domain/usecases/get_tv_details_usecase.dart';

abstract class BaseTvRepository {
  Future<Either<Failure, List<Tv>>> getOnTheAirTv();
  Future<Either<Failure, List<Tv>>> getPopularTv();
  Future<Either<Failure, List<Tv>>> getTopRatedTv();
  Future<Either<Failure, TvDetails>> getTvDetails(
      TvDetailsParameter tvDetailsParameter);
  Future<Either<Failure, List<SimilarTvs>>> getSimilarTvs(
      SimilarTvParameter tvSimilarParameter);
}
