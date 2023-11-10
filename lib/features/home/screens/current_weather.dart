import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:shimmer/shimmer.dart';
import 'package:weather_app/core/helpers.dart';
import 'package:weather_app/core/providers/providers.dart';
import 'package:weather_app/features/home/widgets/custom_divider.dart';
import 'package:weather_app/features/home/widgets/weather_item.dart';
import 'package:weather_app/models/forecast_response.dart';

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
    final bool isDark = colorScheme.brightness == Brightness.dark;

    final currentWeatherData = ref.watch(currentWeatherProvider);
    final forecastData = ref.watch(forecastWeatherProvider);
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: _searchController,
              decoration: InputDecoration(
                isDense: true,
                hintText: 'Search City',
                prefixIcon: Icon(
                  MdiIcons.mapMarker,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                suffixIcon: IconButton(
                  icon: Icon(MdiIcons.magnify),
                  onPressed: () {
                    FocusScope.of(context).unfocus();
                    ref.read(cityProvider.notifier).state =
                        _searchController.text;
                  },
                ),
              ),
              textInputAction: TextInputAction.search,
              onFieldSubmitted: (value) =>
                  ref.read(cityProvider.notifier).state = value,
            ),
            const SizedBox(height: 20),
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
                        gradient: LinearGradient(
                          colors: [
                            colorScheme.primary.withOpacity(0.4),
                            colorScheme.primary.withOpacity(0.1),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '${locationData.current.tempC}°C',
                                style: TextStyle(
                                  fontSize: 35,
                                  color: colorScheme.primary,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Image.network(
                                'https:${locationData.current.condition.icon}',
                                width: 60,
                                height: 60,
                              ),
                            ],
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
                    CupertinoScrollbar(
                      thickness: 8,
                      radius: const Radius.circular(8),
                      thumbVisibility: false,
                      child: Container(
                        height: 130,
                        padding: const EdgeInsets.only(bottom: 10),
                        child: ListView(
                          shrinkWrap: true,
                          primary: false,
                          scrollDirection: Axis.horizontal,
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
                            const SizedBox(width: 20),
                            buildExtraDataWidget(
                              colorScheme,
                              contextLabel: 'Cloud',
                              value: '${locationData.current.cloud} %',
                              icon: MdiIcons.cloud,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
              loading: () => _locationShimmer(isDark),
              error: (e, __) => Text('$e'),
            ),
            const SizedBox(height: 20),
            customDivider(),
            const Center(
              child: Text(
                '7 days Forecast',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            customDivider(),
            forecastData.when(
              data: (forecastData) {
                return ListView.builder(
                    shrinkWrap: true,
                    itemCount: forecastData.forecastday.length,
                    primary: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      Forecastday forecastday = forecastData.forecastday[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  DateFormat('EEEE, d')
                                      .format(forecastday.date),
                                  style: const TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                                const Spacer(),
                                Image.network(
                                  'https:${forecastday.day.condition.icon}',
                                  width: 30,
                                  height: 30,
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  forecastday.day.condition.text,
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  '${forecastday.day.avgtempC}°C',
                                ),
                                const SizedBox(width: 10),
                              ],
                            ),
                            customDivider(),
                          ],
                        ),
                      );
                    });
              },
              loading: () => _forecastShimmer(isDark),
              error: (e, __) => Text('$e'),
            ),
          ],
        ),
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
        width: 120,
        decoration: BoxDecoration(
          color: colorScheme.primaryContainer.withOpacity(0.3),
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 12,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
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

  _locationShimmer(bool isDark) {
    return SizedBox(
      child: Shimmer.fromColors(
          baseColor: (isDark)
              ? const Color(0xFF469D9A).withOpacity(0.6)
              : const Color(0xFF469D9A).withOpacity(0.4),
          highlightColor: Colors.white60,
          child: Column(
            children: [
              Container(
                height: 200,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 20,
                ),
                width: double.infinity,
                margin: const EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.grey.shade100,
                ),
              ),
              SizedBox(
                height: 120,
                child: ListView.builder(
                  itemCount: 5,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (context, i) => Container(
                    width: 100,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 9, vertical: 5),
                    margin: const EdgeInsets.only(right: 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey.shade100,
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }

  _forecastShimmer(bool isDark) {
    return SizedBox(
      child: Shimmer.fromColors(
          baseColor: (isDark)
              ? const Color(0xFF469D9A).withOpacity(0.4)
              : const Color(0xFF469D9A).withOpacity(0.1),
          highlightColor: Colors.white60,
          child: ListView.builder(
            itemCount: 4,
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemBuilder: (context, i) => Container(
              height: 80,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 5),
              margin: const EdgeInsets.only(bottom: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey.shade100,
              ),
            ),
          )),
    );
  }
}
