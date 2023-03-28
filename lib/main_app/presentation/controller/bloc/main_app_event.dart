part of 'main_app_bloc.dart';

abstract class MainAppEvent extends Equatable {
  const MainAppEvent();

  @override
  List<Object> get props => [];
}

class ChangeCurrentIndexEvent extends MainAppEvent {
  final int currentIndex;

  const ChangeCurrentIndexEvent(this.currentIndex);

  @override
  List<Object> get props => [currentIndex];
}
