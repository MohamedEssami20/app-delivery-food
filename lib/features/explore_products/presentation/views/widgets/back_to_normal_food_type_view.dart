import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/helper/app_theme_helper.dart';
import '../../manager/change_food_type_cubit/change_food_type_cubit.dart';

class BackToNormalFoodTypeView extends StatelessWidget {
  const BackToNormalFoodTypeView({
    super.key,
    required this.theme,
  });

  final AppThemeHelper theme;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IconButton(
          onPressed: () {
            context.read<ChangeFoodTypeCubit>().backToNormalMode();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: theme.colors.typography500,
          ),
        ),
      ],
    );
  }
}