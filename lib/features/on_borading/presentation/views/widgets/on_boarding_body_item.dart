import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utils/assets.dart';

class OnBoardingBodyItem extends StatelessWidget {
  const OnBoardingBodyItem({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: [
          SvgPicture.asset(
            Assets.assetsImagesBackgroundOfImageOnBording1,
            width: MediaQuery.of(context).size.width * 0.88,
          ),
          Positioned(
            bottom: -12,
            left: 25,
            child: SvgPicture.asset(
              Assets.assetsImagesChefCookingBackground,
              height: 400,
            ),
          ),
        ],
      ),
    );
  }
}