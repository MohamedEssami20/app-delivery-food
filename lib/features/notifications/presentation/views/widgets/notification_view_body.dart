import 'package:flutter/material.dart';

import '../../../domain/entities/get_dummy_notifications.dart';
import '../../../domain/entities/notification_entity.dart';
import 'notification_list_view.dart';
import 'notification_tab_switcher.dart';

class NotificationViewBody extends StatefulWidget {
  const NotificationViewBody({super.key});

  @override
  State<NotificationViewBody> createState() => _NotificationViewBodyState();
}

class _NotificationViewBodyState extends State<NotificationViewBody> {
  bool _isNewSelected = true;

  final List<NotificationEntity> _allNotifications = getDummyNotifications();

  List<NotificationEntity> get _newNotifications =>
      _allNotifications.where((n) => n.isNew).toList();

  List<NotificationEntity> get _oldNotifications =>
      _allNotifications.where((n) => !n.isNew).toList();

  bool get _hasNewNotifications => _newNotifications.isNotEmpty;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // tab switcher;
        NotificationTabSwitcher(
          isNewSelected: _isNewSelected,
          hasNewNotifications: _hasNewNotifications,
          onNewTap: () => setState(() => _isNewSelected = true),
          onOldTap: () => setState(() => _isNewSelected = false),
        ),

        // notification list;
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 250),
              transitionBuilder: (child, animation) => FadeTransition(
                opacity: animation,
                child: SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(0.04, 0),
                    end: Offset.zero,
                  ).animate(animation),
                  child: child,
                ),
              ),
              child: NotificationListView(
                key: ValueKey(_isNewSelected),
                notifications: _isNewSelected
                    ? _newNotifications
                    : _oldNotifications,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
