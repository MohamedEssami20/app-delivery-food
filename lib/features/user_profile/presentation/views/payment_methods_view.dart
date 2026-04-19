import 'package:flutter/material.dart';

import '../../../../core/helper/app_theme_helper.dart';
import '../../../../core/function/build_payment_item.dart';

import 'add_card_view.dart';
import 'edit_card_view.dart';

class PaymentMethodsView extends StatelessWidget {
  const PaymentMethodsView({super.key});

  static const String routeName = '/payment_methods';

  @override
  Widget build(BuildContext context) {
    final theme = AppThemeHelper(context);

    return Scaffold(
      backgroundColor: theme.colors.grey0,
      appBar: AppBar(
        backgroundColor: theme.colors.grey0,
        elevation: 0,
        leadingWidth: 80,
        leading: TextButton.icon(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back_ios,
            color: theme.colors.typography500,
            size: 18,
          ),
          label: Text(
            "Back",
            style: theme.textStyles.titleMedium!.copyWith(
              color: theme.colors.typography500,
              fontWeight: FontWeight.w600,
            ),
          ),
          style: TextButton.styleFrom(
            padding: const EdgeInsets.only(left: 10),
            alignment: Alignment.centerLeft,
          ),
        ),
        title: Text(
          "Payment Methods",
          style: theme.textStyles.headlineMedium!.copyWith(
            color: theme.colors.typography500,
            fontWeight: FontWeight.w800,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, AddCardView.routeName);
            },
            icon: Icon(Icons.add, color: theme.colors.typography500, size: 28),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Default",
                style: theme.textStyles.titleSmall!.copyWith(
                  color: theme.colors.typography400,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 16),
              buildPaymentItem(
                context: context,
                title: "Mastercard - Daniel Jones",
                onTap: () {
                  Navigator.pushNamed(context, EditCardView.routeName);
                },
              ),
              const SizedBox(height: 24),
              Divider(color: theme.colors.grey100, thickness: 1),
              const SizedBox(height: 24),
              Text(
                "Others",
                style: theme.textStyles.titleSmall!.copyWith(
                  color: theme.colors.typography400,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 16),
              buildPaymentItem(
                context: context,
                title: "Mastercard - Emily Jones",
                onTap: () {
                  Navigator.pushNamed(context, EditCardView.routeName);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

}
