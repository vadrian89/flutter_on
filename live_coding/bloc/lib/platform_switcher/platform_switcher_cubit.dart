import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'platform_switcher_state.dart';

class PlatformSwitcherCubit extends Cubit<PlatformSwitcherState> {
  PlatformSwitcherCubit() : super(const PlatformSwitcherState());

  void toggle() => emit(
        PlatformSwitcherState(
          platform: state.platform == TargetPlatform.android
              ? TargetPlatform.iOS
              : TargetPlatform.android,
        ),
      );
}
