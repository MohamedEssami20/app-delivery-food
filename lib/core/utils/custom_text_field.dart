import 'package:app_delivey_food/core/helper/app_theme_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFormFiled extends StatelessWidget {
  const CustomTextFormFiled({
    super.key,
    required this.hintText,
    required this.textInputType,
    this.suffixIcon,
    this.onSaved,
    this.obscureText = false,
    this.maxLength,
    this.inputFormatters,
    this.onChanged,
    this.controller,
    this.textAlign = TextAlign.start,
    this.initialValue,
    this.validator,
    this.enabled,
    this.prefixIcon, this.onSubmit,
  });

  final String hintText;
  final TextInputType textInputType;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final void Function(String?)? onSaved;
  final bool obscureText;
  final int? maxLength;
  final List<TextInputFormatter>? inputFormatters;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmit;
  final TextEditingController? controller;
  final TextAlign textAlign;
  final String? initialValue;
  final String? Function(String?)? validator;
  final bool? enabled;
  @override
  Widget build(BuildContext context) {
    final theme = AppThemeHelper(context);
    return TextFormField(
      enabled: enabled,
      onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
      controller: controller,
      maxLength: maxLength,
      onChanged: onChanged,
      onFieldSubmitted: onSubmit,
      inputFormatters: inputFormatters,
      validator: validator,
      obscureText: obscureText,
      initialValue: initialValue,
      onSaved: onSaved,
      keyboardType: textInputType,
      textAlign: textAlign,
      style: theme.textStyles.titleMedium?.copyWith(
        color: theme.colors.typography500,
      ),
      decoration: InputDecoration(
        counterText: "", // hide counter when maxLength is set
        hintText: hintText,
        hintStyle: theme.textStyles.titleSmall?.copyWith(
          color: theme.colors.typography300,
        ),
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        enabledBorder: buildBorder(theme),
        focusedBorder: buildBorder(theme, theme.colors.primary600),
        border: buildBorder(theme),
        //focusedErrorBorder: buildBorder(theme, theme.colors.primary600),
        errorBorder: buildBorder(theme, theme.colors.red),
        filled: true,
        fillColor: theme.colors.grey0,
      ),
    );
  }

  OutlineInputBorder buildBorder(AppThemeHelper theme, [Color? color]) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(
        width: 1,
        color: color ?? theme.colors.typography100,
      ),
    );
  }
}
