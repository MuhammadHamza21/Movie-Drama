import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_drama/core/utils/app_constance.dart';
import 'package:movie_drama/core/utils/enums.dart';
import 'package:movie_drama/tvs/presentation/controller/tv_bloc/tv_bloc.dart';
import 'package:movie_drama/tvs/presentation/screens/tv_details_screen.dart';
import 'package:shimmer/shimmer.dart';

class TopRatedTvComponent extends StatelessWidget {
  const TopRatedTvComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TvBloc, TvState>(
      builder: (context, state) {
        switch (state.topRatedTvState) {
          case RequestState.loading:
            return const SizedBox(
              height: 170,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          case RequestState.loaded:
            return FadeIn(
              duration: const Duration(milliseconds: 500),
              child: SizedBox(
                height: 170.0,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  itemCount: state.topRatedTv.length,
                  itemBuilder: (context, index) {
                    final tv = state.topRatedTv[index];
                    return Container(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: InkWell(
                        onTap: () {
                          /// TODO : NAVIGATE TO  TV DETAILS
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => TvDetailScreen(id: tv.id),
                            ),
                          );
                        },
                        child: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8.0)),
                          child: CachedNetworkImage(
                            width: 120.0,
                            fit: BoxFit.cover,
                            imageUrl: AppConstance.imageUrl(tv.backdropPath),
                            placeholder: (context, url) => Shimmer.fromColors(
                              baseColor: Colors.grey[850]!,
                              highlightColor: Colors.grey[800]!,
                              child: Container(
                                height: 170.0,
                                width: 120.0,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            );
          case RequestState.error:
            return SizedBox(
              height: 170,
              child: Center(
                child: Text(
                  state.topRatedTvMessage,
                ),
              ),
            );
        }
      },
    );
  }
}
