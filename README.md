# Flutter Technical Assessment Weather App

A Flutter weather app using the [Weather API](https://www.weatherapi.com/).

## Screenshots

## Getting Started

- Clone the repository and open the project in your IDE of choice.
- Run `flutter pub get` to install the dependencies.
- Run `flutter run` to run the app in debug mode.

For further help with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Supported Features

- [x] Search by city
- [x] Current weather (temperature, condition and wind speed)
- [x] 7-day weather forecast
- [x] App theme (light, dark, and system default)

## App Architecture

The app uses features and modules to separate concerns and make the codebase more maintainable. The app is split into the following modules:

- `api`: The api module contains the apiKey data and WeatherAPI class which has the current weather and forecast API configurations.
- `core`: The core module contains the core business logic, shared widgets and utility functions, services and shared providers.
- `features`: The features module contains the app features. Each feature is split into its own folder and contains the UI, business logic and data models for that feature.
- `theme`: The theme module contains the app theme data, store, theme services and theme controller.

## Packages in use

- [http](https://pub.dev/packages/http) for REST API calls
- [flutter_riverpod](https://pub.dev/packages/flutter_riverpod) for state management
- [shared_preferences](https://pub.dev/packages/shared_preferences) for app theme persistence
- [flex_color_scheme](https://pub.dev/packages/flex_color_scheme) for app theme data
- [material_design_icons_flutter](https://pub.dev/packages/material_design_icons_flutter) for app icons
- [intl](https://pub.dev/packages/intl) for date formatting
- [shimmer](https://pub.dev/packages/shimmer) for loading animations
- [animated_text_kit](https://pub.dev/packages/animated_text_kit) for animated text in splash screen
- [rename](https://pub.dev/packages/rename) for renaming the app
- [flutter_launcher_icons](https://pub.dev/packages/flutter_launcher_icons) for app icons

**Note**: to use the API you'll need to register an account and obtain your own API key from [Weather API](https://www.weatherapi.com/). This can be set inside `lib/api/api_keys.dart`. However, for the purpose of this assessment, the API key has been provided in the code.
