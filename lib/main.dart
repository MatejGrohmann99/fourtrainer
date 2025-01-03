import 'package:flutter/material.dart';

import 'package:fourtrainer/src/presentation/trainer_grid.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.brown,
        primary: const Color.fromRGBO(82, 56, 46, 1),
        brightness: Brightness.dark,
      ),
      useMaterial3: true,
    );
    final cardTheme = themeData.cardTheme.copyWith(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.zero,
      ),
      color: const Color.fromRGBO(82, 56, 46, 1),
      margin: const EdgeInsets.all(0),
    );
    final alertDialog = themeData.dialogTheme.copyWith(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.zero,
      ),
    );
    final checkboxTheme = themeData.checkboxTheme.copyWith(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.zero,
      ),
      checkColor: MaterialStateProperty.all(Colors.white),
    );
    final outLinedButton = OutlinedButtonThemeData(
      style: (themeData.outlinedButtonTheme.style ?? const ButtonStyle()).copyWith(
        shape: const WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
          ),
        ),
        foregroundColor: const WidgetStatePropertyAll(Colors.white),
      ),
    );

    final iconButtonTheme = IconButtonThemeData(
      style: (themeData.iconButtonTheme.style ?? const ButtonStyle()).copyWith(
        shape: WidgetStateProperty.all(
          const RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
          ),
        ),
      ),
    );

    return MaterialApp(
      title: '4x4 Edge trainer',
      darkTheme: themeData.copyWith(
        cardTheme: cardTheme,
        iconButtonTheme: iconButtonTheme,
        outlinedButtonTheme: outLinedButton,
        checkboxTheme: checkboxTheme,
        dialogTheme: alertDialog,
      ),
      themeMode: ThemeMode.dark,
      home: const DashboardPage(),
    );
  }
}

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: TrainerGrid(),
    );
  }
}
