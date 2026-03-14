part of 'bottom_naviagtion_bar_cubit.dart';

sealed class BottomNaviagtionBarState extends Equatable {
  const BottomNaviagtionBarState();

  @override
  List<Object> get props => [];
}

final class BottomNaviagtionBarInitial extends BottomNaviagtionBarState {}

final class BottomNaviagtionBarStateChange extends BottomNaviagtionBarState {
  final int index;
  const BottomNaviagtionBarStateChange({required this.index}) : super();
}
