import 'package:dio/dio.dart';
import 'package:movie_drama/core/error/exceptions.dart';
import 'package:movie_drama/core/network/api_constaces.dart';
import 'package:movie_drama/core/network/error_message_model.dart';
import 'package:movie_drama/tvs/data/models/similar_tv_model.dart';
import 'package:movie_drama/tvs/data/models/tv_details_model.dart';
import 'package:movie_drama/tvs/data/models/tv_model.dart';
import 'package:movie_drama/tvs/domain/usecases/get_similar_tv_usecase.dart';
import 'package:movie_drama/tvs/domain/usecases/get_tv_details_usecase.dart';

abstract class BaseTvRemoteDataSource {
  Future<List<TvModel>> getOnTheAir();
  Future<List<TvModel>> getTopRatedTv();
  Future<List<TvModel>> getPopulatTv();
  Future<TvDetailsModel> getTvDetails(TvDetailsParameter parameter);
  Future<List<SimilarTvModel>> getSimilarTvs(SimilarTvParameter parameter);
}

class TvRemoteDataSource extends BaseTvRemoteDataSource {
  @override
  Future<List<TvModel>> getOnTheAir() async {
    var response = await Dio().get(ApiConstances.onTheAirTvPath);
    if (response.statusCode == 200) {
      return List<TvModel>.from(
        (response.data["results"] as List).map(
          (e) => TvModel.fromJson(e),
        ),
      );
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<TvModel>> getPopulatTv() async {
    var response = await Dio().get(ApiConstances.popularTvPath);
    if (response.statusCode == 200) {
      return List<TvModel>.from(
        (response.data["results"] as List).map(
          (e) => TvModel.fromJson(e),
        ),
      );
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<TvModel>> getTopRatedTv() async {
    var response = await Dio().get(ApiConstances.topRatedTvPath);
    if (response.statusCode == 200) {
      return List<TvModel>.from(
        (response.data["results"] as List).map(
          (e) => TvModel.fromJson(e),
        ),
      );
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<SimilarTvModel>> getSimilarTvs(
      SimilarTvParameter parameter) async {
    var response = await Dio().get(ApiConstances.tvSimilarPath(parameter.tvId));

    if (response.statusCode == 200) {
      return List<SimilarTvModel>.from(
        (response.data["results"] as List).map(
          (e) => SimilarTvModel.fromJson(e),
        ),
      );
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<TvDetailsModel> getTvDetails(TvDetailsParameter parameter) async {
    var response = await Dio().get(ApiConstances.tvDetailsPath(parameter.tvId));

    if (response.statusCode == 200) {
      return TvDetailsModel.fromJson(response.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}
