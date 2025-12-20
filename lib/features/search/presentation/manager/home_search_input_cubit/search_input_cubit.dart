import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'search_input_state.dart';

class HomeSearchInputCubit extends Cubit<String> {
  HomeSearchInputCubit() : super('');

  void setSearchInput(String value) {
    emit(value);
  }

  void clearSearchInput() {
    emit('');
  }
}
