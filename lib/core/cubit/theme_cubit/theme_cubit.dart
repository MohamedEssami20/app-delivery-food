import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../services/shared_pref_services.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  static const String _themeKey = 'is_dark_mode';

  ThemeCubit() : super(_initialTheme);

  static ThemeMode get _initialTheme {
    final isDark = SharedPrefrenceSigelton.getBoolean(key: _themeKey) ?? false;
    return isDark ? ThemeMode.dark : ThemeMode.light;
  }

  void toggleTheme(bool isDark) {
    SharedPrefrenceSigelton.setBoolean(_themeKey, isDark);
    emit(isDark ? ThemeMode.dark : ThemeMode.light);
  }
}
