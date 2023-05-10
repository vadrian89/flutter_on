import 'package:bloc_live_coding/theme_switcher/theme_switcher_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'platform_switcher/platform_switcher_cubit.dart';

class ThemeDataBlocBuilder extends StatelessWidget {
  final Widget Function(BuildContext context, ThemeData themeData) builder;

  const ThemeDataBlocBuilder({super.key, required this.builder});

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => ThemeSwitcherCubit(
          platformSwitcherState: context.read<PlatformSwitcherCubit>().stream,
        ),
        child: BlocBuilder<ThemeSwitcherCubit, ThemeSwitcherState>(
          builder: (context, state) {
            final themeData = (state.isDark ? ThemeData.dark() : ThemeData.light()).copyWith(
              platform: state.platform,
            );
            return builder(context, themeData);

            /// return builder(
            ///   context,
            ///   state.when(
            ///     light: () => ThemeData.light(),
            ///     dark: () => ThemeData.dark(),
            ///   ),
            /// );
          },
        ),
      );
}
