import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_live_coding/platform_switcher/platform_switcher_cubit.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

/// part 'theme_switcher_cubit.freezed.dart';
part 'theme_switcher_state.dart';

class ThemeSwitcherCubit extends Cubit<ThemeSwitcherState> {
  StreamSubscription<PlatformSwitcherState>? _platformSwitcherSubscription;

  ThemeSwitcherCubit({Stream<PlatformSwitcherState>? platformSwitcherState})
      : super(const ThemeSwitcherState()) {
    _platformSwitcherSubscription = platformSwitcherState?.listen(_parsePlatformState);
  }

  /// When a new state is emitted the ThemeMode is reset to light.
  void _parsePlatformState(PlatformSwitcherState platformState) => emit(state.copyWith(
        platform: platformState.platform,
        themeMode: ThemeMode.light,
      ));

  void toggle(bool value) => emit(state.copyWith(
        themeMode: !value ? ThemeMode.dark : ThemeMode.light,
      ));

  @override
  Future<void> close() {
    _platformSwitcherSubscription?.cancel();
    return super.close();
  }
}
