import 'package:movie_drama/movies/domain/entities/recommendations.dart';

class RecommendationModel extends Recommendations {
  const RecommendationModel({required super.id, required super.backdropPath});

  factory RecommendationModel.fromJson(Map<String, dynamic> json) =>
      RecommendationModel(
        id: json["id"],
        backdropPath: json["backdrop_path"] ?? '',
      );
}
