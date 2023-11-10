import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/core/same_types.dart';

import 'theme_service.dart';

const bool _debug = !kReleaseMode && true;

class ThemeServicePrefs implements ThemeService {
  late final SharedPreferences _prefs;

  @override
  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  @override
  Future<T> load<T>(String key, T defaultValue) async {
    try {
      if (_debug) {
        debugPrint('SharedPrefs has type .......... : $key '
            'as ${defaultValue.runtimeType}');
      }

      if (sameTypes<T, bool?>()) {
        final bool? value = _prefs.getBool(key);
        if (_debug) {
          debugPrint('SharedPrefs loaded type bool?   : $key as $value');
        }

        if (value == null) return defaultValue;

        return value as T;
      }

      if (sameTypes<T, bool>()) {
        final bool value = _prefs.getBool(key) ?? defaultValue as bool;
        if (_debug) {
          debugPrint('SharedPrefs loaded type bool    : $key as $value');
        }
        return value as T;
      }

      if (sameTypes<T, int?>()) {
        final int? value = _prefs.getInt(key);
        if (_debug) {
          debugPrint('SharedPrefs loaded type int?    : $key as $value');
        }

        if (value == null) return defaultValue;

        if (value < 0) return null as T;

        return value as T;
      }

      if (sameTypes<T, int>()) {
        final int value = _prefs.getInt(key) ?? defaultValue as int;
        if (_debug) {
          debugPrint('SharedPrefs loaded type int     : $key as $value');
        }

        return value as T;
      }

      if (sameTypes<T, double?>()) {
        final double? value = _prefs.getDouble(key) ?? defaultValue as double?;
        if (_debug) {
          debugPrint('SharedPrefs loaded type double? : $key as $value');
        }
        if (value == null) return defaultValue;
        if (value < 0.0) return null as T;
        return value as T;
      }

      if (sameTypes<T, double>()) {
        final double value = _prefs.getDouble(key) ?? defaultValue as double;
        if (_debug) {
          debugPrint('SharedPrefs loaded type double  : $key as $value');
        }
        return value as T;
      }

      if (sameTypes<T, String?>()) {
        final String? value = _prefs.getString(key) ?? defaultValue as String?;
        if (_debug) {
          debugPrint('SharedPrefs loaded type String? : $key as $value');
        }
        if (value == null) return defaultValue;
        if (value == '<NULL>') return null as T;
        return value as T;
      }

      if (sameTypes<T, String>()) {
        final String value = _prefs.getString(key) ?? defaultValue as String;
        if (_debug) {
          debugPrint('SharedPrefs loaded type String  : $key as $value');
        }
        return value as T;
      }

      if (sameTypes<T, Color?>()) {
        final int? value = _prefs.getInt(key);
        if (_debug) {
          debugPrint('SharedPrefs loaded Color?       : $key as $value');
        }

        if (value == null) return defaultValue;

        if (value < 0x00000000) return null as T;

        if (value > 0xFFFFFFFF) return defaultValue;

        return Color(value) as T;
      }

      if (sameTypes<T, Color>()) {
        final int? value = _prefs.getInt(key);
        if (_debug) {
          debugPrint('SharedPrefs loaded Color        : $key as $value');
        }

        if (value == null) return defaultValue;

        if (value < 0x00000000) return null as T;

        if (value > 0xFFFFFFFF) return defaultValue;

        return Color(value) as T;
      }

      if (sameTypes<T, ThemeMode?>()) {
        final int? value = _prefs.getInt(key);
        if (_debug) {
          debugPrint('SharedPrefs loaded ThemeMode?   : $key as $value');
        }

        if (value == null) return defaultValue;

        if (value < 0) return null as T;

        if (value >= ThemeMode.values.length) return defaultValue;

        return ThemeMode.values[value] as T;
      }

      if (sameTypes<T, ThemeMode>()) {
        final int? value = _prefs.getInt(key);
        if (_debug) {
          debugPrint('SharedPrefs loaded ThemeMode    : $key as $value');
        }

        if (value == null) return defaultValue;

        if (value < 0) return defaultValue;

        if (value >= ThemeMode.values.length) return defaultValue;

        return ThemeMode.values[value] as T;
      }

      if (sameTypes<T, FlexScheme?>()) {
        final int? value = _prefs.getInt(key);
        if (_debug) {
          debugPrint('SharedPrefs loaded FlexScheme?  : $key as $value');
        }
        if (value == null) return defaultValue;
        if (value < 0) return null as T;
        if (value >= FlexScheme.values.length) return defaultValue;
        return FlexScheme.values[value] as T;
      }

      if (sameTypes<T, FlexScheme>()) {
        final int? value = _prefs.getInt(key);
        if (_debug) {
          debugPrint('SharedPrefs loaded FlexScheme   : $key as $value');
        }
        if (value == null) return defaultValue;
        if (value < 0) return defaultValue;
        if (value >= FlexScheme.values.length) return defaultValue;
        return FlexScheme.values[value] as T;
      }

      if (sameTypes<T, FlexSurfaceMode?>()) {
        final int? value = _prefs.getInt(key);
        if (_debug) {
          debugPrint('SharedPrefs loaded FlexSurfaceMode? : $key as $value');
        }
        if (value == null) return defaultValue;
        if (value < 0) return null as T;
        if (value >= FlexSurfaceMode.values.length) return defaultValue;
        return FlexSurfaceMode.values[value] as T;
      }

      if (sameTypes<T, FlexSurfaceMode>()) {
        final int? value = _prefs.getInt(key);
        if (_debug) {
          debugPrint('SharedPrefs loaded FlexSurfaceMode  : $key as $value');
        }
        if (value == null) return defaultValue;
        if (value < 0) return defaultValue;
        if (value >= FlexSurfaceMode.values.length) return defaultValue;
        return FlexSurfaceMode.values[value] as T;
      }

      if (sameTypes<T, FlexInputBorderType?>()) {
        final int? value = _prefs.getInt(key);
        if (_debug) {
          debugPrint(
              'SharedPrefs loaded FlexInputBorderType? : $key as $value');
        }
        if (value == null) return defaultValue;
        if (value < 0) return null as T;
        if (value >= FlexInputBorderType.values.length) return defaultValue;
        return FlexInputBorderType.values[value] as T;
      }

      if (sameTypes<T, FlexInputBorderType>()) {
        final int? value = _prefs.getInt(key);
        if (_debug) {
          debugPrint(
              'SharedPrefs loaded FlexInputBorderType  : $key as $value');
        }
        if (value == null) return defaultValue;
        if (value < 0) return defaultValue;
        if (value >= FlexInputBorderType.values.length) return defaultValue;
        return FlexInputBorderType.values[value] as T;
      }

      if (sameTypes<T, FlexAppBarStyle?>()) {
        final int? value = _prefs.getInt(key);
        if (_debug) {
          debugPrint('SharedPrefs loaded FlexAppBarStyle? : $key as $value');
        }
        if (value == null) return defaultValue;
        if (value < 0) return null as T;
        if (value >= FlexAppBarStyle.values.length) return defaultValue;
        return FlexAppBarStyle.values[value] as T;
      }

      if (sameTypes<T, FlexAppBarStyle>()) {
        final int? value = _prefs.getInt(key);
        if (_debug) {
          debugPrint('SharedPrefs loaded FlexAppBarStyle  : $key as $value');
        }
        if (value == null) return defaultValue;
        if (value < 0) return defaultValue;
        if (value >= FlexAppBarStyle.values.length) return defaultValue;
        return FlexAppBarStyle.values[value] as T;
      }

      if (sameTypes<T, FlexTabBarStyle?>()) {
        final int? value = _prefs.getInt(key);
        if (_debug) {
          debugPrint('SharedPrefs loaded FlexTabBarStyle? : $key as $value');
        }
        if (value == null) return defaultValue;
        if (value < 0) return null as T;
        if (value >= FlexTabBarStyle.values.length) return defaultValue;
        return FlexTabBarStyle.values[value] as T;
      }

      if (sameTypes<T, FlexTabBarStyle>()) {
        final int? value = _prefs.getInt(key);
        if (_debug) {
          debugPrint('SharedPrefs loaded FlexTabBarStyle  : $key as $value');
        }
        if (value == null) return defaultValue;
        if (value < 0) return defaultValue;
        if (value >= FlexTabBarStyle.values.length) return defaultValue;
        return FlexTabBarStyle.values[value] as T;
      }

      if (sameTypes<T, FlexSystemNavBarStyle?>()) {
        final int? value = _prefs.getInt(key);
        if (_debug) {
          debugPrint(
              'SharedPrefs loaded FlexSystemNavBarStyle? : $key as $value');
        }
        if (value == null) return defaultValue;
        if (value < 0) return null as T;
        if (value >= FlexSystemNavBarStyle.values.length) return defaultValue;
        return FlexSystemNavBarStyle.values[value] as T;
      }

      if (sameTypes<T, FlexSystemNavBarStyle>()) {
        final int? value = _prefs.getInt(key);
        if (_debug) {
          debugPrint(
              'SharedPrefs loaded FlexSystemNavBarStyle  : $key as $value');
        }
        if (value == null) return defaultValue;
        if (value < 0) return defaultValue;
        if (value >= FlexSystemNavBarStyle.values.length) return defaultValue;
        return FlexSystemNavBarStyle.values[value] as T;
      }

      if (sameTypes<T, SchemeColor?>()) {
        final int? value = _prefs.getInt(key);
        if (_debug) {
          debugPrint('SharedPrefs loaded SchemeColor? : $key as $value');
        }
        if (value == null) return defaultValue;
        if (value < 0) return null as T;
        if (value >= SchemeColor.values.length) return defaultValue;
        return SchemeColor.values[value] as T;
      }

      if (sameTypes<T, SchemeColor>()) {
        final int? value = _prefs.getInt(key);
        if (_debug) {
          debugPrint('SharedPrefs loaded SchemeColor  : $key as $value');
        }
        if (value == null) return defaultValue;
        if (value < 0) return defaultValue;
        if (value >= SchemeColor.values.length) return defaultValue;
        return SchemeColor.values[value] as T;
      }

      if (sameTypes<T, NavigationDestinationLabelBehavior?>()) {
        final int? value = _prefs.getInt(key);
        if (_debug) {
          debugPrint('SharedPrefs loaded NavigationDestinationLabelBehavior? '
              ': $key as $value');
        }
        if (value == null) return defaultValue;
        if (value < 0) return null as T;
        if (value >= NavigationDestinationLabelBehavior.values.length) {
          return defaultValue;
        }
        return NavigationDestinationLabelBehavior.values[value] as T;
      }

      if (sameTypes<T, NavigationDestinationLabelBehavior>()) {
        final int? value = _prefs.getInt(key);
        if (_debug) {
          debugPrint('SharedPrefs loaded NavigationDestinationLabelBehavior '
              ': $key as $value');
        }
        if (value == null) return defaultValue;
        if (value < 0) return defaultValue;
        if (value >= NavigationDestinationLabelBehavior.values.length) {
          return defaultValue;
        }
        return NavigationDestinationLabelBehavior.values[value] as T;
      }

      if (sameTypes<T, NavigationRailLabelType?>()) {
        final int? value = _prefs.getInt(key);
        if (_debug) {
          debugPrint(
              'SharedPrefs loaded NavigationRailLabelType?: $key as $value');
        }
        if (value == null) return defaultValue;
        if (value < 0) return null as T;
        if (value >= NavigationRailLabelType.values.length) return defaultValue;
        return NavigationRailLabelType.values[value] as T;
      }

      if (sameTypes<T, NavigationRailLabelType>()) {
        final int? value = _prefs.getInt(key);
        if (_debug) {
          debugPrint(
              'SharedPrefs loaded NavigationRailLabelType : $key as $value');
        }
        if (value == null) return defaultValue;
        if (value < 0) return defaultValue;
        if (value >= NavigationRailLabelType.values.length) return defaultValue;
        return NavigationRailLabelType.values[value] as T;
      }
    } catch (e) {
      debugPrint('SharedPrefs load ERROR');
      debugPrint(' Error message ...... : $e');
      debugPrint(' Store key .......... : $key');
      debugPrint(' defaultValue ....... : $defaultValue');

      return defaultValue;
    }

    return defaultValue;
  }

  //

  //

  //

  @override
  Future<void> save<T>(String key, T value) async {
    try {
      if (sameTypes<T, bool?>()) {
        if (value == null) {
          await _prefs.setBool(key, false);
          if (_debug) {
            debugPrint('SharedPrefs saved type bool?    : $key NULL as $value');
          }
          return;
        } else {
          await _prefs.setBool(key, value as bool);
          if (_debug) {
            debugPrint('SharedPrefs saved type bool?    : $key as $value');
          }
          return;
        }
      }

      if (sameTypes<T, bool>()) {
        await _prefs.setBool(key, value as bool);
        if (_debug) {
          debugPrint('SharedPrefs saved type bool     : $key as $value');
        }
        return;
      }

      if (sameTypes<T, int?>()) {
        if (value == null) {
          await _prefs.setInt(key, -1);
          if (_debug) {
            debugPrint('SharedPrefs saved type int?     : $key NULL as -1');
          }
          return;
        } else {
          await _prefs.setInt(key, value as int);
          if (_debug) {
            debugPrint('SharedPrefs saved type int?     : $key as $value');
          }
          return;
        }
      }

      if (sameTypes<T, int>()) {
        await _prefs.setInt(key, value as int);
        if (_debug) {
          debugPrint('SharedPrefs saved type int      : $key as $value');
        }
        return;
      }

      if (sameTypes<T, double?>()) {
        if (value == null) {
          await _prefs.setDouble(key, -1.0);
          if (_debug) {
            debugPrint('SharedPrefs saved type double?  : $key NULL as -1.0');
          }
          return;
        } else {
          await _prefs.setDouble(key, value as double);
          if (_debug) {
            debugPrint('SharedPrefs saved type double?  : $key as $value');
          }
          return;
        }
      }

      if (sameTypes<T, double>()) {
        await _prefs.setDouble(key, value as double);
        if (_debug) {
          debugPrint('SharedPrefs saved type double   : $key as $value');
        }
        return;
      }

      if (sameTypes<T, String?>()) {
        if (value == null) {
          await _prefs.setString(key, '<NULL>');
          if (_debug) {
            debugPrint('SharedPrefs saved type String?  : $key NULL as <NULL>');
          }
          return;
        } else {
          await _prefs.setString(key, value as String);
          if (_debug) {
            debugPrint('SharedPrefs saved type String?  : $key as $value');
          }
          return;
        }
      }

      if (sameTypes<T, String>()) {
        await _prefs.setString(key, value as String);
        if (_debug) {
          debugPrint('SharedPrefs saved type String   : $key as $value');
        }
        return;
      }

      if (sameTypes<T, Color?>()) {
        if (value == null) {
          await _prefs.setInt(key, -1);
          if (_debug) {
            debugPrint('SharedPrefs saved type Color?   : $key NULL as -1');
          }
          return;
        } else {
          await _prefs.setInt(key, (value as Color).value);
          if (_debug) {
            debugPrint(
                'SharedPrefs saved type Color?   : $key as ${value.value}');
          }
          return;
        }
      }

      if (sameTypes<T, Color>()) {
        await _prefs.setInt(key, (value as Color).value);
        if (_debug) {
          debugPrint(
              'SharedPrefs saved type Color    : $key as ${value.value}');
        }
        return;
      }

      if (value is Enum) {
        await _prefs.setInt(key, value.index);
        if (_debug) {
          debugPrint(
              'SharedPrefs saved type Enum     : $key as ${value.index}');
        }
        return;
      }

      if (value is Enum?) {
        if (value == null) {
          await _prefs.setInt(key, -1);
          if (_debug) {
            debugPrint('SharedPrefs saved type Enum?    : $key NULL as -1');
          }
          return;
        } else {
          await _prefs.setInt(key, value.index);
          if (_debug) {
            debugPrint(
                'SharedPrefs saved type Enum?    : $key as ${value.index}');
          }
          return;
        }
      }
    } catch (e) {
      debugPrint('SharedPrefs save ERROR');
      debugPrint(' Error message ...... : $e');
      debugPrint(' Store key .......... : $key');
      debugPrint(' Save value ......... : $value');
    }
  }
}
