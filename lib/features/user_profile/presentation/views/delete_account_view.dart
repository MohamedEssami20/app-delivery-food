import 'package:flutter/material.dart';

import '../../../../core/helper/app_theme_helper.dart';

class DeleteAccountView extends StatefulWidget {
  const DeleteAccountView({super.key});

  static const String routeName = '/delete_account';

  @override
  State<DeleteAccountView> createState() => _DeleteAccountViewState();
}

class _DeleteAccountViewState extends State<DeleteAccountView> {
  final TextEditingController _confirmController = TextEditingController();
  bool _isConfirmed = false;

  @override
  void initState() {
    super.initState();
    _confirmController.addListener(() {
      final text = _confirmController.text.trim();
      if (text == "CONFIRM" && !_isConfirmed) {
        setState(() => _isConfirmed = true);
      } else if (text != "CONFIRM" && _isConfirmed) {
        setState(() => _isConfirmed = false);
      }
    });
  }

  @override
  void dispose() {
    _confirmController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = AppThemeHelper(context);

    // Using a specific color for the delete button if available, else a custom red-orange
    final activeColor = const Color(0xFFE65C40);

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
          "Delete account",
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "You are going to delete your account.",
                        style: theme.textStyles.headlineLarge!.copyWith(
                          color: theme.colors.typography500,
                          fontWeight: FontWeight.w800,
                          fontSize: 32,
                          height: 1.2,
                        ),
                      ),
                      const SizedBox(height: 24),
                      Text(
                        "We are very sorry to see you leaving. Deleting your account will permanently delete all of the data plus any active subscriptions and this action can't be undone!",
                        style: theme.textStyles.bodyLarge!.copyWith(
                          color: theme.colors.typography400,
                          height: 1.5,
                        ),
                      ),
                      const SizedBox(height: 24),
                      Text(
                        'If you still want to delete your account, enter "CONFIRM" to proceed.',
                        style: theme.textStyles.bodyLarge!.copyWith(
                          color: theme.colors.typography400,
                          height: 1.5,
                        ),
                      ),
                      const SizedBox(height: 24),
                      TextFormField(
                        controller: _confirmController,
                        style: theme.textStyles.bodyLarge!.copyWith(
                          color: theme.colors.typography500,
                        ),
                        decoration: InputDecoration(
                          hintText: 'Enter "CONFIRM"',
                          hintStyle: theme.textStyles.bodyLarge!.copyWith(
                            color: theme.colors.typography300,
                          ),
                          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
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
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _isConfirmed ? () {} : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _isConfirmed ? activeColor : theme.colors.grey100,
                    foregroundColor: _isConfirmed ? theme.colors.white : theme.colors.typography300,
                    disabledBackgroundColor: theme.colors.grey100,
                    disabledForegroundColor: theme.colors.typography300,
                    padding: const EdgeInsets.symmetric(vertical: 18),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    "Delete account",
                    style: theme.textStyles.titleMedium!.copyWith(
                      fontWeight: FontWeight.w700,
                      color: _isConfirmed ? theme.colors.white : theme.colors.typography300,
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
