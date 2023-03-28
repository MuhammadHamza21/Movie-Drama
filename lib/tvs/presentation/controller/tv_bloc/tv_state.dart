part of 'tv_bloc.dart';

class TvState extends Equatable {
  final List<Tv> onTheAitTv;
  final RequestState onTheAirState;
  final String onTheAirMessage;
  final List<Tv> topRatedTv;
  final RequestState topRatedTvState;
  final String topRatedTvMessage;
  final List<Tv> popularTv;
  final RequestState popularTvState;
  final String popularTvMessage;

  const TvState({
    this.onTheAitTv = const [],
    this.onTheAirState = RequestState.loading,
    this.onTheAirMessage = '',
    this.topRatedTv = const [],
    this.topRatedTvState = RequestState.loading,
    this.topRatedTvMessage = '',
    this.popularTv = const [],
    this.popularTvState = RequestState.loading,
    this.popularTvMessage = '',
  });

  TvState copyWith({
    List<Tv>? onTheAitTv,
    RequestState? onTheAirState,
    String? onTheAirMessage,
    List<Tv>? topRatedTv,
    RequestState? topRatedTvState,
    String? topRatedTvMessage,
    List<Tv>? popularTv,
    RequestState? popularTvState,
    String? popularTvMessage,
  }) =>
      TvState(
        onTheAitTv: onTheAitTv ?? this.onTheAitTv,
        onTheAirState: onTheAirState ?? this.onTheAirState,
        onTheAirMessage: onTheAirMessage ?? this.onTheAirMessage,
        topRatedTv: topRatedTv ?? this.topRatedTv,
        topRatedTvState: topRatedTvState ?? this.topRatedTvState,
        topRatedTvMessage: topRatedTvMessage ?? this.topRatedTvMessage,
        popularTv: popularTv ?? this.popularTv,
        popularTvState: popularTvState ?? this.popularTvState,
        popularTvMessage: popularTvMessage ?? this.popularTvMessage,
      );

  @override
  List<Object> get props => [
        onTheAitTv,
        onTheAirState,
        onTheAirMessage,
        topRatedTv,
        topRatedTvState,
        topRatedTvMessage,
        popularTv,
        popularTvState,
        popularTvMessage,
      ];
}
