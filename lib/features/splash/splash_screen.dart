import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
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
    SchedulerBinding.instance.addPostFrameCallback((_) {
      setState(() {
        iconWidth = 100;
      });
    });
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacementNamed('/home');
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Powered by ',
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText(
                      'WeatherAPI.com',
                      textStyle:
                          Theme.of(context).textTheme.labelMedium?.copyWith(
                                color: widget.flexSchemeData.light.primary,
                              ),
                      textAlign: TextAlign.left,
                      speed: const Duration(milliseconds: 60),
                    ),
                  ],
                  totalRepeatCount: 2,
                  displayFullTextOnTap: true,
                  stopPauseOnTap: true,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
