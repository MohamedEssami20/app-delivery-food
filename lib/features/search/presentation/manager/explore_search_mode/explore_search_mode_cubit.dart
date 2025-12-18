
import 'package:app_delivey_food/core/utils/explore_search_mode.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'explore_search_mode_state.dart';

class ExploreSearchModeCubit extends Cubit<ExploreSearchMode> {
  ExploreSearchModeCubit() : super(ExploreSearchMode.normal);

  void changeExploreSearchMode() {
    emit(ExploreSearchMode.searching);
  }

  void changeNormalMode() {
    emit(ExploreSearchMode.normal);
  }

  void changeLatestSearchedMode() {
    emit(ExploreSearchMode.latest);
  }
}
