import 'package:app_delivey_food/core/utils/success_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/home/presentation/manager/favorite_cubit/favorite_cubit.dart';
import '../utils/error_snackbar.dart';
import 'app_theme_helper.dart';

class AddFavoriteListener extends StatelessWidget {
  const AddFavoriteListener({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    final theme = AppThemeHelper(context);
    return BlocListener<FavoriteFoodCubit, FavoriteFoodState>(
      listener: (context, state) {
        if (state is AddFavoriteSuccess) {
          buildSuccessSnackbar(
            message: "Added to favorite successfully",
            theme: theme,
            context: context,
          );
        } else if (state is AddFavoriteError) {
          buildErrorSnackbar(
            message: "Failed to add to favorite",
            theme: theme,
            context: context,
          );
        }
      },
      child: child,
    );
  }
}
