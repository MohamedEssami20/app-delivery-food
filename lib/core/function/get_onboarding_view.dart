import 'package:flutter/material.dart';

import '../../features/on_borading/presentation/views/widgets/on_boarding_body_item.dart';
import '../utils/assets.dart';

List<Widget> getOnBoardingViews() {
  return const [
    OnBoardingBodyItem(
      backgroundOfImage: Assets.assetsImagesBackgroundOfImageOnBording1,
      backgroudImage: Assets.assetsImagesChefCookingBackground,
      title: "Welcome to the most tastiest app",
      subtitle: "You know, this app is edible meaning you can eat it!",
    ),
    OnBoardingBodyItem(
      backgroundOfImage: Assets.assetsImagesBackgroundOfImageOnBording2,
      backgroudImage: Assets.assetsImagesDeliveryGuyBackground,
      title: "We use nitro on bicycles for delivery!",
      subtitle:
          "For very fast delivery we use nitro on bicycles, kidding, but we’re very fast.",
    ),
    OnBoardingBodyItem(
      backgroundOfImage: Assets.assetsImagesBackgroundOfImageOnBording3,
      backgroudImage: Assets.assetsImagesBirthdayGirlBackground,
      title: "We’re the besties of birthday peoples!",
      subtitle: "We send cakes to our plus members, (only one cake per person)",
    ),
  ];
}
