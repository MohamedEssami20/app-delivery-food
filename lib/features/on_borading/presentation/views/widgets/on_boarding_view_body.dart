import 'package:app_delivey_food/core/helper/app_theme_helper.dart';
import 'package:app_delivey_food/core/utils/assets.dart';
import 'package:app_delivey_food/core/utils/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'on_boarding_body_item.dart';
import 'on_boarding_dots_indicator.dart';

class OnBoardingViewBody extends StatelessWidget {
  const OnBoardingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = AppThemeHelper(context);
    return Padding(
      padding: const EdgeInsetsDirectional.only(top: 12, start: 24, end: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 16,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [SvgPicture.asset(Assets.assetsImagesLogoText)],
          ),
          const SizedBox(height: 30),
          OnBoardingBodyItem(),
          Text(
            "Welcome to the most tastiest app",
            style: theme.textStyles.displayMedium!.copyWith(
              color: theme.colors.typography500,
              fontFamily: "Poppins",
              height: 1.2,
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            "You know, this app is edible meaning you can eat it!",
            style: theme.textStyles.titleSmall!.copyWith(
              color: theme.colors.typography200,
              fontFamily: "Poppins",
              height: 1.2,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              OnBoardingDotsIndicator(isActive: true),
              SizedBox(width: 8),
              OnBoardingDotsIndicator(isActive: false),
              SizedBox(width: 8),
              OnBoardingDotsIndicator(isActive: false),
            ],
          ),
          const SizedBox(height: 0),
          Row(
            spacing: 12,
            children: [
              Expanded(
                flex: 1,
                child: CustomButton(
                  label: "Skip",
                  onPressed: () {},
                  backgroundColor: theme.colors.grey200,
                  textColor: theme.colors.primary600,
                ),
              ),
              Expanded(
                flex: 2,
                child: CustomButton(label: "Next", onPressed: () {}),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
