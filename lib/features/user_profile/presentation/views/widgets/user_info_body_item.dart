import 'package:flutter/material.dart';

import '../../../../../core/function/buid_user_info_menue_item.dart';
import '../../../../../core/helper/app_theme_helper.dart';
import '../../../../auth/domain/entities/user_entity.dart';
import '../my_account_view.dart';

class UserProfileBodyItem extends StatelessWidget {
  const UserProfileBodyItem({super.key, required this.user});
  final UserEntity user;
  @override
  Widget build(BuildContext context) {
    final theme = AppThemeHelper(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "General",
          style: theme.textStyles.titleSmall!.copyWith(
            color: theme.colors.typography500,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 16),
        buildMenuItem(
          context: context,
          icon: Icons.person_outline,
          title: "My Account",
          onTap: () {
            Navigator.pushNamed(
              context,
              MyAccountView.routeName,
              arguments: user,
            );
          },
        ),
        buildMenuItem(
          context: context,
          icon: Icons.list_alt,
          title: "My Orders",
          onTap: () {
            Navigator.pushNamed(context, '/my_orders');
          },
        ),
        buildMenuItem(
          context: context,
          icon: Icons.payment_outlined,
          title: "Payment",
          onTap: () {},
        ),
        buildMenuItem(
          context: context,
          icon: Icons.location_on_outlined,
          title: "Addresses",
          onTap: () {},
        ),
        buildMenuItem(
          context: context,
          icon: Icons.auto_awesome_outlined,
          title: "Subscription",
          onTap: () {},
        ),
        buildMenuItem(
          context: context,
          icon: Icons.settings_outlined,
          title: "Settings",
          onTap: () {},
        ),
        const SizedBox(height: 24),
        Text(
          "Theme",
          style: theme.textStyles.titleSmall!.copyWith(
            color: theme.colors.typography500,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: theme.colors.grey50,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Icon(Icons.dark_mode_outlined, color: theme.colors.typography500),
              const SizedBox(width: 16),
              Text(
                "Dark mode",
                style: theme.textStyles.titleMedium!.copyWith(
                  color: theme.colors.typography500,
                ),
              ),
              const Spacer(),
              Switch(
                value: false,
                onChanged: (val) {},
                activeThumbColor: theme.colors.primary600,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
