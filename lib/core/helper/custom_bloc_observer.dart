import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

class CustomBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    log("change: $change");
    super.onChange(bloc, change);
  }
}
