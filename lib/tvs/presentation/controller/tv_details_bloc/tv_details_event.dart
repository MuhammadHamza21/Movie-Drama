part of 'tv_details_bloc.dart';

abstract class TvDetailsEvent extends Equatable {
  const TvDetailsEvent();

  @override
  List<Object> get props => [];
}

class GetTvDetailsEvent extends TvDetailsEvent {
  final int tvId;

  const GetTvDetailsEvent(this.tvId);
}

class GetSimilarTvsEvent extends TvDetailsEvent {
  final int tvId;

  const GetSimilarTvsEvent(this.tvId);
}
