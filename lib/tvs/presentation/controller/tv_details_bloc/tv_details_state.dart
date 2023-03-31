part of 'tv_details_bloc.dart';

class TvDetailsState extends Equatable {
  const TvDetailsState({
    this.tvDetails,
    this.tvDetailsState = RequestState.loading,
    this.tvDetailsMessage = '',
    this.similarTvs = const [],
    this.similarTvsState = RequestState.loading,
    this.similarTvsMessage = '',
  });
  final TvDetails? tvDetails;
  final RequestState tvDetailsState;
  final String tvDetailsMessage;
  final List<SimilarTvs> similarTvs;
  final RequestState similarTvsState;
  final String similarTvsMessage;

  TvDetailsState copyWith({
    TvDetails? tvDetails,
    RequestState? tvDetailsState,
    String? tvDetailsMessage,
    List<SimilarTvs>? similarTvs,
    RequestState? similarTvsState,
    String? similarTvsMessage,
  }) =>
      TvDetailsState(
        tvDetails: tvDetails ?? this.tvDetails,
        similarTvs: similarTvs ?? this.similarTvs,
        tvDetailsState: tvDetailsState ?? this.tvDetailsState,
        tvDetailsMessage: tvDetailsMessage ?? this.tvDetailsMessage,
        similarTvsMessage: similarTvsMessage ?? this.similarTvsMessage,
        similarTvsState: similarTvsState ?? this.similarTvsState,
      );

  @override
  List<Object?> get props => [
        tvDetails,
        similarTvs,
        tvDetailsMessage,
        tvDetailsState,
        similarTvsMessage,
        similarTvsState,
      ];
}
