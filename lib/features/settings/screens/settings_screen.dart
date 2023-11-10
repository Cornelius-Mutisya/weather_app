import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/features/settings/widgets/custom_checkbox.dart';
import 'package:weather_app/theme/theme_controller.dart';

class SettingsScreen extends ConsumerStatefulWidget {
  const SettingsScreen({
    required this.flexSchemeData,
    required this.themeController,
    super.key,
  });
  final FlexSchemeData flexSchemeData;
  final ThemeController themeController;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends ConsumerState<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Set Theme",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 26),
            CustomCheckbox(
              value: widget.themeController.themeMode == ThemeMode.dark,
              label: "Dark",
              onChanged: (value) {
                widget.themeController.setThemeMode(ThemeMode.dark);
                setState(() {});
              },
            ),
            const SizedBox(height: 20),
            CustomCheckbox(
              value: widget.themeController.themeMode == ThemeMode.light,
              label: "Light",
              onChanged: (value) {
                widget.themeController.setThemeMode(ThemeMode.light);
                setState(() {});
              },
            ),
            const SizedBox(height: 20),
            CustomCheckbox(
              value: widget.themeController.themeMode == ThemeMode.system,
              label: "System",
              onChanged: (value) {
                widget.themeController.setThemeMode(ThemeMode.system);
                setState(() {});
              },
            ),
          ],
        ),
      ),
    );
  }
}
