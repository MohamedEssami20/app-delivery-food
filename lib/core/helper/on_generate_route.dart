// create on generate route method;

import 'package:app_delivey_food/core/helper/order_placed_args.dart';
import 'package:flutter/material.dart';

import '../../features/auth/presentation/views/forgot_password_view.dart';
import '../../features/auth/presentation/views/login_view.dart';
import '../../features/auth/presentation/views/sign_up_view.dart';
import '../../features/cart/domain/entities/cart_item_entity.dart';
import '../../features/checkout/presentation/views/address_view.dart';
import '../../features/checkout/presentation/views/order_placed_view.dart';
import '../../features/orders/presentation/views/cancel_order_view.dart';
import '../../features/orders/presentation/views/track_order_view.dart';
import '../entities/product_entity.dart';
import '../../features/home/presentation/views/details_view.dart';
import '../../features/home/presentation/views/main_view.dart';
import '../../features/on_borading/presentation/views/on_boarding_view.dart';
import '../../features/splash/presentation/views/splash_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashView.routeName:
      return MaterialPageRoute(builder: (_) => const SplashView());
    case OnBoardingView.routeName:
      return MaterialPageRoute(builder: (_) => const OnBoardingView());
    case LoginView.routeName:
      return MaterialPageRoute(builder: (_) => const LoginView());
    case SignUpView.routeName:
      return MaterialPageRoute(builder: (_) => const SignUpView());
    case ForgotPasswordView.routeName:
      return MaterialPageRoute(builder: (_) => const ForgotPasswordView());
    case MainView.routeName:
      return MaterialPageRoute(builder: (_) => const MainView());
    case DetailsView.routeName:
      return MaterialPageRoute(
        builder: (_) =>
            DetailsView(product: settings.arguments as ProductEntity),
      );
    case AddressView.routeName:
      return MaterialPageRoute(
        builder: (_) => AddressView(
          cartItemEntity: settings.arguments as List<CartItemEntity>,
        ),
      );
    case OrderPlacedView.routeName:
    final args = settings.arguments as OrderPlacedArgs;
      return MaterialPageRoute(
        builder: (_) => OrderPlacedView(
          args: args,
        ),
      );
    case TrackOrderView.routeName:
    final args = settings.arguments as OrderPlacedArgs;
      return MaterialPageRoute(
        builder: (_) => TrackOrderView(
          args: args,
        ),
      );
    case CancelOrderView.routeName:
      return MaterialPageRoute(builder: (_) => const CancelOrderView());
    default:
      return MaterialPageRoute(
        builder: (_) => Scaffold(
          body: Center(child: Text('No route defined for ${settings.name}')),
        ),
      );
  }
}