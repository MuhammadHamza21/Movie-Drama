import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_drama/core/services/service_locator.dart';
import 'package:movie_drama/core/utils/enums.dart';
import 'package:movie_drama/core/widgets/movie_details_component.dart';
import 'package:movie_drama/tvs/presentation/controller/tv_bloc/tv_bloc.dart';

class PopularTvScreen extends StatelessWidget {
  const PopularTvScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<TvBloc>()..add(GetPopularTvEvent()),
      child: Scaffold(
        backgroundColor: Colors.grey.shade900,
        appBar: AppBar(
          backgroundColor: Colors.grey.shade800,
          title: const Text("Popular TVs"),
          centerTitle: true,
        ),
        body: BlocBuilder<TvBloc, TvState>(
          builder: (context, state) {
            switch (state.popularTvState) {
              case RequestState.loading:
                return const Center(
                  child: CircularProgressIndicator(),
                );
              case RequestState.loaded:
                return ListView.builder(
                  itemBuilder: (context, index) {
                    var tv = state.popularTv[index];
                    return MovieDetailsComponent(
                      movie: tv,
                      onTap: () {},
                    );
                  },
                );
              case RequestState.error:
                return Center(
                  child: Text(state.popularTvMessage),
                );
            }
          },
        ),
      ),
    );
  }
}
