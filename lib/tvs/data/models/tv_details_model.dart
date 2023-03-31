import 'package:movie_drama/tvs/data/models/genres.dart';
import 'package:movie_drama/tvs/domain/entities/tv_details.dart';

class TvDetailsModel extends TvDetails {
  const TvDetailsModel({
    required super.id,
    required super.title,
    required super.overview,
    required super.releaseDate,
    required super.voteAverage,
    required super.backdropPath,
    required super.numberOfSeasons,
    required super.episodeRunTime,
    required super.genres,
  });

  factory TvDetailsModel.fromJson(Map<String, dynamic> json) => TvDetailsModel(
        id: json["id"],
        title: json["name"],
        overview: json["overview"],
        releaseDate: json["first_air_date"],
        voteAverage: json["vote_average"],
        backdropPath: json["backdrop_path"],
        numberOfSeasons: json["number_of_seasons"],
        episodeRunTime: json["episode_run_time"],
        genres: List<GenresModel>.from(
          json["genres"].map(
            (x) => GenresModel.fromJson(x),
          ),
        ),
      );
}
