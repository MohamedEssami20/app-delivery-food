import 'dart:developer';

import 'package:app_delivey_food/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart' show SvgPicture;

import '../../../../../core/helper/app_theme_helper.dart';
import '../../../../../core/utils/custom_button.dart';

class FeaturedItem extends StatelessWidget {
  const FeaturedItem({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = AppThemeHelper(context);
    final width = MediaQuery.sizeOf(context).width;
    log("is Dark Mode = ${theme.isDarkMode}");
    return Container(
      padding: EdgeInsets.only(left: 20, top: 20, bottom: 0),
      width: width * 0.9,
      decoration: BoxDecoration(
        color: AppThemeHelper(context).colors.primary100,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "35% OFF on Burgers!",
                  style: theme.textStyles.displayMedium!.copyWith(
                    color: theme.colors.typography500,
                  ),
                ),
                const SizedBox(height: 12),

                SizedBox(
                  width: 100,
                  height: 40,
                  child: CustomButton(
                    eleveation: 1.45,
                    onPressed: () {},
                    backgroundColor: theme.colors.primary500,
                    child: Text(
                      "Buy now",
                      style: theme.textStyles.labelMedium!.copyWith(
                        color: Colors.white,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w900,
                        height: 1.5,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomRight,
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(12),
                    ),
                    child: SvgPicture.asset(
                      Assets.assetsImagesFeaturedBackground,
                      alignment: AlignmentGeometry.bottomRight,
                      fit: BoxFit.fill,
                      height: 150,
                      clipBehavior: Clip.none,
                      colorFilter: ColorFilter.mode(
                        theme.isDarkMode
                            ? Color(0xFF52574E)
                            : Color(0xffCADABD),
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                  SvgPicture.asset(
                    Assets.assetsImagesBurgerOnBoardingBackground,
                    alignment: AlignmentGeometry.bottomRight,
                    fit: BoxFit.fill,
                    height: 160,
                    clipBehavior: Clip.none,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
