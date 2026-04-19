import 'package:flutter/material.dart';

import '../../../../../core/helper/app_theme_helper.dart';
import '../../../domain/entities/notification_entity.dart';
import 'notification_item.dart';

class NotificationListView extends StatelessWidget {
  const NotificationListView({super.key, required this.notifications});

  final List<NotificationEntity> notifications;

  @override
  Widget build(BuildContext context) {
    final theme = AppThemeHelper(context);

    if (notifications.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 12,
          children: [
            Icon(
              Icons.notifications_off_outlined,
              size: 64,
              color: theme.colors.grey300,
            ),
            Text(
              'No notifications yet',
              style: theme.textStyles.titleSmall!.copyWith(
                color: theme.colors.typography400,
              ),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.only(top: 24),
      itemCount: notifications.length,
      itemBuilder: (context, index) =>
          NotificationItem(notification: notifications[index]),
    );
  }
}
