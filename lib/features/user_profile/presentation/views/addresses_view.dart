import 'package:flutter/material.dart';

import '../../../../core/helper/app_theme_helper.dart';
import '../../../../core/function/build_address_item.dart';

import 'edit_address_view.dart';

class AddressesView extends StatelessWidget {
  const AddressesView({super.key});

  static const String routeName = '/addresses';

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
          icon: Icon(Icons.arrow_back_ios, color: theme.colors.typography500, size: 18),
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
          "Addresses",
          style: theme.textStyles.headlineMedium!.copyWith(
            color: theme.colors.typography500,
            fontWeight: FontWeight.w800,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, EditAddressView.routeName);
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
              buildAddressItem(
                context: context,
                title: "Home",
                onTap: () {
                  Navigator.pushNamed(context, EditAddressView.routeName);
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
              buildAddressItem(
                context: context,
                title: "Grandma's house",
                onTap: () {
                  Navigator.pushNamed(context, EditAddressView.routeName);
                },
              ),
              const SizedBox(height: 12),
              buildAddressItem(
                context: context,
                title: "Mama's house",
                onTap: () {
                  Navigator.pushNamed(context, EditAddressView.routeName);
                },
              ),
              const SizedBox(height: 12),
              buildAddressItem(
                context: context,
                title: "Office",
                onTap: () {
                  Navigator.pushNamed(context, EditAddressView.routeName);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

}
