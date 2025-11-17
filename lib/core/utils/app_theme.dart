import 'package:flutter/material.dart';
import 'app_text_styles.dart';
import 'app_colors.dart';

// ---------------- Theme Extension for all App Colors ----------------
@immutable
class AppThemeColors extends ThemeExtension<AppThemeColors> {
  // Primary
  final Color primary100;
  final Color primary200;
  final Color primary300;
  final Color primary400;
  final Color primary500;
  final Color primary600;
  final Color primary700;

  // Typography
  final Color typography100;
  final Color typography200;
  final Color typography300;
  final Color typography400;
  final Color typography500;

  // Grey
  final Color grey0;
  final Color grey50;
  final Color grey100;
  final Color grey200;
  final Color grey300;
  final Color grey400;
  final Color grey500;

  // Other
  final Color red;
  final Color yellow;
  final Color blue;
  final Color green;
  final Color orange;

  // Transparent / Opacity
  final Color grey500_6;
  final Color grey0_92;
  final Color primary600_24;
  final Color backgroundBlur;

  // Gradient
  final Color gradientStart;
  final Color gradientEnd;

  // Base
  final Color white;
  final Color black;

  const AppThemeColors({
    required this.primary100,
    required this.primary200,
    required this.primary300,
    required this.primary400,
    required this.primary500,
    required this.primary600,
    required this.primary700,
    required this.typography100,
    required this.typography200,
    required this.typography300,
    required this.typography400,
    required this.typography500,
    required this.grey0,
    required this.grey50,
    required this.grey100,
    required this.grey200,
    required this.grey300,
    required this.grey400,
    required this.grey500,
    required this.red,
    required this.yellow,
    required this.blue,
    required this.green,
    required this.orange,
    required this.grey500_6,
    required this.grey0_92,
    required this.primary600_24,
    required this.backgroundBlur,
    required this.gradientStart,
    required this.gradientEnd,
    required this.white,
    required this.black,
  });

  @override
  AppThemeColors copyWith({
    Color? primary100,
    Color? primary200,
    Color? primary300,
    Color? primary400,
    Color? primary500,
    Color? primary600,
    Color? primary700,
    Color? typography100,
    Color? typography200,
    Color? typography300,
    Color? typography400,
    Color? typography500,
    Color? grey0,
    Color? grey50,
    Color? grey100,
    Color? grey200,
    Color? grey300,
    Color? grey400,
    Color? grey500,
    Color? red,
    Color? yellow,
    Color? blue,
    Color? green,
    Color? orange,
    Color? grey500_6,
    Color? grey0_92,
    Color? primary600_24,
    Color? backgroundBlur,
    Color? gradientStart,
    Color? gradientEnd,
    Color? white,
    Color? black,
  }) {
    return AppThemeColors(
      primary100: primary100 ?? this.primary100,
      primary200: primary200 ?? this.primary200,
      primary300: primary300 ?? this.primary300,
      primary400: primary400 ?? this.primary400,
      primary500: primary500 ?? this.primary500,
      primary600: primary600 ?? this.primary600,
      primary700: primary700 ?? this.primary700,
      typography100: typography100 ?? this.typography100,
      typography200: typography200 ?? this.typography200,
      typography300: typography300 ?? this.typography300,
      typography400: typography400 ?? this.typography400,
      typography500: typography500 ?? this.typography500,
      grey0: grey0 ?? this.grey0,
      grey50: grey50 ?? this.grey50,
      grey100: grey100 ?? this.grey100,
      grey200: grey200 ?? this.grey200,
      grey300: grey300 ?? this.grey300,
      grey400: grey400 ?? this.grey400,
      grey500: grey500 ?? this.grey500,
      red: red ?? this.red,
      yellow: yellow ?? this.yellow,
      blue: blue ?? this.blue,
      green: green ?? this.green,
      orange: orange ?? this.orange,
      grey500_6: grey500_6 ?? this.grey500_6,
      grey0_92: grey0_92 ?? this.grey0_92,
      primary600_24: primary600_24 ?? this.primary600_24,
      backgroundBlur: backgroundBlur ?? this.backgroundBlur,
      gradientStart: gradientStart ?? this.gradientStart,
      gradientEnd: gradientEnd ?? this.gradientEnd,
      white: white ?? this.white,
      black: black ?? this.black,
    );
  }

  @override
  AppThemeColors lerp(ThemeExtension<AppThemeColors>? other, double t) {
    if (other is! AppThemeColors) return this;
    return AppThemeColors(
      primary100: Color.lerp(primary100, other.primary100, t)!,
      primary200: Color.lerp(primary200, other.primary200, t)!,
      primary300: Color.lerp(primary300, other.primary300, t)!,
      primary400: Color.lerp(primary400, other.primary400, t)!,
      primary500: Color.lerp(primary500, other.primary500, t)!,
      primary600: Color.lerp(primary600, other.primary600, t)!,
      primary700: Color.lerp(primary700, other.primary700, t)!,
      typography100: Color.lerp(typography100, other.typography100, t)!,
      typography200: Color.lerp(typography200, other.typography200, t)!,
      typography300: Color.lerp(typography300, other.typography300, t)!,
      typography400: Color.lerp(typography400, other.typography400, t)!,
      typography500: Color.lerp(typography500, other.typography500, t)!,
      grey0: Color.lerp(grey0, other.grey0, t)!,
      grey50: Color.lerp(grey50, other.grey50, t)!,
      grey100: Color.lerp(grey100, other.grey100, t)!,
      grey200: Color.lerp(grey200, other.grey200, t)!,
      grey300: Color.lerp(grey300, other.grey300, t)!,
      grey400: Color.lerp(grey400, other.grey400, t)!,
      grey500: Color.lerp(grey500, other.grey500, t)!,
      red: Color.lerp(red, other.red, t)!,
      yellow: Color.lerp(yellow, other.yellow, t)!,
      blue: Color.lerp(blue, other.blue, t)!,
      green: Color.lerp(green, other.green, t)!,
      orange: Color.lerp(orange, other.orange, t)!,
      grey500_6: Color.lerp(grey500_6, other.grey500_6, t)!,
      grey0_92: Color.lerp(grey0_92, other.grey0_92, t)!,
      primary600_24: Color.lerp(primary600_24, other.primary600_24, t)!,
      backgroundBlur: Color.lerp(backgroundBlur, other.backgroundBlur, t)!,
      gradientStart: Color.lerp(gradientStart, other.gradientStart, t)!,
      gradientEnd: Color.lerp(gradientEnd, other.gradientEnd, t)!,
      white: Color.lerp(white, other.white, t)!,
      black: Color.lerp(black, other.black, t)!,
    );
  }
}

// ---------------- App Theme ----------------
class AppTheme {
  static ThemeData lightTheme() {
    return ThemeData(
      useMaterial3: true,
      fontFamily: AppTextStyles.poppineFontFamily,
      scaffoldBackgroundColor: AppColors.whiteLight,
      extensions: <ThemeExtension<dynamic>>[
        AppThemeColors(
          // Primary
          primary100: AppColors.primary100Light,
          primary200: AppColors.primary200Light,
          primary300: AppColors.primary300Light,
          primary400: AppColors.primary400Light,
          primary500: AppColors.primary500Light,
          primary600: AppColors.primary600Light,
          primary700: AppColors.primary700Light,
          // Typography
          typography100: AppColors.typography100Light,
          typography200: AppColors.typography200Light,
          typography300: AppColors.typography300Light,
          typography400: AppColors.typography400Light,
          typography500: AppColors.typography500Light,
          // Grey
          grey0: AppColors.grey0Light,
          grey50: AppColors.grey50Light,
          grey100: AppColors.grey100Light,
          grey200: AppColors.grey200Light,
          grey300: AppColors.grey300Light,
          grey400: AppColors.grey400Light,
          grey500: AppColors.grey500Light,
          // Other
          red: AppColors.redLight,
          yellow: AppColors.yellowLight,
          blue: AppColors.blueLight,
          green: AppColors.greenLight,
          orange: AppColors.orangeLight,
          // Transparent
          grey500_6: AppColors.grey500_6Light,
          grey0_92: AppColors.grey0_92Light,
          primary600_24: AppColors.primary600_24Light,
          backgroundBlur: AppColors.backgroundBlurLight,
          // Gradient
          gradientStart: AppColors.gradientLightStart,
          gradientEnd: AppColors.gradientLightEnd,
          // Base
          white: AppColors.whiteLight,
          black: AppColors.blackLight,
        ),
      ],
      textTheme: _textTheme(),
    );
  }

  static ThemeData darkTheme() {
    return ThemeData(
      useMaterial3: true,
      fontFamily: AppTextStyles.poppineFontFamily,
      scaffoldBackgroundColor: AppColors.blackDark,
      extensions: <ThemeExtension<dynamic>>[
        AppThemeColors(
          // Primary
          primary100: AppColors.primary100Dark,
          primary200: AppColors.primary200Dark,
          primary300: AppColors.primary300Dark,
          primary400: AppColors.primary400Dark,
          primary500: AppColors.primary500Dark,
          primary600: AppColors.primary600Dark,
          primary700: AppColors.primary700Dark,
          // Typography
          typography100: AppColors.typography100Dark,
          typography200: AppColors.typography200Dark,
          typography300: AppColors.typography300Dark,
          typography400: AppColors.typography400Dark,
          typography500: AppColors.typography500Dark,
          // Grey
          grey0: AppColors.grey0Dark,
          grey50: AppColors.grey50Dark,
          grey100: AppColors.grey100Dark,
          grey200: AppColors.grey200Dark,
          grey300: AppColors.grey300Dark,
          grey400: AppColors.grey400Dark,
          grey500: AppColors.grey500Dark,
          // Other
          red: AppColors.redDark,
          yellow: AppColors.yellowDark,
          blue: AppColors.blueDark,
          green: AppColors.greenDark,
          orange: AppColors.orangeDark,
          // Transparent
          grey500_6: AppColors.grey500_6Dark,
          grey0_92: AppColors.grey0_92Dark,
          primary600_24: AppColors.primary600_24Dark,
          backgroundBlur: AppColors.backgroundBlurDark,
          // Gradient
          gradientStart: AppColors.gradientDarkStart,
          gradientEnd: AppColors.gradientDarkEnd,
          // Base
          white: AppColors.whiteDark,
          black: AppColors.blackDark,
        ),
      ],
      textTheme: _textTheme(),
    );
  }

  static TextTheme _textTheme() {
    return TextTheme(
      displayLarge: AppTextStyles.poppins32Bold,
      displayMedium: AppTextStyles.poppins32BoldAlt,
      displaySmall: AppTextStyles.roboto24SemiBold,
      headlineLarge: AppTextStyles.poppins17Bold,
      headlineMedium: AppTextStyles.poppins17SemiBold,
      headlineSmall: AppTextStyles.poppins15Bold,
      titleLarge: AppTextStyles.poppins17Regular,
      titleMedium: AppTextStyles.poppins15SemiBold,
      titleSmall: AppTextStyles.poppins15Regular,
      bodyLarge: AppTextStyles.roboto17Bold,
      bodyMedium: AppTextStyles.roboto15SemiBold,
      bodySmall: AppTextStyles.roboto12SemiBold,
      labelLarge: AppTextStyles.poppins12Bold,
      labelMedium: AppTextStyles.poppins12Medium,
      labelSmall: AppTextStyles.poppins12Regular,
    );
  }
}
