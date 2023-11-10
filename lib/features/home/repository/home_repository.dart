import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/api/api.dart';

import 'package:http/http.dart' as http;
import 'package:weather_app/api/api_exceptions.dart';
import 'package:weather_app/api/api_keys.dart';
import 'package:weather_app/models/forecast_response.dart';
import 'package:weather_app/models/location_response.dart';

final homeRepositoryProvider = Provider((ref) {
  return HomeRepository(
    api: WeatherAPI(WeatherAPIKey.apiKey),
    client: http.Client(),
  );
});

class HomeRepository {
  HomeRepository({
    required this.api,
    required this.client,
  });
  final WeatherAPI api;
  final http.Client client;

  Future<LocationResponse> fetchCurrentWeather({required String city}) =>
      _getData(
        uri: api.currentWeather(city),
        builder: (data) => locationResponseFromJson(data),
      );
  Future<ForecastResponse> forecastWeather(
          {required String city, required String days}) =>
      _getData(
        uri: api.forecast(city, days),
        builder: (data) => forecastFromJson(data),
      );

  Future<T> _getData<T>({
    required Uri uri,
    required T Function(dynamic data) builder,
  }) async {
    try {
      final response = await client.get(uri);
      switch (response.statusCode) {
        case 200:
          final data = response.body;
          return builder(data);
        case 400:
          throw NoQueryException().getErrorMessage();
        case 401:
          throw InvalidApiKeyException().getErrorMessage();
        case 404:
          throw CityNotFoundException().getErrorMessage();
        default:
          throw UnknownException().getErrorMessage();
      }
    } on SocketException catch (_) {
      throw NoInternetConnectionException().getErrorMessage();
    }
  }
}
