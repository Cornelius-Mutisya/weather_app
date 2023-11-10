import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:weather_app/core/helpers.dart';
import 'package:weather_app/core/providers/providers.dart';
import 'package:weather_app/features/home/widgets/weather_item.dart';

class CurrentWeatherView extends ConsumerStatefulWidget {
  const CurrentWeatherView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CurrentWeatherViewState();
}

class _CurrentWeatherViewState extends ConsumerState<CurrentWeatherView> {
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
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;
    // final bool isDark = colorScheme.brightness == Brightness.dark;

    final currentWeatherData = ref.watch(currentWeatherProvider);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: _searchController,
            decoration: InputDecoration(
              hintText: 'Search City',
              prefixIcon: Icon(
                MdiIcons.magnify,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            textInputAction: TextInputAction.search,
            onFieldSubmitted: (value) =>
                ref.read(cityProvider.notifier).state = value,
          ),
          const SizedBox(height: 20),
          // Show default weather card for Nairobi
          currentWeatherData.when(
            data: (locationData) {
              return Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 20,
                    ),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: colorScheme.primaryContainer,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Text(
                              'Today',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Spacer(),
                            Text(
                              '${Helpers.formatDate(locationData.location.localtime)}',
                              style: const TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Text(
                          '${locationData.current.tempC}°C',
                          style: TextStyle(
                            fontSize: 35,
                            color: colorScheme.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            WeatherItem(
                              icon: MdiIcons.mapMarker,
                              label:
                                  '${locationData.location.name}, ${locationData.location.country}',
                            ),
                            Text(
                              locationData.current.condition.text,
                              style: const TextStyle(fontSize: 15),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      buildExtraDataWidget(
                        colorScheme,
                        contextLabel: 'Wind',
                        value: '${locationData.current.windKph} km/h',
                        icon: MdiIcons.weatherWindy,
                      ),
                      const SizedBox(width: 20),
                      buildExtraDataWidget(
                        colorScheme,
                        contextLabel: 'Humidity',
                        value: '${locationData.current.humidity} %',
                        icon: MdiIcons.waterPercent,
                      ),
                    ],
                  ),
                ],
              );
            },
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (e, __) => Text('$e'),
          ),
        ],
      ),
    );
  }

  Widget buildExtraDataWidget(
    ColorScheme colorScheme, {
    required String contextLabel,
    required String value,
    required IconData icon,
  }) =>
      Container(
        decoration: BoxDecoration(
          color: colorScheme.primaryContainer.withOpacity(0.3),
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 10,
        ),
        child: Column(
          children: [
            Icon(
              icon,
              color: colorScheme.onPrimaryContainer,
            ),
            const SizedBox(height: 10),
            Text(
              value,
              style: const TextStyle(
                fontSize: 15,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              contextLabel,
              style: const TextStyle(
                fontSize: 15,
              ),
            ),
          ],
        ),
      );
}
