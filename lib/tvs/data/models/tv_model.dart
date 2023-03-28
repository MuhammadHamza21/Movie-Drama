import 'package:movie_drama/tvs/domain/entities/tv_entity.dart';

class TvModel extends Tv {
  const TvModel({
    required super.backdropPath,
    required super.id,
    required super.title,
    required super.voteAverage,
    required super.overview,
    required super.releaseDate,
  });

  factory TvModel.fromJson(Map<String, dynamic> json) => TvModel(
        backdropPath: json["backdrop_path"] ?? '',
        id: json["id"],
        title: json["name"],
        overview: json["overview"],
        releaseDate: json["first_air_date"],
        voteAverage: json["vote_average"].toDouble(),
      );
}
