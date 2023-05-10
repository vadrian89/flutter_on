import 'package:bloc_live_coding/platform_switcher/platform_switcher_cubit.dart';
import 'package:bloc_live_coding/simple_bloc_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'theme_switcher/theme_switcher_cubit.dart';
import 'theme_data_bloc_builder.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => PlatformSwitcherCubit(),
        child: ThemeDataBlocBuilder(
          builder: (context, themeData) => MaterialApp(
            title: 'Flutter Demo',
            theme: themeData,
            home: const MyHomePage(title: 'Flutter Demo Home Page'),
          ),
        ),
      );
}

class MyHomePage extends StatelessWidget {
  final String title;

  const MyHomePage({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final platform = theme.platform;
    final brightness = theme.brightness;
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SwitchListTile.adaptive(
              title: Text(platform == TargetPlatform.iOS ? "iOS" : "Android"),
              value: platform == TargetPlatform.iOS,
              onChanged: (_) => context.read<PlatformSwitcherCubit>().toggle(),
            ),
            SwitchListTile.adaptive(
              title: Text("Lights are ${brightness == Brightness.light ? "on" : "off"}"),
              value: brightness == Brightness.light,
              onChanged: context.read<ThemeSwitcherCubit>().toggle,
            ),
          ],
        ),
      ),
    );
  }
}
