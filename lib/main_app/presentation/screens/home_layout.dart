import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_drama/core/services/service_locator.dart';
import 'package:movie_drama/main_app/presentation/controller/bloc/main_app_bloc.dart';
import 'package:movie_drama/main_app/presentation/screens/main_screen.dart';
import 'package:movie_drama/movies/presentation/controller/movies_bloc/movies_bloc.dart';
import 'package:movie_drama/movies/presentation/controller/movies_bloc/movies_events.dart';
import 'package:movie_drama/tvs/presentation/controller/tv_bloc/tv_bloc.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => sl<MainAppBloc>()),
        BlocProvider(
          create: (context) => sl<MoviesBloc>()
            ..add(GetNowPlayingMoviesEvent())
            ..add(GetPopularMoviesEvent())
            ..add(GetTopRatedMoviesEvent()),
        ),
        BlocProvider(
          create: (context) => sl<TvBloc>()
            ..add(GetOnTheAirTvEvent())
            ..add(GetPopularTvEvent())
            ..add(GetTopRatedTvEvent()),
        ),
      ],
      child: const MainScreen(),
    );
  }
}
