import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/helper/app_theme_helper.dart';
import '../../manager/search_products_cubit/search_products_cubit.dart';
import 'search_product_list_view.dart';

class SearchViewBodyBuilder extends StatelessWidget {
  const SearchViewBodyBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = AppThemeHelper(context);
    return BlocBuilder<SearchProductsCubit, SearchProductsState>(
      builder: (context, state) {
        if (state is SearchProductsSuccess) {
          if (state.products.isEmpty) {
            return const Center(child: Text("No products found"));
          }
          return SearchProductListView(products: state.products);
        } else if (state is SearchProductsFailure) {
          return Center(child: Text(state.errormessage));
        }
        return Center(
          child: CircularProgressIndicator(color: theme.colors.primary600),
        );
      },
    );
  }
}
