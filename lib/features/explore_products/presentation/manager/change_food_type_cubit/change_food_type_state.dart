part of 'change_food_type_cubit.dart';

 class ChangeFoodTypeState extends Equatable {
  final FoodCategory selectedCategory;
  const ChangeFoodTypeState(this.selectedCategory);

  @override
  List<Object> get props => [selectedCategory];
}