import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/helper/app_theme_helper.dart';

class ProductRatingAndCaloreyItem extends StatelessWidget {
  const ProductRatingAndCaloreyItem({
    super.key,
    required this.icon,
    required this.title,
    this.showDivider,
  });
  final String icon, title;
  final bool? showDivider;
  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 4,
      children: [
        Visibility(
          visible: showDivider ?? false,
          child: VerticalDivider(
            color: AppThemeHelper(context).colors.grey200,
            thickness: 1.3,
            indent: 7,
            endIndent: 7,
          ),
        ),
        SvgPicture.asset(icon, width: 16),
        const SizedBox(width: 4),
        Text(
          title,
          style: AppThemeHelper(context).textStyles.titleSmall!.copyWith(
            color: AppThemeHelper(context).colors.typography400,
          ),
        ),
      ],
    );
  }
}
