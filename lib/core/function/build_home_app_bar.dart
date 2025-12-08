import 'package:app_delivey_food/core/helper/app_theme_helper.dart';
import 'package:app_delivey_food/core/helper/custom_network_image.dart';
import 'package:app_delivey_food/features/auth/domain/entities/user_entity.dart';
import 'package:flutter/material.dart';

Widget buildNormalHomeAppBar(AppThemeHelper theme, UserEntity user) {
  return ListTile(
    contentPadding: const EdgeInsets.all(0),
    title: Text(
      user.username,
      style: theme.textStyles.titleSmall!.copyWith(
        color: theme.colors.typography500,
      ),
    ),
    trailing: CircleAvatar(
      radius: 40,
      backgroundColor: Colors.grey.shade100,
      child: CustomNetowrkImage(
        imageUrl: user.userImage,
        width: 40,
        fit: BoxFit.fill,
      ),
    ),
    subtitle: Text(
      "What are you carving?",
      style: theme.textStyles.titleSmall!.copyWith(
        color: theme.colors.typography400,
      ),
    ),
  );
}
