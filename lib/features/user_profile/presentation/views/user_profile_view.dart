import 'package:app_delivey_food/features/auth/domain/entities/user_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/helper/app_theme_helper.dart';
import '../../../../core/helper/custom_network_image.dart';
import '../../../../core/utils/assets.dart';
import 'widgets/user_info_body_item.dart';

class UserProfileView extends StatefulWidget {
  const UserProfileView({super.key, required this.user});

  static const String routeName = '/user_profile';
  final UserEntity user;

  @override
  State<UserProfileView> createState() => _UserProfileViewState();
}

class _UserProfileViewState extends State<UserProfileView> {
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
        leading: IconButton(
          icon: Icon(Icons.close, color: theme.colors.black, size: 28),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: SvgPicture.asset(
          Assets.assetsImagesLogoText, // Assuming Bobo logo is this
          height: 24,
          colorFilter: ColorFilter.mode(theme.colors.black, BlendMode.srcIn),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                spacing: 16,
                children: [
                  ClipOval(
                    child: CustomNetowrkImage(
                      imageUrl: user.userImage,
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          user.username,
                          style: theme.textStyles.headlineMedium!.copyWith(
                            color: theme.colors.typography500,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          user.userEmail,
                          style: theme.textStyles.bodyMedium!.copyWith(
                            color: theme.colors.typography400,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(color: theme.colors.grey200),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            spacing: 4,
                            children: [
                              Icon(
                                Icons.star,
                                color: theme.colors.yellow,
                                size: 16,
                              ),
                              Text(
                                "Premium",
                                style: theme.textStyles.bodySmall!.copyWith(
                                  color: theme.colors.typography500,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              UserProfileBodyItem(
                user: user,
                onUserUpdated: (updatedUser) {
                  setState(() {
                    user = updatedUser;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
