import 'package:app_delivey_food/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/helper/app_theme_helper.dart';

class OnBoardingBodyItem extends StatelessWidget {
  const OnBoardingBodyItem({
    super.key,
    required this.backgroundOfImage,
    required this.backgroudImage,
    required this.title,
    required this.subtitle,
  });
  final String backgroundOfImage;
  final String backgroudImage;
  final String title, subtitle;
  @override
  Widget build(BuildContext context) {
    final theme = AppThemeHelper(context);
    return SizedBox(
      width: double.infinity,
      child: Column(
        spacing: 16,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              SvgPicture.asset(
                backgroundOfImage,
                width: MediaQuery.of(context).size.width * 0.88,
              ),
              Positioned(
                bottom: -12,
                left: backgroudImage == Assets.assetsImagesChefCookingBackground
                    ? 25
                    : 0,
                child: SvgPicture.asset(backgroudImage, height: 400),
              ),
            ],
          ),
          Text(
            title,
            style: theme.textStyles.displayMedium!.copyWith(
              color: theme.colors.typography500,
              fontFamily: "Poppins",
              height: 1.2,
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            subtitle,
            style: theme.textStyles.titleSmall!.copyWith(
              color: theme.colors.typography200,
              fontFamily: "Poppins",
              height: 1.2,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
