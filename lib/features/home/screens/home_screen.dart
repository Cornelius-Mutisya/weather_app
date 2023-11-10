import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:weather_app/theme/theme_controller.dart';

import '../widgets/weather_item.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({
    required this.flexSchemeData,
    required this.themeController,
    super.key,
  });
  final FlexSchemeData flexSchemeData;
  final ThemeController themeController;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;
    // final bool isDark = colorScheme.brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(
              MdiIcons.cogOutline,
            ),
            onPressed: () {
              Navigator.of(context).pushNamed('/settings');
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Search City',
                  prefixIcon: Icon(
                    MdiIcons.magnify,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Show default weather card for Nairobi
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 20,
                ),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: colorScheme.primaryContainer,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    WeatherItem(
                      icon: MdiIcons.mapMarker,
                      label: 'Nairobi, Kenya',
                    ),
                    const SizedBox(height: 20),
                    WeatherItem(
                      icon: MdiIcons.thermometer,
                      label: '25°C',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
