import 'package:equatable/equatable.dart';

class SimilarTvs extends Equatable {
  final int id;
  final String backdropPath;

  const SimilarTvs(this.id, this.backdropPath);
  @override
  List<Object?> get props => [
        id,
        backdropPath,
      ];
}
