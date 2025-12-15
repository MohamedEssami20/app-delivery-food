
import 'package:app_delivey_food/core/utils/food_category.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'change_food_type_state.dart';

class ChangeFoodTypeCubit extends Cubit<ChangeFoodTypeState> {
  ChangeFoodTypeCubit() : super(const ChangeFoodTypeState(FoodCategory.none));

  // create select category method;
  void selectCategory(FoodCategory category) {
    emit(ChangeFoodTypeState(category));
  }

  // create reset category method;
  void resetCategory() {
    emit(const ChangeFoodTypeState(FoodCategory.none));
  }
}
