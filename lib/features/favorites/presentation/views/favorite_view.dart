import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/function/build_second_custom_app_bar.dart';
import '../../../../core/helper/app_theme_helper.dart' show AppThemeHelper;
import '../../../../core/services/get_it_services.dart';
import '../../../../core/utils/assets.dart';
import '../../domain/repos/favorites_repo.dart';
import '../manager/get_favorites_cubit/get_favorites_cubit.dart';
import 'widgets/favorite_view_body.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = AppThemeHelper(context);
    return BlocProvider(
      create: (context) => GetFavoritesCubit(
        favoritesRepo: GetItService.getIt.get<FavoritesRepo>(),
      ),
      child: Scaffold(
        backgroundColor: theme.colors.grey0,
        appBar: buildSecondCustomAppBar(
          theme: theme,
          context: context,
          title: 'Favorites',
          titleIcon: Assets.assetsIconsFavoriteNavigatioinIcon,
        ),
        body: const FavoriteViewBody(),
      ),
    );
  }
}
