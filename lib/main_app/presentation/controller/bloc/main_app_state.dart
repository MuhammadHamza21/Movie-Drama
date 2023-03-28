part of 'main_app_bloc.dart';

class MainAppState extends Equatable {
  MainAppState({
    this.currentIndex = 0,
  });
  final int currentIndex;
  final List<Widget> screens = [
    const MainMoviesScreen(),
    const TvScreen(),
  ];

  @override
  List<Object> get props => [
        currentIndex,
        screens,
      ];
}
