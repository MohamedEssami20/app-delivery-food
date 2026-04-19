import 'package:flutter/material.dart';

import '../../../../core/helper/app_theme_helper.dart';
import '../../../../core/function/build_profile_text_field.dart';

class AddCardView extends StatefulWidget {
  const AddCardView({super.key});

  static const String routeName = '/add_card';

  @override
  State<AddCardView> createState() => _AddCardViewState();
}

class _AddCardViewState extends State<AddCardView> {
  bool _isDefault = false;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _expController = TextEditingController();
  final TextEditingController _cvvController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _numberController.dispose();
    _expController.dispose();
    _cvvController.dispose();
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
          "Add a card",
          style: theme.textStyles.headlineMedium!.copyWith(
            color: theme.colors.typography500,
            fontWeight: FontWeight.w800,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: theme.colors.grey50,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                "Set as default",
                                style: theme.textStyles.titleMedium!.copyWith(
                                  color: theme.colors.typography500,
                                ),
                              ),
                            ),
                            Switch(
                              value: _isDefault,
                              onChanged: (val) {
                                setState(() {
                                  _isDefault = val;
                                });
                              },
                              activeThumbColor: theme.colors.primary600,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),
                      Divider(color: theme.colors.grey100, thickness: 1),
                      const SizedBox(height: 24),
                      buildProfileTextField(
                        context: context,
                        controller: _nameController,
                        hint: "Cardholder name",
                      ),
                      const SizedBox(height: 16),
                      buildProfileTextField(
                        context: context,
                        controller: _numberController,
                        hint: "Card number",
                      ),
                      const SizedBox(height: 16),
                      buildProfileTextField(
                        context: context,
                        controller: _expController,
                        hint: "Expiration date",
                      ),
                      const SizedBox(height: 16),
                      buildProfileTextField(
                        context: context,
                        controller: _cvvController,
                        hint: "CVV",
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        theme.colors.grey100, // Inactive state color
                    foregroundColor: theme.colors.typography400,
                    padding: const EdgeInsets.symmetric(vertical: 18),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    "Save",
                    style: theme.textStyles.titleMedium!.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
