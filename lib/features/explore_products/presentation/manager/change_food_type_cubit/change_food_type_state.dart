part of 'change_food_type_cubit.dart';

sealed class ChangeFoodTypeState extends Equatable {
  const ChangeFoodTypeState();

  @override
  List<Object> get props => [];
}

final class ChangeFoodTypeInitial extends ChangeFoodTypeState {}

// create all state to change food type;

final class IndianFoodChanged extends ChangeFoodTypeState {
  final bool isIndianFoodSelected;
  const IndianFoodChanged({required this.isIndianFoodSelected});
}

final class DessertFoodChanged extends ChangeFoodTypeState {
  final bool isDessertFoodSelected;
  const DessertFoodChanged({required this.isDessertFoodSelected});
}

final class FastFoodChanged extends ChangeFoodTypeState {
  final bool isFastFoodSelected;
  const FastFoodChanged({required this.isFastFoodSelected});
}

final class SeaFoodChanged extends ChangeFoodTypeState {
  final bool isSeaFoodSelected;
  const SeaFoodChanged({required this.isSeaFoodSelected});
}

