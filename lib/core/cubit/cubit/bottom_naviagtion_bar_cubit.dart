import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'bottom_naviagtion_bar_state.dart';

class BottomNavigtionBarCubit extends Cubit<int> {
  BottomNavigtionBarCubit() : super(0);

  void changeIndex(int index) =>
      emit( index);
}
