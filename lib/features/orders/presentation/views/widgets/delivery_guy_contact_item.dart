import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/helper/app_theme_helper.dart';

class DeliveryGuyContactItem extends StatelessWidget {
  const DeliveryGuyContactItem({
    super.key,
    required this.theme,
    required this.icon,
  });

  final AppThemeHelper theme;
  final String icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: theme.colors.white,
        shape: BoxShape.rectangle,
        border: Border.all(color: theme.colors.grey200, width: 1.2),
        borderRadius: BorderRadius.circular(8),
      ),
      alignment: Alignment.center,
      child: SvgPicture.asset(icon),
    );
  }
}