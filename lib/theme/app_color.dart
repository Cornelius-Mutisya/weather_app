import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import 'theme_controller.dart';

class AppColor {
  AppColor._();

  static const FlexSchemeColor _myScheme1Light = FlexSchemeColor(
    primary: Color(0xFF469D9A),
    primaryContainer: Color(0xFFA0C2ED),
    secondary: Color(0xFF18181B),
    secondaryContainer: Color(0xFFFFD270),
    tertiary: Color(0xFF2563EB),
    tertiaryContainer: Color(0xFFEFF6FF),
    appBarColor: Color(0xFF469D9A),
    swapOnMaterial3: true,
  );

  static const FlexSchemeColor _myScheme1Dark = FlexSchemeColor(
    primary: Color(0xFF469D9A),
    primaryContainer: Color(0xFF3873BA),
    secondary: Color(0xFF18181B),
    secondaryContainer: Color(0xFFD26900),
    tertiary: Color(0xFFC9CBFC),
    tertiaryContainer: Color(0xFF535393),
    appBarColor: Color(0xFF469D9A),
    swapOnMaterial3: true,
  );

  static final FlexSchemeColor _myScheme2Light = FlexSchemeColor.from(
    primary: const Color(0xFF469D9A),
    brightness: Brightness.light,
  );
  static final FlexSchemeColor _myScheme2Dark = FlexSchemeColor.from(
    primary: const Color(0xFF469D9A),
    brightness: Brightness.dark,
  );

  static final FlexSchemeColor _myScheme3Light = FlexSchemeColor.from(
    primary: const Color(0xFF469D9A),
    secondary: const Color(0xFF18181B),
    brightness: Brightness.light,
    swapOnMaterial3: true,
  );

  static const Color customPrimaryLight = Color(0xFF469D9A);
  static const Color customPrimaryContainerLight = Color(0xFFD0E4FF);
  static const Color customSecondaryLight = Color(0xFF18181B);
  static const Color customSecondaryContainerLight = Color(0xFFFFDBCF);
  static const Color customTertiaryLight = Color(0xFF006875);
  static const Color customTertiaryContainerLight = Color(0xFF95F0FF);

  static const Color customPrimaryDark = Color(0xFF469D9A);
  static const Color customPrimaryContainerDark = Color(0xFF00325B);
  static const Color customSecondaryDark = Color(0xFFFFB59D);
  static const Color customSecondaryContainerDark = Color(0xFF872100);
  static const Color customTertiaryDark = Color(0xFF86D2E1);
  static const Color customTertiaryContainerDark = Color(0xFF004E59);

  static final List<FlexSchemeData> customSchemes = <FlexSchemeData>[
    const FlexSchemeData(
      name: 'Custom Midnight',
      description: 'Midnight blue theme, created by using custom color values '
          'for all colors in the scheme',
      light: _myScheme1Light,
      dark: _myScheme1Dark,
    ),
    FlexSchemeData(
      name: 'Custom Greens',
      description: 'Vivid green theme, created from one primary color in light '
          'mode and another primary for dark mode',
      light: _myScheme2Light,
      dark: _myScheme2Dark,
    ),
    FlexSchemeData(
      name: 'Custom Red & Blue',
      description: 'Classic red and blue, created from only light theme mode '
          'primary and secondary colors',
      light: _myScheme3Light,

      //

      dark: _myScheme3Light.defaultError.toDark(30, true),
    ),
    ...FlexColor.schemesList,
  ];

  static final List<FlexSchemeData> schemes = <FlexSchemeData>[
    ...customSchemes,
    FlexColor.customColors.copyWith(name: 'Customizable'),
  ];

  static FlexSchemeData scheme(final ThemeController controller) =>
      schemeAtIndex(controller.schemeIndex, controller);

  static FlexSchemeData schemeAtIndex(
      final int index, final ThemeController controller) {
    if (index == schemes.length - 1) {
      return controller.customScheme.copyWith(
          dark: controller.useKeyColors
              ? controller.useDarkColorsForSeed &&
                      (index == 0 ||
                          index == 1 ||
                          index == 2 ||
                          index == AppColor.schemes.length - 1)
                  ? controller.customScheme.dark
                  : controller.customScheme.light
              : controller.useToDarkMethod
                  ? controller.customScheme.light.defaultError.toDark(
                      controller.darkMethodLevel,
                      controller.toDarkSwapPrimaryAndContainer)
                  : null);
    }
    return schemes[index].copyWith(
        dark: controller.useKeyColors
            ? controller.useDarkColorsForSeed &&
                    (index == 0 ||
                        index == 1 ||
                        index == 2 ||
                        index == AppColor.schemes.length - 1)
                ? schemes[index].dark
                : schemes[index].light
            : controller.useToDarkMethod
                ? schemes[index].light.defaultError.toDark(
                    controller.darkMethodLevel,
                    controller.toDarkSwapPrimaryAndContainer)
                : null);
  }

  static String explainUsedColors(ThemeController controller) {
    if (!controller.useKeyColors) {
      return 'Material 3 ColorScheme seeding from key colors is OFF and not '
          'used. The effective ColorScheme is based directly on the selected '
          "pre-defined FlexColorScheme's colors";
    }
    if (!controller.useSecondary && !controller.useTertiary) {
      return 'Light scheme defined Primary color is used to generate '
          'the Colorscheme. '
          "This is like using Flutter's ColorScheme.fromSeed with the scheme "
          'defined Primary color as seed color';
    }
    if (controller.useSecondary && !controller.useTertiary) {
      return 'Tonal palettes for the ColorScheme are made with light scheme '
          'defined Primary and Secondary colors as seed keys. Tertiary key '
          'is computed from Primary color';
    }
    if (!controller.useSecondary && controller.useTertiary) {
      return 'Tonal palettes for the ColorScheme, are made with light scheme '
          'defined Primary and Tertiary colors as seed keys, Secondary key is '
          'computed from Primary color';
    }
    return 'Light scheme defined Primary, Secondary and Tertiary colors are '
        'used as keys to generate tonal palettes that define the ColorScheme';
  }
}
