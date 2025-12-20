
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'explore_search_input_state.dart';

class ExploreSearchInputCubit extends Cubit<String> {
  ExploreSearchInputCubit() : super("");

  void setSearchInput(String value) {
    emit(value);
  }

  void clearSearchInput() {
    emit('');
  }
}
