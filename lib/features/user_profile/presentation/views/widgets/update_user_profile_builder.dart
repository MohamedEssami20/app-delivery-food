import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/helper/app_theme_helper.dart';
import '../../../../../core/utils/error_snackbar.dart';
import '../../../../../core/utils/success_snackbar.dart';
import '../../../../auth/domain/entities/user_entity.dart';
import '../../../../home/presentation/manager/user_cubit/user_cubit.dart';
import '../../manager/update_profile_cubit/update_profile_cubit.dart';
import '../../manager/update_profile_cubit/update_profile_state.dart';
import '../edit_account_view.dart';

class UpdateUserProfileBuilder extends StatelessWidget {
  const UpdateUserProfileBuilder({
    super.key,
    required this.theme,
    required this.widget,
    required this.nameController,
    required this.phoneController,
    required this.phoneCodeController,
    required this.birthdayController,
    required this.selectedImage,
  });

  final AppThemeHelper theme;
  final EditAccountView widget;
  final TextEditingController nameController;
  final TextEditingController phoneController;
  final TextEditingController phoneCodeController;
  final TextEditingController birthdayController;
  final File? selectedImage;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UpdateProfileCubit, UpdateProfileState>(
      listener: (context, state) {
        if (state is UpdateProfileSuccess) {
          buildSuccessSnackbar(
            message: "user updated successfully",
            theme: theme,
            context: context,
          );
          // Return the updated user so the previous screen updates
          context.read<UserCubit>().getUserData();
          Navigator.pop(context, state.user);
        } else if (state is UpdateProfileFailure) {
          buildErrorSnackbar(
            message: "user updated failed",
            theme: theme,
            context: context,
          );
        }
      },
      builder: (context, state) {
        if (state is UpdateProfileLoading) {
          return const Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Center(
              child: SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
            ),
          );
        }
        return TextButton(
          onPressed: () {
            final updatedUser = UserEntity(
              uid: widget.user.uid,
              username: nameController.text.trim(),
              userEmail: widget.user.userEmail,
              userImage: widget.user.userImage,
              phoneNumber: int.tryParse(phoneController.text.trim()) ?? 0,
              phoneCode: int.tryParse(phoneCodeController.text.trim()) ?? 0,
              birthDate: birthdayController.text.trim(),
            );
            context.read<UpdateProfileCubit>().updateProfile(
              userEntity: updatedUser,
              profileImage: selectedImage,
            );
          },
          child: Text(
            "Save",
            style: theme.textStyles.titleMedium!.copyWith(
              color: theme.colors.green,
              fontWeight: FontWeight.w700,
            ),
          ),
        );
      },
    );
  }
}
