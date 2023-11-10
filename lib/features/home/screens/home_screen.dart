import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'package:weather_app/core/providers/providers.dart';
import 'package:weather_app/features/home/screens/current_weather.dart';
import 'package:weather_app/features/home/screens/forecast_view.dart';
import 'package:weather_app/features/home/widgets/tab_chips.dart';
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
  late PageController _pageController;

  final List<String> homeTabs = [
    'Current Weather',
    'Forecast',
  ];
  int activeTab = 0;
  setActiveTab(int index) {
    setState(() {
      activeTab = index;
      _pageController.animateToPage(index,
          duration: const Duration(milliseconds: 500), curve: Curves.ease);
    });
  }

  @override
  void initState() {
    super.initState();
    _searchController.text = ref.read(cityProvider);
    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;
    final bool isDark = colorScheme.brightness == Brightness.dark;

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
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: 40,
                child: ListView.builder(
                  itemCount: homeTabs.length,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  primary: true,
                  itemBuilder: (context, i) {
                    return isDark
                        ? DarkChipWidget(
                            label: homeTabs[i],
                            i: i,
                            activeTab: activeTab,
                            onSelected: (value) {
                              setActiveTab(i);
                            },
                          )
                        : LightChipWidget(
                            label: homeTabs[i],
                            i: i,
                            activeTab: activeTab,
                            onSelected: (value) {
                              setActiveTab(i);
                            },
                          );
                  },
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: PageView(
                  controller: _pageController,
                  children: const [
                    CurrentWeatherView(),
                    ForecastView(),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
