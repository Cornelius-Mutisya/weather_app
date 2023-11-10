import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:weather_app/core/providers/providers.dart';
import 'package:weather_app/features/home/widgets/weather_item.dart';

class ForecastView extends ConsumerStatefulWidget {
  const ForecastView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ForecastViewState();
}

class _ForecastViewState extends ConsumerState<ForecastView> {
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
            // controller: _searchController,
            decoration: InputDecoration(
              hintText: 'ForecastView',
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
          currentWeatherData.when(
            data: (locationData) {
              return Container(
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
                      label:
                          '${locationData.location.name}, ${locationData.location.country}',
                    ),
                    const SizedBox(height: 20),
                    WeatherItem(
                      icon: MdiIcons.thermometer,
                      label: '${locationData.current.tempC}°C',
                    ),
                  ],
                ),
              );
            },
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (e, __) => Text('$e'),
          ),
        ],
      ),
    );
  }
}
