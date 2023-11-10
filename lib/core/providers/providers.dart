import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/features/home/repository/home_repository.dart';
import 'package:weather_app/models/location_response.dart';

final cityProvider = StateProvider<String>((ref) {
  return 'Nairobi';
});

final currentWeatherProvider =
    FutureProvider.autoDispose<LocationResponse>((ref) async {
  final city = ref.watch(cityProvider);

  final weather =
      await ref.watch(homeRepositoryProvider).fetchCurrentWeather(city: city);
  return weather;
});
