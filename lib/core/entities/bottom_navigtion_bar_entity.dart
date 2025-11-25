import 'package:app_delivey_food/core/utils/assets.dart';

class BottomNavigtionBarEntity {
  final String activeImage;
  final String inActiveImage;

  BottomNavigtionBarEntity({
    required this.activeImage,
    required this.inActiveImage,
  });
}

List<BottomNavigtionBarEntity> get getBottomNavigtionBarEntity => [
  BottomNavigtionBarEntity(
    activeImage: Assets.assetsIconsHomeNavigationIcon,
    inActiveImage: Assets.assetsIconsHomeNavigationIcon,
  ),
  BottomNavigtionBarEntity(
    activeImage: Assets.assetsIconsExplorerNavigationIcon,
    inActiveImage: Assets.assetsIconsExplorerNavigationIcon,
  ),
  BottomNavigtionBarEntity(
    activeImage: Assets.assetsIconsCartNavigationIcon,
    inActiveImage: Assets.assetsIconsCartNavigationIcon,
  ),
  BottomNavigtionBarEntity(
    activeImage: Assets.assetsIconsFavoriteNavigatioinIcon,
    inActiveImage: Assets.assetsIconsFavoriteNavigatioinIcon,
  ),
  BottomNavigtionBarEntity(
    activeImage: Assets.assetsIconsNotificationNavigationIcon,
    inActiveImage: Assets.assetsIconsNotificationNavigationIcon,
  ),
];
