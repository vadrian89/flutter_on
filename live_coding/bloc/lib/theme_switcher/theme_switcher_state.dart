part of 'theme_switcher_cubit.dart';

enum ThemeMode { dark, light }

class ThemeSwitcherState extends Equatable {
  final ThemeMode themeMode;
  final TargetPlatform platform;

  bool get isDark => themeMode == ThemeMode.dark;
  @override
  List<Object?> get props => [themeMode, platform];

  const ThemeSwitcherState({
    this.themeMode = ThemeMode.light,
    this.platform = TargetPlatform.android,
  });

  /// The copyWith method is used to create a copy of the current state and update the non-null fields
  /// with the provided values.
  ThemeSwitcherState copyWith({ThemeMode? themeMode, TargetPlatform? platform}) =>
      ThemeSwitcherState(
        themeMode: themeMode ?? this.themeMode,
        platform: platform ?? this.platform,
      );
}

/// Freezed union class used for state.
///
/// @freezed
/// class ThemeSwitcherState with _$ThemeSwitcherState {
///   const factory ThemeSwitcherState.light() = _Light;
///   const factory ThemeSwitcherState.dark() = _Dark;
/// }
///
