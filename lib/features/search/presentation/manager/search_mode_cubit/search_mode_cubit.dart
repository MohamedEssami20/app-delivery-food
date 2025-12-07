import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'search_mode_state.dart';

class SearchModeCubit extends Cubit<SearchModeState> {
  SearchModeCubit() : super(SearchModeInitial());

  bool isSearchMode = false;
  bool isLatestSearchedMode = false;

  bool isSearchedExplorerViewMode = false;
  bool isLatestSearchedExplorerViewMode = false;
  void changeSearchMode() {
    isSearchMode = true;
    emit(SearchModeChanged(isSearchMode: isSearchMode));
  }

  void changeNormalMode() {
    isSearchMode = false;
    emit(NormalModeChanged(isNormalMode: isSearchMode));
  }

  void changeLatestSearchedMode() {
    isLatestSearchedMode = true;
    emit(LatestSearchedModeChanged(isLatestSearchedMode: isLatestSearchedMode));
  }

  // create all method that change search mode in Explore view;
  void changeSearchedExploreMode() {
    isSearchedExplorerViewMode = true;
    emit(
      ExplorerViewSearchModeChanged(
        isExplorerSearchMode: isSearchedExplorerViewMode,
      ),
    );
  }

  void changeLatestSearchedExploreMode() {
    isLatestSearchedExplorerViewMode = true;
    emit(
      ExplorerViewLatestSearchedModeChanged(
        isExplorerLatestSearchedMode: isLatestSearchedExplorerViewMode,
      ),
    );
  }

  void changeNormalExploreViewMode() {
    isSearchedExplorerViewMode = false;
    emit(
      ExplorerViewNormalModeChanged(
        isExplorerNormalMode: isSearchedExplorerViewMode,
      ),
    );
  }
}
