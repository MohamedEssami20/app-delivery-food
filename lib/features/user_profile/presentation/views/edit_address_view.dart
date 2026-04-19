import 'package:flutter/material.dart';

import '../../../../core/helper/app_theme_helper.dart';
import '../../../../core/function/build_profile_text_field.dart';


class EditAddressView extends StatefulWidget {
  const EditAddressView({super.key});

  static const String routeName = '/edit_address';

  @override
  State<EditAddressView> createState() => _EditAddressViewState();
}

class _EditAddressViewState extends State<EditAddressView> {
  bool _isDefault = true;

  final TextEditingController _labelController = TextEditingController();
  final TextEditingController _buildingController = TextEditingController();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneCodeController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _stateController = TextEditingController();
  final TextEditingController _zipController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _labelController.text = "Home";
    _buildingController.text = "Buzz apartment 4B";

    _nameController.text = "Daniel Jones";
    _phoneCodeController.text = "405";
    _phoneController.text = "555-0128";
    _addressController.text = "123 Main St, Apt 4B";

    _cityController.text = "New York";
    _stateController.text = "California";
    _zipController.text = "10001";
    _countryController.text = "United States";
  }

  @override
  void dispose() {
    _labelController.dispose();
    _buildingController.dispose();
    _nameController.dispose();
    _phoneCodeController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    _cityController.dispose();
    _stateController.dispose();
    _zipController.dispose();
    _countryController.dispose();
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
          "Edit address",
          style: theme.textStyles.headlineMedium!.copyWith(
            color: theme.colors.typography500,
            fontWeight: FontWeight.w800,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.more_vert, color: theme.colors.typography500),
          ),
        ],
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
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
                              activeThumbColor: theme.colors.white,
                              activeTrackColor: theme.colors.green,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),
                      Divider(color: theme.colors.grey100, thickness: 1),
                      const SizedBox(height: 24),
                      buildProfileTextField(context: context, controller: _labelController, hint: "Address Label"),
                      const SizedBox(height: 16),
                      buildProfileTextField(context: context, controller: _buildingController, hint: "Building/Apartment"),
                      const SizedBox(height: 24),
                      Divider(color: theme.colors.grey100, thickness: 1),
                      const SizedBox(height: 24),
                      buildProfileTextField(context: context, controller: _nameController, hint: "Name"),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: buildProfileTextField(
                              context: context,
                              controller: _phoneCodeController,
                              hint: "Code",
                              textAlign: TextAlign.center,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            flex: 3,
                            child: buildProfileTextField(context: context, controller: _phoneController, hint: "Phone number"),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      buildProfileTextField(context: context, controller: _addressController, hint: "Street Address"),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                            child: buildProfileTextField(context: context, controller: _cityController, hint: "City"),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: buildProfileTextField(context: context, controller: _stateController, hint: "State"),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                            child: buildProfileTextField(context: context, controller: _zipController, hint: "Zip"),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: buildProfileTextField(context: context, controller: _countryController, hint: "Country"),
                          ),
                        ],
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
                    backgroundColor: theme.colors.grey100, // Inactive state
                    foregroundColor: theme.colors.typography300,
                    padding: const EdgeInsets.symmetric(vertical: 18),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    "Save changes",
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
