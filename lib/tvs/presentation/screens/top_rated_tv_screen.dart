import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_drama/core/services/service_locator.dart';
import 'package:movie_drama/core/utils/enums.dart';
import 'package:movie_drama/core/widgets/movie_details_component.dart';
import 'package:movie_drama/tvs/presentation/controller/tv_bloc/tv_bloc.dart';

class TopRatedTvScreen extends StatelessWidget {
  const TopRatedTvScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<TvBloc>()..add(GetTopRatedTvEvent()),
      child: Scaffold(
        backgroundColor: Colors.grey.shade900,
        appBar: AppBar(
          backgroundColor: Colors.grey.shade800,
          title: const Text("Top Rated TVs"),
          centerTitle: true,
        ),
        body: BlocBuilder<TvBloc, TvState>(
          builder: (context, state) {
            switch (state.topRatedTvState) {
              case RequestState.loading:
                return const Center(
                  child: CircularProgressIndicator(),
                );
              case RequestState.loaded:
                return ListView.builder(
                  itemBuilder: (context, index) {
                    var tv = state.topRatedTv[index];
                    return MovieDetailsComponent(
                      movie: tv,
                      onTap: () {},
                    );
                  },
                );
              case RequestState.error:
                return Center(
                  child: Text(state.topRatedTvMessage),
                );
            }
          },
        ),
      ),
    );
  }
}
