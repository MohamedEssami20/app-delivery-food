import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/helper/app_theme_helper.dart';
import '../../manager/search_products_cubit/search_products_cubit.dart';

class LatestSearchItem extends StatelessWidget {
  const LatestSearchItem({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          text,
          style: AppThemeHelper(context).textStyles.titleLarge?.copyWith(
            color: AppThemeHelper(context).colors.typography500,
          ),
        ),
        Spacer(),
        GestureDetector(
          onTap: () {
            context.read<SearchProductsCubit>().deleteSearchQuery(query: text);
          },
          child: Icon(
            Icons.close,
            color: AppThemeHelper(context).colors.typography500,
          ),
        ),
      ],
    );
  }
}
