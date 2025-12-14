import 'package:app_delivey_food/core/helper/get_dummy_product_entitiy.dart';
import 'package:app_delivey_food/features/home/presentation/manager/get_advertising_product/get_advertising_product_cubit.dart';
import 'package:app_delivey_food/features/home/presentation/views/widgets/featured_item_list_view.dart'
    show FeaturedItemListView;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class GetFeaturedItemBuilder extends StatelessWidget {
  const GetFeaturedItemBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAdvertisingProductCubit, GetAdvertisingProductState>(
      builder: (context, state) {
        if (state is GetAdvertisingProductSuccess) {
          return FeaturedItemListView(products: state.products);
        } else if (state is GetAdvertisingProductFailure) {
          return Center(child: Text(state.errorMessage));
        }
        return Skeletonizer(
          child: FeaturedItemListView(products: getListDummyProduct()),
        );
      },
    );
  }
}
