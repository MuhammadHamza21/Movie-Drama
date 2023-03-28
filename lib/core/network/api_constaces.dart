class ApiConstances {
  static const String baseUrl = "https://api.themoviedb.org/3";
  static const String apiKey = "5dc65eac272706116b31bfe7b3c91cc3";
  static const String nowPlayingMoviesPath =
      "$baseUrl/movie/now_playing?api_key=$apiKey";
  static const String popularMoviesPath =
      "$baseUrl/movie/popular?api_key=$apiKey";
  static const String topRatedMoviesPath =
      "$baseUrl/movie/top_rated?api_key=$apiKey";
  static const String onTheAirTvPath = "$baseUrl/tv/on_the_air?api_key=$apiKey";
  static const String popularTvPath = "$baseUrl/tv/popular?api_key=$apiKey";
  static const String topRatedTvPath = "$baseUrl/tv/top_rated?api_key=$apiKey";
  static String movieDetails(int id) => "$baseUrl/movie/$id?api_key=$apiKey";
  static String recommendationMovies(int id) =>
      "$baseUrl/movie/$id/recommendations?api_key=$apiKey";
}