part of 'platform_switcher_cubit.dart';

class PlatformSwitcherState extends Equatable {
  final TargetPlatform platform;

  const PlatformSwitcherState({this.platform = TargetPlatform.android});
  @override
  List<Object?> get props => [platform];
}
