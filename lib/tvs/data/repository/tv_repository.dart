// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:movie_drama/core/error/exceptions.dart';

import 'package:movie_drama/core/error/failure.dart';
import 'package:movie_drama/tvs/data/datasource/tv_remote_data_source.dart';
import 'package:movie_drama/tvs/domain/entities/tv_details.dart';
import 'package:movie_drama/tvs/domain/entities/similar_tv.dart';
import 'package:movie_drama/tvs/domain/entities/tv_entity.dart';
import 'package:movie_drama/tvs/domain/repository/base_tv_repository.dart';
import 'package:movie_drama/tvs/domain/usecases/get_tv_details_usecase.dart';
import 'package:movie_drama/tvs/domain/usecases/get_similar_tv_usecase.dart';

class TvRepository extends BaseTvRepository {
  BaseTvRemoteDataSource baseTvRemoteDataSource;
  TvRepository({
    required this.baseTvRemoteDataSource,
  });
  @override
  Future<Either<Failure, List<Tv>>> getOnTheAirTv() async {
    var result = await baseTvRemoteDataSource.getOnTheAir();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(
        ServerFailure(
          failure.errorMessageModel.statusMessage,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<Tv>>> getPopularTv() async {
    var result = await baseTvRemoteDataSource.getPopulatTv();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(
        ServerFailure(
          failure.errorMessageModel.statusMessage,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<Tv>>> getTopRatedTv() async {
    var result = await baseTvRemoteDataSource.getTopRatedTv();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(
        ServerFailure(failure.errorMessageModel.statusMessage),
      );
    }
  }

  @override
  Future<Either<Failure, List<SimilarTvs>>> getSimilarTvs(
      SimilarTvParameter tvSimilarParameter) async {
    // TODO: implement getSimilarTvs
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, TvDetails>> getTvDetails(
      TvDetailsParameter tvDetailsParameter) {
    // TODO: implement getTvDetails
    throw UnimplementedError();
  }
}
