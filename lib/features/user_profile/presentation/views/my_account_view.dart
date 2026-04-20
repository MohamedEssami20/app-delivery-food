import 'package:app_delivey_food/features/auth/domain/entities/user_entity.dart';
import 'package:flutter/material.dart';

import '../../../../core/helper/app_theme_helper.dart';
import '../../../../core/function/build_account_menu_item.dart';

import '../../../../core/helper/custom_network_image.dart';
import 'edit_account_view.dart';

class MyAccountView extends StatefulWidget {
  const MyAccountView({super.key, required this.user});

  static const String routeName = '/my_account';
  final UserEntity user;

  @override
  State<MyAccountView> createState() => _MyAccountViewState();
}

class _MyAccountViewState extends State<MyAccountView> {
  late UserEntity user;

  @override
  void initState() {
    super.initState();
    user = widget.user;
  }

  @override
  Widget build(BuildContext context) {
    final theme = AppThemeHelper(context);

    return Scaffold(
      backgroundColor: theme.colors.grey0,
      appBar: AppBar(
        backgroundColor: theme.colors.grey0,
        elevation: 0,
        leadingWidth: 80,
        leading: TextButton.icon(
          onPressed: () => Navigator.pop(context, user),
          icon: Icon(
            Icons.arrow_back_ios,
            color: theme.colors.typography500,
            size: 18,
          ),
          label: Text(
            "Back",
            style: theme.textStyles.titleMedium!.copyWith(
              color: theme.colors.typography500,
              fontWeight: FontWeight.w600,
            ),
          ),
          style: TextButton.styleFrom(
            padding: const EdgeInsets.only(left: 10),
            alignment: Alignment.centerLeft,
          ),
        ),
        title: Text(
          "My Account",
          style: theme.textStyles.headlineMedium!.copyWith(
            color: theme.colors.typography500,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () async {
              final updatedUser = await Navigator.pushNamed(
                context,
                EditAccountView.routeName,
                arguments: user,
              );
              if (updatedUser != null && updatedUser is UserEntity) {
                setState(() {
                  user = updatedUser;
                });
              }
            },
            child: Text(
              "Edit",
              style: theme.textStyles.titleMedium!.copyWith(
                color: theme.colors.green,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipOval(
                child: CustomNetowrkImage(
                  imageUrl: user.userImage,
                  width: 120,
                  height: 120,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                user.username,
                style: theme.textStyles.headlineLarge!.copyWith(
                  color: theme.colors.typography500,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                user.userEmail,
                style: theme.textStyles.bodyLarge!.copyWith(
                  color: theme.colors.typography400,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                "+${user.phoneCode} ${user.phoneNumber}", // Mock phone
                style: theme.textStyles.titleMedium!.copyWith(
                  color: theme.colors.typography500,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 32),
              buildAccountMenuItem(
                context: context,
                title: "Addresses",
                onTap: () {
                  Navigator.pushNamed(context, '/addresses');
                },
              ),
              buildAccountMenuItem(
                context: context,
                title: "Payment",
                onTap: () {
                  Navigator.pushNamed(context, '/payment_methods');
                },
              ),
              buildAccountMenuItem(
                context: context,
                title: "My Orders",
                onTap: () {
                  Navigator.pushNamed(context, '/my_orders');
                },
              ),
              buildAccountMenuItem(
                context: context,
                title: "Settings",
                onTap: () {
                  Navigator.pushNamed(context, '/settings');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
