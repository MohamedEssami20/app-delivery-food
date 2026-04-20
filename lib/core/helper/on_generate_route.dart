// create on generate route method;

import 'package:app_delivey_food/core/helper/order_placed_args.dart';
import 'package:app_delivey_food/core/services/get_it_services.dart';
import 'package:app_delivey_food/features/user_profile/domain/repos/user_profile_repo.dart';
import 'package:app_delivey_food/features/user_profile/presentation/manager/update_profile_cubit/update_profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
import '../../features/user_profile/presentation/views/edit_account_view.dart';
import '../../features/user_profile/presentation/views/my_account_view.dart';
import '../../features/user_profile/presentation/views/user_profile_view.dart';
import '../../features/user_profile/presentation/views/payment_methods_view.dart';
import '../../features/user_profile/presentation/views/add_card_view.dart';
import '../../features/user_profile/presentation/views/edit_card_view.dart';
import '../../features/user_profile/presentation/views/addresses_view.dart';
import '../../features/user_profile/presentation/views/edit_address_view.dart';
import '../../features/user_profile/presentation/views/settings_view.dart';
import '../../features/user_profile/presentation/views/language_view.dart';
import '../../features/user_profile/presentation/views/customer_support_view.dart';
import '../../features/user_profile/presentation/views/delete_account_view.dart';
import '../../features/auth/domain/entities/user_entity.dart';
import '../../features/orders/presentation/views/my_orders_view.dart';

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
      return MaterialPageRoute(builder: (_) => OrderPlacedView(args: args));
    case TrackOrderView.routeName:
      final args = settings.arguments as OrderPlacedArgs;
      return MaterialPageRoute(builder: (_) => TrackOrderView(args: args));
    case CancelOrderView.routeName:
      return MaterialPageRoute(
        builder: (_) => CancelOrderView(orderId: settings.arguments as int),
      );
    case UserProfileView.routeName:
      return MaterialPageRoute(
        builder: (_) => UserProfileView(user: settings.arguments as UserEntity),
      );
    case MyAccountView.routeName:
      return MaterialPageRoute(
        builder: (_) => MyAccountView(user: settings.arguments as UserEntity),
      );
    case EditAccountView.routeName:
      return MaterialPageRoute(
        builder: (_) => BlocProvider(
          create: (context) =>
              UpdateProfileCubit(GetItService.getIt.get<UserProfileRepo>()),
          child: EditAccountView(user: settings.arguments as UserEntity),
        ),
      );
    case MyOrdersView.routeName:
      return MaterialPageRoute(builder: (_) => const MyOrdersView());
    case PaymentMethodsView.routeName:
      return MaterialPageRoute(builder: (_) => const PaymentMethodsView());
    case AddCardView.routeName:
      return MaterialPageRoute(builder: (_) => const AddCardView());
    case EditCardView.routeName:
      return MaterialPageRoute(builder: (_) => const EditCardView());
    case AddressesView.routeName:
      return MaterialPageRoute(builder: (_) => const AddressesView());
    case EditAddressView.routeName:
      return MaterialPageRoute(builder: (_) => const EditAddressView());
    case SettingsView.routeName:
      return MaterialPageRoute(builder: (_) => const SettingsView());
    case LanguageView.routeName:
      return MaterialPageRoute(builder: (_) => const LanguageView());
    case CustomerSupportView.routeName:
      return MaterialPageRoute(builder: (_) => const CustomerSupportView());
    case DeleteAccountView.routeName:
      return MaterialPageRoute(builder: (_) => const DeleteAccountView());
    default:
      return MaterialPageRoute(
        builder: (_) => Scaffold(
          body: Center(child: Text('No route defined for ${settings.name}')),
        ),
      );
  }
}
