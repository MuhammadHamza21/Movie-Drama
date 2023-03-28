part of 'movie_details_bloc.dart';

class MovieDetailsState extends Equatable {
  final MovieDetails? movieDetails;
  final RequestState movieDetailsState;
  final String movieDetailsMessage;
  final List<Recommendations> recommendationMovies;
  final RequestState recommendationMoviesState;
  final String recommendationMoviesMessage;

  const MovieDetailsState({
    this.movieDetails,
    this.movieDetailsState = RequestState.loading,
    this.movieDetailsMessage = '',
    this.recommendationMovies = const [],
    this.recommendationMoviesState = RequestState.loading,
    this.recommendationMoviesMessage = '',
  });

  MovieDetailsState copyWith({
    MovieDetails? movieDetails,
    RequestState? movieDetailsState,
    String? movieDetailsMessage,
    List<Recommendations>? recommendationMovies,
    RequestState? recommendationMoviesState,
    String? recommendationMoviesMessage,
  }) =>
      MovieDetailsState(
          movieDetails: movieDetails ?? this.movieDetails,
          movieDetailsState: movieDetailsState ?? this.movieDetailsState,
          movieDetailsMessage: movieDetailsMessage ?? this.movieDetailsMessage,
          recommendationMovies:
              recommendationMovies ?? this.recommendationMovies,
          recommendationMoviesState:
              recommendationMoviesState ?? this.recommendationMoviesState,
          recommendationMoviesMessage:
              recommendationMoviesMessage ?? this.recommendationMoviesMessage);
  @override
  List<Object?> get props => [
        movieDetails,
        movieDetailsState,
        movieDetailsMessage,
        recommendationMovies,
        recommendationMoviesState,
        recommendationMoviesMessage,
      ];
}
