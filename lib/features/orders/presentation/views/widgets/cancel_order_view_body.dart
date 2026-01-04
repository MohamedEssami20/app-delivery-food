import 'package:app_delivey_food/core/helper/app_theme_helper.dart';
import 'package:app_delivey_food/core/utils/custom_button.dart';
import 'package:app_delivey_food/core/utils/custom_text_field.dart';
import 'package:flutter/material.dart';

class CancelOrderViewBody extends StatefulWidget {
  const CancelOrderViewBody({super.key});

  @override
  State<CancelOrderViewBody> createState() => _CancelOrderViewBodyState();
}

class _CancelOrderViewBodyState extends State<CancelOrderViewBody> {
  TextEditingController controller = TextEditingController();
  int charCount = 0;
  @override
  Widget build(BuildContext context) {
    final theme = AppThemeHelper(context);
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        spacing: 12,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "We are sorry to hear this",
            style: theme.textStyles.displayLarge!.copyWith(
              color: theme.colors.typography500,
            ),
          ),
          Text(
            "Tell us why you choose to cancel your order, is the reason from our side?",
            style: theme.textStyles.titleSmall!.copyWith(
              color: theme.colors.typography400,
            ),
          ),
          Text(
            "Write down your reason to cancel your order:",
            style: theme.textStyles.titleSmall!.copyWith(
              color: theme.colors.typography400,
            ),
          ),
          CustomTextFormFiled(
            controller: controller,
            onChanged: (value) {
              setState(() {
                charCount = value.length;
              });
            },
            hintText: "Write here",
            textInputType: TextInputType.text,
            maxLength: 220,
            maxLine: 10,
          ),
          Align(
            alignment: AlignmentGeometry.bottomRight,
            child: Text(
              "$charCount/220",
              style: theme.textStyles.titleSmall!.copyWith(
                color: theme.colors.typography400,
              ),
            ),
          ),
          Spacer(),
          SizedBox(
            width: double.infinity,
            child: CustomButton(
              label: "Submit",
              onPressed: () {},
              backgroundColor: theme.colors.primary500,
              padding: EdgeInsetsDirectional.symmetric(vertical: 16),
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
