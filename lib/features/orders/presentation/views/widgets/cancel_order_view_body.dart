import 'package:app_delivey_food/core/helper/app_theme_helper.dart';
import 'package:app_delivey_food/core/utils/custom_button.dart';
import 'package:app_delivey_food/core/utils/custom_text_field.dart';
import 'package:app_delivey_food/core/utils/error_snackbar.dart';
import 'package:app_delivey_food/features/home/presentation/views/main_view.dart';
import 'package:app_delivey_food/features/orders/presentation/manager/cancel_order_state/cancel_order_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CancelOrderViewBody extends StatefulWidget {
  const CancelOrderViewBody({super.key, required this.orderId});
  final int orderId;
  @override
  State<CancelOrderViewBody> createState() => _CancelOrderViewBodyState();
}

class _CancelOrderViewBodyState extends State<CancelOrderViewBody> {
  TextEditingController controller = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  int charCount = 0;
  @override
  Widget build(BuildContext context) {
    final theme = AppThemeHelper(context);
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Form(
        key: formKey,
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
              validator: (value) {
                if (value!.isEmpty) {
                  return "you should add reason to cancel order";
                } else {
                  return null;
                }
              },
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
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    context
                        .read<CancelOrderCubit>()
                        .cancelOrder(reason: controller.text, orderId: widget.orderId);
                  }
                },
                backgroundColor: theme.colors.primary500,
                padding: EdgeInsetsDirectional.symmetric(vertical: 16),
                child: CancelOrderButtonBuilder(),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}

class CancelOrderButtonBuilder extends StatelessWidget {
  const CancelOrderButtonBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = AppThemeHelper(context);
    return BlocConsumer<CancelOrderCubit, CancelOrderState>(
      builder: (context, state) {
        if (state is CancelOrderLoading) {
          return CircularProgressIndicator(color: theme.colors.white);
        } else {
          return Text(
            "Cancel order",
            style: theme.textStyles.headlineSmall?.copyWith(
              color: theme.colors.white,
            ),
          );
        }
      },
      listener: (context, state) {
        if (state is CancelOrderSuccess) {
          buildErrorSnackbar(
            message: "Cancel order successfully",
            theme: theme,
            context: context,
          );
          Navigator.pushNamedAndRemoveUntil(
            context,
            MainView.routeName,
            (_) => false,
          );
        }
        if (state is CancelOrderError) {
          buildErrorSnackbar(
            message: "Cancel order error, try later",
            theme: theme,
            context: context,
          );
        }
      },
    );
  }
}
