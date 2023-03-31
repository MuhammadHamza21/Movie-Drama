import 'package:equatable/equatable.dart';

class SimilarTvs extends Equatable {
  final int id;
  final String backdropPath;

  const SimilarTvs({required this.id, required this.backdropPath});
  @override
  List<Object?> get props => [
        id,
        backdropPath,
      ];
}
