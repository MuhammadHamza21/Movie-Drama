import 'package:equatable/equatable.dart';
import 'package:movie_drama/tvs/domain/entities/genres.dart';

class TvDetails extends Equatable {
  final int id;
  final String title;
  final String overview;
  final String releaseDate;
  final double voteAverage;
  final String backdropPath;
  final int numberOfSeasons;
  final List<dynamic> episodeRunTime;
  final List<Genres> genres;

  const TvDetails({
    required this.id,
    required this.title,
    required this.overview,
    required this.releaseDate,
    required this.voteAverage,
    required this.backdropPath,
    required this.numberOfSeasons,
    required this.episodeRunTime,
    required this.genres,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        overview,
        releaseDate,
        voteAverage,
        backdropPath,
        numberOfSeasons,
        episodeRunTime,
        genres,
      ];
}
