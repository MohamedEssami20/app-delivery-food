import 'package:app_delivey_food/core/function/build_second_custom_app_bar.dart';
import 'package:app_delivey_food/core/services/get_it_services.dart';
import 'package:app_delivey_food/core/utils/payment_listener.dart';
import 'package:app_delivey_food/features/checkout/presentation/manager/add_order_cubit/add_order_cubit.dart';
import 'package:app_delivey_food/features/checkout/presentation/views/widgets/address_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helper/app_theme_helper.dart';
import '../../../cart/domain/entities/cart_item_entity.dart';
import '../../domain/repos/checkout_repo.dart';

class AddressView extends StatelessWidget {
  const AddressView({super.key, required this.cartItemEntity});
  static const routeName = 'address';
  final List<CartItemEntity> cartItemEntity;
  @override
  Widget build(BuildContext context) {
    final theme = AppThemeHelper(context);
    return BlocProvider(
      create: (context) =>
          AddOrderCubit(checkoutRepol: GetItService.getIt.get<CheckoutRepo>()),
      child: Scaffold(
        appBar: buildSecondCustomAppBar(
          theme: theme,
          title: "Add Address",
          titleIcon: "",
          context: context,
          showBackButton: true,
          onBackPress: () {
            Navigator.pop(context);
          },
          showTitleIcon: false,
        ),
        body: PaymentListener(
          child: AddressViewBody(cartItems: cartItemEntity),
        ),
      ),
    );
  }
}
