import 'package:app_delivey_food/features/home/presentation/manager/favorite_cubit/favorite_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../helper/app_theme_helper.dart';
import '../utils/assets.dart';

AppBar buildCustomAppBar({
  required AppThemeHelper theme,
  bool? showBackButton,
  bool? showActionButton,
  bool? showTitle,
  String? title,
  bool? isFavourite,
  VoidCallback? onBackPress,
  VoidCallback? onFavoritePress,
  required BuildContext context,
}) {
  return AppBar(
    backgroundColor: theme.colors.grey0,
    elevation: 0,
    centerTitle: true,
    title: Visibility(
      visible: showTitle ?? false,
      child: title == null
          ? SvgPicture.asset(
              Assets.assetsImagesLogoText,
              alignment: Alignment.center,
            )
          : Text(
              title,
              style: theme.textStyles.headlineSmall?.copyWith(
                color: theme.colors.typography500,
              ),
            ),
    ),
    leadingWidth: 90,
    leading: Visibility(
      visible: showBackButton ?? false,
      child: Padding(
        padding: EdgeInsets.only(left: 20),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              onTap:
                  onBackPress ??
                  () {
                    if (Navigator.canPop(context)) {
                      Navigator.pop(context);
                    }
                  },
              child: Icon(
                Icons.arrow_back_ios,
                color: theme.colors.grey500,
                size: 20,
              ),
            ),
            Text(
              'Back',
              style: theme.textStyles.headlineSmall?.copyWith(
                color: theme.colors.typography500,
              ),
            ),
          ],
        ),
      ),
    ),
    actions: [
      Visibility(
        visible: showActionButton ?? false,
        child: Padding(
          padding: const EdgeInsets.only(right: 20),
          child: Row(
            spacing: 16,
            children: [
              SvgPicture.asset(
                Assets.assetsIconsExportIcon,
                colorFilter: ColorFilter.mode(
                  theme.colors.grey500,
                  BlendMode.srcIn,
                ),
              ),
              GestureDetector(
                onTap: onFavoritePress ?? () {},
                child: AddFavoriteIconBuilder(
                  isAlreadyFavorite: isFavourite ?? false,
                ),
              ),
            ],
          ),
        ),
      ),
    ],
  );
}

class AddFavoriteIconBuilder extends StatelessWidget {
  const AddFavoriteIconBuilder({super.key, required this.isAlreadyFavorite});
  final bool isAlreadyFavorite;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteFoodCubit, FavoriteFoodState>(
      builder: (context, state) {
        if (state is AddFavoriteSuccess || isAlreadyFavorite) {
          return SvgPicture.asset(
            Assets.assetsIconsFavoriteNavigatioinIcon,
            colorFilter: ColorFilter.mode(
              Colors.red,
              BlendMode.srcIn,
            ), //Colors.red(),
          );
        } else if (state is AddFavoriteLoading) {
          return FittedBox(
            fit: BoxFit.scaleDown,
            child: SizedBox(
              height: 20,
              width: 20,
              child: CircularProgressIndicator(
                color: Colors.grey,
                strokeWidth: 2,
              ),
            ),
          );
        } else {
          return SvgPicture.asset(
            Assets.assetsIconsFavoriteNavigatioinIcon,
            colorFilter: ColorFilter.mode(Colors.grey, BlendMode.srcIn),
          );
        }
      },
    );
  }
}
