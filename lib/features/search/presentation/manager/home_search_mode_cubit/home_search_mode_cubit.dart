import 'package:app_delivey_food/core/utils/home_search_mode.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_search_mode_state.dart';

class HomeSearchModeCubit extends Cubit<HomeSearchMode> {
  HomeSearchModeCubit() : super(HomeSearchMode.normal);

  void changeSearchMode() {
    emit(HomeSearchMode.searching);
  }

  void changeNormalMode() {
    emit(HomeSearchMode.normal);
  }

  void changeLatestSearchedMode() {
    emit(HomeSearchMode.latestSearched);
  }
}
