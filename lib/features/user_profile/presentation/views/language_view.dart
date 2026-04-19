import 'package:flutter/material.dart';

import '../../../../core/helper/app_theme_helper.dart';

class LanguageView extends StatefulWidget {
  const LanguageView({super.key});

  static const String routeName = '/language';

  @override
  State<LanguageView> createState() => _LanguageViewState();
}

class _LanguageViewState extends State<LanguageView> {
  final List<String> _languages = [
    "English",
    "Hindi",
    "Sanskrit",
    "Urdu",
    "French",
    "Spanish",
    "Chinese",
    "Japanese",
    "Korean",
  ];

  String _selectedLanguage = "English";

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
          style: TextButton.styleFrom(
            padding: const EdgeInsets.only(left: 20),
            alignment: Alignment.centerLeft,
          ),
          child: Text(
            "Cancel",
            style: theme.textStyles.titleMedium!.copyWith(
              color: theme.colors.typography500,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        title: Text(
          "Language",
          style: theme.textStyles.headlineMedium!.copyWith(
            color: theme.colors.typography500,
            fontWeight: FontWeight.w800,
          ),
        ),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context); // Handle save
            },
            style: TextButton.styleFrom(
              padding: const EdgeInsets.only(right: 20),
              alignment: Alignment.centerRight,
            ),
            child: Text(
              "Save",
              style: theme.textStyles.titleMedium!.copyWith(
                color: theme.colors.green,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          child: Column(
            children: _languages.map((lang) {
              final isSelected = lang == _selectedLanguage;
              return GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedLanguage = lang;
                  });
                },
                child: Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                  decoration: BoxDecoration(
                    color: theme.colors.grey50,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        lang,
                        style: theme.textStyles.titleMedium!.copyWith(
                          color: theme.colors.typography500,
                        ),
                      ),
                      Container(
                        width: 24,
                        height: 24,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: isSelected ? theme.colors.green : theme.colors.grey200,
                            width: isSelected ? 2 : 1,
                          ),
                        ),
                        child: isSelected
                            ? Center(
                                child: Container(
                                  width: 12,
                                  height: 12,
                                  decoration: BoxDecoration(
                                    color: theme.colors.green,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              )
                            : null,
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
