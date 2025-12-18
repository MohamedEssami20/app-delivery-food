part of 'home_search_mode_cubit.dart';

sealed class HomeSearchModeState extends Equatable {
  const HomeSearchModeState();

  @override
  List<Object> get props => [];
}

final class SearchModeInitial extends HomeSearchModeState {}