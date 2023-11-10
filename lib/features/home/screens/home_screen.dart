import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'package:weather_app/core/providers/providers.dart';
import 'package:weather_app/features/home/screens/current_weather.dart';

import 'package:weather_app/theme/theme_controller.dart';

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
  late final _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _searchController.text = ref.read(cityProvider);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
      body: const CurrentWeatherView(),
    );
  }
}
