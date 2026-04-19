import 'package:app_delivey_food/features/auth/domain/entities/user_entity.dart';
import 'package:flutter/material.dart';

import '../../../../core/helper/app_theme_helper.dart';
import '../../../../core/helper/custom_network_image.dart';

class EditAccountView extends StatefulWidget {
  const EditAccountView({super.key, required this.user});

  static const String routeName = '/edit_account';
  final UserEntity user;

  @override
  State<EditAccountView> createState() => _EditAccountViewState();
}

class _EditAccountViewState extends State<EditAccountView> {
  late TextEditingController nameController;
  late TextEditingController phoneCodeController;
  late TextEditingController phoneController;
  late TextEditingController birthdayController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.user.username);
    phoneCodeController = TextEditingController(text: "405");
    phoneController = TextEditingController(text: "555-0128");
    birthdayController = TextEditingController(text: "12-10-1996");
  }

  @override
  void dispose() {
    nameController.dispose();
    phoneCodeController.dispose();
    phoneController.dispose();
    birthdayController.dispose();
    super.dispose();
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
        leading: TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(
            "Cancel",
            style: theme.textStyles.titleMedium!.copyWith(
              color: theme.colors.typography500,
              fontWeight: FontWeight.w700,
            ),
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
            onPressed: () {
              // Handle save action here
              Navigator.pop(context);
            },
            child: Text(
              "Save",
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
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  ClipOval(
                    child: CustomNetowrkImage(
                      imageUrl: widget.user.userImage,
                      width: 120,
                      height: 120,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 4, right: 4),
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: theme.colors.grey50,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: theme.colors.black.withValues(alpha: 0.1),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Icon(
                      Icons.camera_alt,
                      color: theme.colors.typography400,
                      size: 20,
                    ),
                  )
                ],
              ),
              const SizedBox(height: 32),
              _buildTextField(context: context, controller: nameController),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: _buildTextField(
                      context: context,
                      controller: phoneCodeController,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    flex: 3,
                    child: _buildTextField(context: context, controller: phoneController),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              _buildTextField(context: context, controller: birthdayController),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                decoration: BoxDecoration(
                  border: Border.all(color: theme.colors.grey200),
                  borderRadius: BorderRadius.circular(12),
                  color: theme.colors.grey0,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        "Address - Home",
                        style: theme.textStyles.bodyLarge!.copyWith(
                          color: theme.colors.typography500,
                        ),
                      ),
                    ),
                    Icon(Icons.arrow_forward_ios, color: theme.colors.grey400, size: 16),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required BuildContext context,
    required TextEditingController controller,
    TextAlign textAlign = TextAlign.start,
  }) {
    final theme = AppThemeHelper(context);
    return TextFormField(
      controller: controller,
      textAlign: textAlign,
      style: theme.textStyles.bodyLarge!.copyWith(
        color: theme.colors.typography500,
      ),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        filled: true,
        fillColor: theme.colors.grey0,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: theme.colors.grey200),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: theme.colors.grey200),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: theme.colors.primary600),
        ),
      ),
    );
  }
}
