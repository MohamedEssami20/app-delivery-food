import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/helper/app_theme_helper.dart';
import '../../../../home/presentation/manager/favorite_cubit/favorite_cubit.dart';
import '../../manager/get_favorites_cubit/get_favorites_cubit.dart';
import 'empty_favorite_food.dart';
import 'favorite_product_list_view.dart';

class FavoriteViewBody extends StatefulWidget {
  const FavoriteViewBody({super.key});

  @override
  State<FavoriteViewBody> createState() => _FavoriteViewBodyState();
}

class _FavoriteViewBodyState extends State<FavoriteViewBody> {
  @override
  void initState() {
    super.initState();
    // load favorite products when view is first created;
    context.read<GetFavoritesCubit>().getFavoriteProducts();
  }

  @override
  Widget build(BuildContext context) {
    final theme = AppThemeHelper(context);

    return BlocListener<FavoriteFoodCubit, FavoriteFoodState>(
      // listen to all favorite changes that come from ANY screen (e.g. details view);
      listener: (context, state) {
        if (state is RemoveFavoriteSuccess) {
          // instantly remove from list without a network call;
          context.read<GetFavoritesCubit>().removeProductFromList(
            productId: state.foodId,
          );
        } else if (state is AddFavoriteSuccess) {
          // re-fetch the full list so the newly added product appears;
          context.read<GetFavoritesCubit>().getFavoriteProducts();
        }
      },
      child: BlocBuilder<GetFavoritesCubit, GetFavoritesState>(
        builder: (context, state) {
          if (state is GetFavoritesLoading) {
            return Center(
              child: CircularProgressIndicator(color: theme.colors.primary600),
            );
          }

          if (state is GetFavoritesFailure) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.error_outline_rounded,
                      size: 64,
                      color: theme.colors.grey400,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      state.errorMessage,
                      textAlign: TextAlign.center,
                      style: theme.textStyles.headlineSmall!.copyWith(
                        color: theme.colors.typography400,
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextButton.icon(
                      onPressed: () => context
                          .read<GetFavoritesCubit>()
                          .getFavoriteProducts(),
                      icon: const Icon(Icons.refresh_rounded),
                      label: const Text('Try Again'),
                    ),
                  ],
                ),
              ),
            );
          }

          if (state is GetFavoritesSuccess) {
            if (state.products.isEmpty) {
              return const Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: EmptyFavoriteFood(),
                ),
              );
            }
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: FavoriteProductListView(products: state.products),
            );
          }

          // GetFavoritesInitial — waiting for first load;
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
