import 'package:movie_drama/tvs/domain/entities/similar_tv.dart';

class SimilarTvModel extends SimilarTvs {
  const SimilarTvModel({required super.id, required super.backdropPath});

  factory SimilarTvModel.fromJson(Map<String, dynamic> json) => SimilarTvModel(
        id: json["id"],
        backdropPath: json["backdrop_path"] ?? "",
      );
}
