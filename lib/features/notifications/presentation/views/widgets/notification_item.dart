import 'package:app_delivey_food/features/notifications/domain/entities/notification_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/helper/app_theme_helper.dart';
import '../../../../../core/utils/assets.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({super.key, required this.notification});

  final NotificationEntity notification;

  @override
  Widget build(BuildContext context) {
    final theme = AppThemeHelper(context);

    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 14,
        children: [
          // app logo icon with circular grey background;
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              color: theme.colors.grey100,
              shape: BoxShape.circle,
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: SvgPicture.asset(
                Assets.assetsIconsNotificationNavigationIcon,
                colorFilter: ColorFilter.mode(
                  theme.colors.primary600,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),

          // title, body and time;
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 4,
              children: [
                Text(
                  notification.title,
                  style: theme.textStyles.titleSmall!.copyWith(
                    color: theme.colors.typography500,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  notification.body,
                  style: theme.textStyles.bodyMedium!.copyWith(
                    color: theme.colors.typography400,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  notification.timeAgo,
                  style: theme.textStyles.bodyMedium!.copyWith(
                    color: theme.colors.typography500,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
