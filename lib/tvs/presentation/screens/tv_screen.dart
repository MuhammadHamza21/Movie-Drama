import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_drama/core/services/service_locator.dart';
import 'package:movie_drama/tvs/presentation/companents/on_the_air_component.dart';
import 'package:movie_drama/tvs/presentation/companents/popular_tv_component.dart';
import 'package:movie_drama/tvs/presentation/companents/see_more_component.dart';
import 'package:movie_drama/tvs/presentation/companents/top_rated_component.dart';
import 'package:movie_drama/tvs/presentation/controller/tv_bloc/tv_bloc.dart';
import 'package:movie_drama/tvs/presentation/screens/popular_tv_screen.dart';
import 'package:movie_drama/tvs/presentation/screens/top_rated_tv_screen.dart';

class TvScreen extends StatelessWidget {
  const TvScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<TvBloc>()
        ..add(GetOnTheAirTvEvent())
        ..add(GetPopularTvEvent())
        ..add(GetTopRatedTvEvent()),
      child: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SingleChildScrollView(
          key: const Key('tvScrollView'),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const OnTheAirComponent(),
              SeeMoreComponent(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const PopularTvScreen(),
                    ),
                  );
                },
                title: "Popular",
              ),
              const PopularTvComponent(),
              SeeMoreComponent(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const TopRatedTvScreen(),
                    ),
                  );
                },
                title: "Top Rated",
              ),
              const TopRatedTvComponent(),
              const SizedBox(height: 50.0),
            ],
          ),
        ),
      ),
    );
  }
}
