import 'package:dio/dio.dart';
import 'package:movie_drama/core/error/exceptions.dart';
import 'package:movie_drama/core/network/api_constaces.dart';
import 'package:movie_drama/core/network/error_message_model.dart';
import 'package:movie_drama/tvs/data/models/tv_model.dart';

abstract class BaseTvRemoteDataSource {
  Future<List<TvModel>> getOnTheAir();
  Future<List<TvModel>> getTopRatedTv();
  Future<List<TvModel>> getPopulatTv();
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
}
