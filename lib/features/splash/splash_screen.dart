import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:weather_app/features/home/screens/home_screen.dart';
import 'package:weather_app/theme/theme_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen(
      {super.key, required this.flexSchemeData, required this.themeController});
  final FlexSchemeData flexSchemeData;
  final ThemeController themeController;

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double iconWidth = 50;
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacementNamed(
        '/home',
        arguments: HomeScreen(
          flexSchemeData: widget.flexSchemeData,
          themeController: widget.themeController,
        ),
      );
    });
    SchedulerBinding.instance.addPostFrameCallback((_) {
      setState(() {
        iconWidth = 100;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 900),
              curve: Curves.easeInOutCubic,
              height: iconWidth,
              width: iconWidth,
              child: Icon(
                MdiIcons.weatherPartlyCloudy,
                color: widget.flexSchemeData.light.primary,
                size: iconWidth,
              ),
            ),
            const SizedBox(height: 20),
            RichText(
              text: TextSpan(
                text: 'Powered by ',
                style: Theme.of(context).textTheme.labelMedium,
                children: [
                  TextSpan(
                    text: 'WeatherAPI.com',
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                          color: widget.flexSchemeData.light.primary,
                        ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
