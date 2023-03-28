// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'main_bloc_bloc.dart';

abstract class MainBlocEvent extends Equatable {
  const MainBlocEvent();

  @override
  List<Object> get props => [];
}

class ChangeCurrentIndexEvent extends MainBlocEvent {
  final int currentIndex;
  const ChangeCurrentIndexEvent({
    required this.currentIndex,
  });
  @override
  List<Object> get props => [
        currentIndex,
      ];
}
