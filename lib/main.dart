import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/core/services/theme_service.dart';
import 'package:weather_app/core/services/theme_service_prefs.dart';
import 'package:weather_app/features/home/screens/home_screen.dart';
import 'package:weather_app/features/settings/settings_screen.dart';
import 'package:weather_app/features/splash/splash_screen.dart';
import 'package:weather_app/theme/theme_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final ThemeService themeService = ThemeServicePrefs();

  await themeService.init();

  final ThemeController themeController = ThemeController(themeService);

  await themeController.loadAll();
  runApp(ProviderScope(child: WeatherApp(themeController: themeController)));
}

const FlexSchemeData _myFlexScheme = FlexSchemeData(
  name: 'Weather App',
  description: 'Weather custom FlexSchemeData',
  light: FlexSchemeColor(
    primary: Color(0xFF469D9A),
    primaryContainer: Color(0xFFA0C2ED),
    secondary: Color(0xFF18181B),
    secondaryContainer: Color(0xFFFFD270),
    tertiary: Color(0xFF2563EB),
    tertiaryContainer: Color(0xFFEFF6FF),
    appBarColor: Color(0xFF469D9A),
  ),
  dark: FlexSchemeColor(
    primary: Color(0xFF469D9A),
    primaryContainer: Color(0xFF3873BA),
    secondary: Color(0xFF18181B),
    secondaryContainer: Color(0xFFD26900),
    tertiary: Color(0xFFC9CBFC),
    tertiaryContainer: Color(0xFF535393),
    appBarColor: Color(0xFF469D9A),
  ),
);

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key, required this.themeController});
  final ThemeController themeController;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: themeController,
        builder: (BuildContext context, Widget? child) {
          return MaterialApp(
            title: 'Weather App',
            initialRoute: '/',
            routes: {
              '/': (context) => SplashScreen(
                    flexSchemeData: _myFlexScheme,
                    themeController: themeController,
                  ),
              '/home': (context) => HomeScreen(
                    flexSchemeData: _myFlexScheme,
                    themeController: themeController,
                  ),
              '/settings': (context) => SettingsScreen(
                    flexSchemeData: _myFlexScheme,
                    themeController: themeController,
                  ),
            },
            theme: FlexThemeData.light(
              scaffoldBackground: const Color(0xFFF0F0F0),
              colors: _myFlexScheme.light,
              subThemesData: themeController.useSubThemes
                  ? const FlexSubThemesData()
                  : null,
              appBarElevation: 0.5,
              visualDensity: VisualDensity.standard,
              typography: Typography.material2021(
                platform: defaultTargetPlatform,
              ),
              textTheme: Typography.material2021(
                platform: defaultTargetPlatform,
              ).black,
              lightIsWhite: true,
            ),
            darkTheme: FlexThemeData.dark(
              colors: _myFlexScheme.dark,
              subThemesData: themeController.useSubThemes
                  ? const FlexSubThemesData()
                  : null,
              appBarElevation: 1,
              visualDensity: VisualDensity.standard,
              onBackground: Colors.white,
              typography: Typography.material2021(
                platform: defaultTargetPlatform,
              ),
              textTheme: Typography.material2021(
                platform: defaultTargetPlatform,
              ).white,
              darkIsTrueBlack: false,
            ),
            themeMode: themeController.themeMode,
            debugShowCheckedModeBanner: false,
          );
        });
  }
}
