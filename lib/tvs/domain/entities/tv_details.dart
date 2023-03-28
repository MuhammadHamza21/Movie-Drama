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
  final int episodeRunTime;
  final List<Genres> genres;

  const TvDetails(
    this.id,
    this.title,
    this.overview,
    this.releaseDate,
    this.voteAverage,
    this.backdropPath,
    this.numberOfSeasons,
    this.episodeRunTime,
    this.genres,
  );

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
