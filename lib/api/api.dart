class WeatherAPI {
  final String apiKey;
  WeatherAPI(this.apiKey);

  static const String _baseUrl = "api.weatherapi.com";
  static const String _apiVersion = "/v1/";

  Uri currentWeather(String query) => _buildUri(
        endpoint: "current.json",
        parametersBuilder: () => queryParameters(query),
      );
  Uri forecast(String query, String days) => _buildUri(
        endpoint: "forecast.json",
        parametersBuilder: () => forecastParameters(query, days),
      );

  Uri _buildUri({
    required String endpoint,
    required Map<String, dynamic> Function() parametersBuilder,
  }) {
    return Uri(
      scheme: "https",
      host: _baseUrl,
      path: "$_apiVersion$endpoint",
      queryParameters: parametersBuilder(),
    );
  }

  Map<String, dynamic> queryParameters(String query) => {
        "q": query,
        "key": apiKey,
      };

  Map<String, dynamic> forecastParameters(String query, String days) => {
        "q": query,
        "key": apiKey,
        "days": days,
        "alerts": "yes",
      };
}
