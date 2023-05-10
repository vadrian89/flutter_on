part of 'platform_switcher_cubit.dart';

class PlatformSwitcherState extends Equatable {
  final TargetPlatform platform;

  @override
  List<Object?> get props => [platform];

  const PlatformSwitcherState({this.platform = TargetPlatform.android});
}
