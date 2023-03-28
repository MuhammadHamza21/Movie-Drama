import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_drama/core/services/service_locator.dart';
import 'package:movie_drama/core/utils/enums.dart';
import 'package:movie_drama/core/widgets/movie_details_component.dart';
import 'package:movie_drama/movies/presentation/controller/movies_bloc/movies_bloc.dart';
import 'package:movie_drama/movies/presentation/controller/movies_bloc/movies_events.dart';
import 'package:movie_drama/movies/presentation/controller/movies_bloc/movies_states.dart';
import 'package:movie_drama/movies/presentation/screens/movie_detail_screen.dart';

class PopularMoviesScreen extends StatelessWidget {
  const PopularMoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<MoviesBloc>()..add(GetPopularMoviesEvent()),
      child: Scaffold(
        backgroundColor: Colors.grey.shade900,
        appBar: AppBar(
          backgroundColor: Colors.grey.shade800,
          title: const Text("Popular Movies"),
          centerTitle: true,
        ),
        body: BlocBuilder<MoviesBloc, MoviesState>(
          builder: (context, state) {
            switch (state.popularState) {
              case RequestState.loading:
                return const Center(
                  child: CircularProgressIndicator(),
                );
              case RequestState.loaded:
                return ListView.builder(
                  itemBuilder: (context, index) {
                    var movie = state.popularMovies[index];
                    return MovieDetailsComponent(
                      movie: movie,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => MovieDetailScreen(id: movie.id),
                          ),
                        );
                      },
                    );
                  },
                  itemCount: state.popularMovies.length,
                );
              case RequestState.error:
                return Center(
                  child: Text(
                    state.popularMessage,
                  ),
                );
            }
          },
        ),
      ),
    );
  }
}
