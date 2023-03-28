import 'package:equatable/equatable.dart';

class Tv extends Equatable {
  final String backdropPath;
  final int id;
  final String title;
  final String releaseDate;
  final String overview;
  final double voteAverage;

  const Tv({
    required this.backdropPath,
    required this.id,
    required this.title,
    required this.releaseDate,
    required this.overview,
    required this.voteAverage,
  });
  @override
  List<Object?> get props => [
        id,
        backdropPath,
        title,
        releaseDate,
        voteAverage,
        overview,
      ];
}
