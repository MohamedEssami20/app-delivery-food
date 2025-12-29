import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/helper/app_theme_helper.dart';

class OrderPlacedDetailsItem extends StatelessWidget {
  const OrderPlacedDetailsItem({
    super.key,
    required this.icon,
    required this.title,
    required this.subTiltle,
  });
  final String icon, title, subTiltle;
  @override
  Widget build(BuildContext context) {
    final theme = AppThemeHelper(context);
    return Row(
      spacing: 8,
      children: [
        SvgPicture.asset(icon, width: 15),
        Text(
          title,
          style: theme.textStyles.titleSmall!.copyWith(
            color: theme.colors.typography400,
          ),
        ),
        Spacer(),
        Text(
          subTiltle,
          style: theme.textStyles.titleSmall!.copyWith(
            color: theme.colors.typography400,
          ),
        ),
      ],
    );
  }
}