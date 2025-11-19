import 'package:app_delivey_food/core/helper/app_theme_helper.dart';
import 'package:app_delivey_food/core/utils/assets.dart';
import 'package:app_delivey_food/core/utils/custom_button.dart';
import 'package:app_delivey_food/features/auth/presentation/views/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../core/function/get_onboarding_view.dart';
import 'on_boarding_dots_indicator.dart';

class OnBoardingViewBody extends StatefulWidget {
  const OnBoardingViewBody({super.key});

  @override
  State<OnBoardingViewBody> createState() => _OnBoardingViewBodyState();
}

class _OnBoardingViewBodyState extends State<OnBoardingViewBody> {
  PageController pageController = PageController();
  bool isActiveDots = false;
  int currentIndex = 0;
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
          SizedBox(
            height: 490,
            child: PageView.builder(
              controller: pageController,
              itemBuilder: (context, index) {
                return getOnBoardingViews()[index];
              },
              onPageChanged: (value) {
                setState(() {
                  currentIndex = value;
                });
              },
              itemCount: getOnBoardingViews().length,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OnBoardingDotsIndicator(isActive: currentIndex == 0),
              SizedBox(width: 8),
              OnBoardingDotsIndicator(isActive: currentIndex == 1),
              SizedBox(width: 8),
              OnBoardingDotsIndicator(isActive: currentIndex == 2),
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
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                      context,
                      LoginView.routeName,
                    );
                  },
                  backgroundColor: theme.colors.grey200,
                  textColor: theme.colors.primary600,
                ),
              ),
              Expanded(
                flex: 2,
                child: CustomButton(
                  label: "Next",
                  onPressed: () {
                    if (pageController.page == 2) {
                      Navigator.pushReplacementNamed(
                        context,
                        LoginView.routeName,
                      );
                    } else {
                      pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                      setState(() {
                        isActiveDots = true;
                        currentIndex += 1;
                      });
                    }
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
