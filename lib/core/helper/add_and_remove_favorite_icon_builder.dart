import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../features/home/presentation/manager/favorite_cubit/favorite_cubit.dart';
import '../utils/assets.dart';

class AddAndRemoveFavoriteIconBuilder extends StatelessWidget {
  const AddAndRemoveFavoriteIconBuilder({
    super.key,
    required this.isAlreadyFavorite,
    this.foodId,
  });

  final bool isAlreadyFavorite;
  final String? foodId;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteFoodCubit, FavoriteFoodState>(
      builder: (context, state) {
        bool isFavorite = isAlreadyFavorite;
        if (foodId != null) {
          isFavorite = context.read<FavoriteFoodCubit>().isFavorite(foodId!);
        }

        bool isLoading = false;
        if (foodId != null) {
          if (state is AddFavoriteLoading && state.foodId == foodId) {
            isLoading = true;
          } else if (state is RemoveFavoriteLoading && state.foodId == foodId) {
            isLoading = true;
          }
        }

        if (isLoading) {
          return FittedBox(
            fit: BoxFit.scaleDown,
            child: SizedBox(
              height: 20,
              width: 20,
              child: CircularProgressIndicator(
                color: Colors.grey,
                strokeWidth: 2,
              ),
            ),
          );
        }

        return SvgPicture.asset(
          Assets.assetsIconsFavoriteNavigatioinIcon,
          colorFilter: ColorFilter.mode(
            isFavorite ? Colors.red : Colors.grey,
            BlendMode.srcIn,
          ),
        );
      },
    );
  }
}
