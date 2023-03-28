// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:movie_drama/core/error/failure.dart';
import 'package:movie_drama/core/usecase/base_usecase.dart';
import 'package:movie_drama/tvs/domain/entities/tv_entity.dart';
import 'package:movie_drama/tvs/domain/repository/base_tv_repository.dart';

class GetOnTheAirUsecase extends BaseUsecase<List<Tv>, NoParams> {
  BaseTvRepository baseTvRepository;
  GetOnTheAirUsecase({
    required this.baseTvRepository,
  });
  @override
  Future<Either<Failure, List<Tv>>> call(NoParams parameters) async {
    return await baseTvRepository.getOnTheAirTv();
  }
}
