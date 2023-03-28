part of 'main_bloc_bloc.dart';

class MainBlocState extends Equatable {
  final int currentIndex;
  final List<Widget> screens = [
    const MainMoviesScreen(),
    const TvScreen(),
  ];

  MainBlocState({
    this.currentIndex = 0,
  });

  MainBlocState copyWith({
    int? currentIndex,
  }) =>
      MainBlocState(
        currentIndex: currentIndex ?? this.currentIndex,
      );

  @override
  List<Object> get props => [
        currentIndex,
      ];
}
