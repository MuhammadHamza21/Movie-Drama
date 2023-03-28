import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'package:movie_drama/core/error/failure.dart';
import 'package:movie_drama/core/usecase/base_usecase.dart';
import 'package:movie_drama/tvs/domain/entities/tv_details.dart';
import 'package:movie_drama/tvs/domain/repository/base_tv_repository.dart';

class GetTvDetailsUsecase extends BaseUsecase<TvDetails, TvDetailsParameter> {
  BaseTvRepository baseTvRepository;
  GetTvDetailsUsecase({
    required this.baseTvRepository,
  });
  @override
  Future<Either<Failure, TvDetails>> call(TvDetailsParameter parameters) async {
    return await baseTvRepository.getTvDetails(parameters);
  }
}

class TvDetailsParameter extends Equatable {
  final int tvId;

  const TvDetailsParameter(this.tvId);

  @override
  List<Object?> get props => [tvId];
}
