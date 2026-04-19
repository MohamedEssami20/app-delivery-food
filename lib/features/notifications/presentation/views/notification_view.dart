import 'package:flutter/material.dart';

import '../../../../core/function/build_second_custom_app_bar.dart';
import '../../../../core/helper/app_theme_helper.dart';
import '../../../../core/utils/assets.dart';
import 'widgets/notification_view_body.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  static const String routeName = '/notification';

  @override
  Widget build(BuildContext context) {
    final theme = AppThemeHelper(context);
    return Scaffold(
      backgroundColor: theme.colors.grey0,
      appBar: buildSecondCustomAppBar(
        theme: theme,
        context: context,
        title: 'Notification',
        titleIcon: Assets.assetsIconsNotificationNavigationIcon,
      ),
      body: const NotificationViewBody(),
    );
  }
}
