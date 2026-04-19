import 'package:flutter/material.dart';

import '../../../../core/helper/app_theme_helper.dart';
import '../../../../core/function/build_switch_item.dart';

import '../../../../core/function/build_setting_item.dart';

import 'customer_support_view.dart';
import 'language_view.dart';
import 'widgets/logout_dialog.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  static const String routeName = '/settings';

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
          onPressed: () => Navigator.pop(context),
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
          "Settings",
          style: theme.textStyles.headlineMedium!.copyWith(
            color: theme.colors.typography500,
            fontWeight: FontWeight.w800,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "General",
                style: theme.textStyles.titleSmall!.copyWith(
                  color: theme.colors.typography400,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 16),
              buildSettingItem(
                context: context,
                icon: Icons.sync_alt,
                title: "Switch Account",
                onTap: () {},
              ),
              buildSettingItem(
                context: context,
                icon: Icons.translate,
                title: "Language",
                trailingText: "English",
                onTap: () {
                  Navigator.pushNamed(context, LanguageView.routeName);
                },
              ),
              buildSwitchItem(
                context: context,
                icon: Icons.dark_mode_outlined,
                title: "Dark mode",
                value: false,
                onChanged: (val) {},
              ),
              const SizedBox(height: 24),
              Text(
                "Others",
                style: theme.textStyles.titleSmall!.copyWith(
                  color: theme.colors.typography400,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 16),
              buildSettingItem(
                context: context,
                icon: Icons.lock_outline,
                title: "Privacy Policy",
                onTap: () {},
              ),
              buildSettingItem(
                context: context,
                icon: Icons.chat_bubble_outline,
                title: "Customer Support",
                onTap: () {
                  Navigator.pushNamed(context, CustomerSupportView.routeName);
                },
              ),
              buildSettingItem(
                context: context,
                icon: Icons.article_outlined,
                title: "Terms & Conditions",
                onTap: () {},
              ),
              const SizedBox(height: 24),
              Text(
                "Danger Actions",
                style: theme.textStyles.titleSmall!.copyWith(
                  color: theme.colors.typography400,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 16),
              buildSettingItem(
                context: context,
                icon: Icons.delete_outline,
                title: "Delete Account",
                onTap: () {
                  Navigator.pushNamed(context, '/delete_account');
                },
              ),
              buildSettingItem(
                context: context,
                icon: Icons.logout,
                title: "Log out",
                onTap: () {
                  showLogoutDialog(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }


}
