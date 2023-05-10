import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimpleBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    if (kDebugMode) {
      print('SimpleBlocObserver: ${bloc.runtimeType} $change');
    }
    super.onChange(bloc, change);
  }

  @override
  void onCreate(BlocBase bloc) {
    if (kDebugMode) {
      print("SimpleBlocObserver: ${bloc.runtimeType} created");
    }
    super.onCreate(bloc);
  }
}
