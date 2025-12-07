part of 'search_mode_cubit.dart';

sealed class SearchModeState extends Equatable {
  const SearchModeState();

  @override
  List<Object> get props => [];
}

final class SearchModeInitial extends SearchModeState {}

final class SearchModeChanged extends SearchModeState {
  final bool isSearchMode;
  const SearchModeChanged({required this.isSearchMode});
}

final class NormalModeChanged extends SearchModeState {
  final bool isNormalMode;
  const NormalModeChanged({required this.isNormalMode});
}

final class LatestSearchedModeChanged extends SearchModeState {
  final bool isLatestSearchedMode;
  const LatestSearchedModeChanged({required this.isLatestSearchedMode});
}

// create all state of search mode in products view;

final class ExplorerViewSearchModeChanged extends SearchModeState {
  final bool isExplorerSearchMode;
  const ExplorerViewSearchModeChanged({required this.isExplorerSearchMode});
}

final class ExplorerViewNormalModeChanged extends SearchModeState {
  final bool isExplorerNormalMode;
  const ExplorerViewNormalModeChanged({required this.isExplorerNormalMode});
}

final class ExplorerViewLatestSearchedModeChanged extends SearchModeState {
  final bool isExplorerLatestSearchedMode;
  const ExplorerViewLatestSearchedModeChanged({
    required this.isExplorerLatestSearchedMode,
  });
}
