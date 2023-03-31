import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_drama/core/error/failure.dart';
import 'package:movie_drama/core/usecase/base_usecase.dart';
import 'package:movie_drama/tvs/domain/entities/similar_tv.dart';
import 'package:movie_drama/tvs/domain/repository/base_tv_repository.dart';

class GetSimilarTvUsecase
    extends BaseUsecase<List<SimilarTvs>, SimilarTvParameter> {
  final BaseTvRepository baseTvRepository;

  GetSimilarTvUsecase({required this.baseTvRepository});
  @override
  Future<Either<Failure, List<SimilarTvs>>> call(
      SimilarTvParameter parameters) async {
    return await baseTvRepository.getSimilarTvs(parameters);
  }
}

class SimilarTvParameter extends Equatable {
  final int tvId;
  const SimilarTvParameter({
    required this.tvId,
  });

  @override
  List<Object?> get props => [tvId];
}
