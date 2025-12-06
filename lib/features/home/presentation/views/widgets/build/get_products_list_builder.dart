import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/helper/app_theme_helper.dart';
import '../../../manager/get_product_cubit/get_products_cubit.dart';
import '../product_list_view.dart';

class GetProductsListBuilder extends StatelessWidget {
  const GetProductsListBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = AppThemeHelper(context);
    return BlocBuilder<GetProductsCubit, GetProductsState>(
      builder: (context, state) {
        if (state is GetProductsSuccess) {
          return ProductsListView(products: state.productsEntity);
        } else if (state is GetProductsFailure) {
          return Center(
            child: Text(
              state.errorMessage,
              style: theme.textStyles.headlineSmall!.copyWith(
                color: theme.colors.black,
              ),
            ),
          );
        }
        return Center(
          child: CircularProgressIndicator(color: theme.colors.primary600),
        );
      },
    );
  }
}
