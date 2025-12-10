
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'change_food_type_state.dart';

class ChangeFoodTypeCubit extends Cubit<ChangeFoodTypeState> {
  ChangeFoodTypeCubit() : super(ChangeFoodTypeInitial());

  bool isFastFoodSelected = false;
  bool isIndianFoodSelected = false;
  bool isDessertFoodSelected = false;
  bool isSeaFoodSelected = false;

  void changeFastFoodSelected() {
    isFastFoodSelected = !isFastFoodSelected;
    emit(FastFoodChanged(isFastFoodSelected: isFastFoodSelected));
  }

  void changeIndianFoodSelected() {
    isIndianFoodSelected = !isIndianFoodSelected;
    emit(IndianFoodChanged(isIndianFoodSelected: isIndianFoodSelected));
  }

  void changeDessertFoodSelected() {
    isDessertFoodSelected = !isDessertFoodSelected;
    emit(DessertFoodChanged(isDessertFoodSelected: isDessertFoodSelected));
  }

  void changeSeaFoodSelected() {
    isSeaFoodSelected = !isSeaFoodSelected;
    emit(SeaFoodChanged(isSeaFoodSelected: isSeaFoodSelected));
  }

  void backToNormalMode() {
    isFastFoodSelected = false;
    isIndianFoodSelected = false;
    isDessertFoodSelected = false;
    isSeaFoodSelected = false;
    emit(ChangeFoodTypeInitial());
  }
}
