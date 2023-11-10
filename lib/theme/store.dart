import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/theme/app_color.dart';

class Store {
  Store._();

  static const String keyThemeMode = 'themeMode';

  static const ThemeMode defaultThemeMode = ThemeMode.system;

  static const String keyUseFlexColorScheme = 'useFlexColorScheme';

  static const bool defaultUseFlexColorScheme = true;

  static const String keyUseSubThemes = 'useSubThemes';

  static const bool defaultUseSubThemes = true;

  static const String keyUseFlutterDefaults = 'useFlutterDefaults';

  static const bool defaultUseFlutterDefaults = false;

  static const String keyIsLargeGridView = 'isLargeGridView';

  static const bool defaultIsLargeGridView = false;

  static const String keyViewIndex = 'viewIndex';

  static const int defaultViewIndex = 0;

  static const String keyUseTextTheme = 'useTextTheme';

  static const bool defaultUseTextTheme = true;

  static const String keyUseAppFont = 'useAppFont';

  static const bool defaultUseAppFont = true;

  static const String keyUsedScheme = 'usedScheme';

  static const FlexScheme defaultUsedScheme = FlexScheme.hippieBlue;

  static const String keySchemeIndex = 'schemeIndex';

  static const int defaultSchemeIndex = 39;

  static const String keyInteractionEffects = 'interactionEffects';

  static const bool defaultInteractionEffects = true;

  static const String keyDefaultRadius = 'defaultRadius';

  static const double? defaultDefaultRadius = null;

  static const String keyThinBorderWidth = 'thinBorderWidth';

  static const double? defaultThinBorderWidth = null;

  static const String keyThickBorderWidth = 'thickBorderWidth';

  static const double? defaultThickBorderWidth = null;

  static const String keyTooltipsMatchBackground = 'tooltipsMatchBackground';

  static const bool defaultTooltipsMatchBackground = false;

  static const String keySurfaceModeLight = 'surfaceModeLight';

  static const FlexSurfaceMode defaultSurfaceModeLight =
      FlexSurfaceMode.levelSurfacesLowScaffold;

  static const String keySurfaceModeDark = 'surfaceModeDark';

  static const FlexSurfaceMode defaultSurfaceModeDark =
      FlexSurfaceMode.levelSurfacesLowScaffold;

  static const String keyBlendLevel = 'blendLevel';

  static const int defaultBlendLevel = 9;

  static const String keyBlendLevelDark = 'blendLevelDark';

  static const int defaultBlendLevelDark = 15;

  static const String keyOnBlendLevel = 'blendOnLevel';

  static const int defaultBlendOnLevel = 10;

  static const String keyBlendOnLevelDark = 'blendOnLevelDark';

  static const int defaultBlendOnLevelDark = 20;

  static const String keyUsedColors = 'usedColors';

  static const int defaultUsedColors = 6;

  static const String keySwapLegacyColors = 'swapLegacyColors';

  static const bool defaultSwapLegacyColors = true;

  static const String keySwapLightColors = 'swapLightColors';

  static const bool defaultSwapLightColors = false;

  static const String keySwapDarkColors = 'swapDarkColors';

  static const bool defaultSwapDarkColors = false;

  static const String keyLightIsWhite = 'lightIsWhite';

  static const bool defaultLightIsWhite = false;

  static const String keyDarkIsTrueBlack = 'darkIsTrueBlack';

  static const bool defaultDarkIsTrueBlack = false;

  static const String keyUseDarkColorsForSeed = 'useDarkColorsForSeed';

  static const bool defaultUseDarkColorsForSeed = false;

  static const String keyUseToDarkMethod = 'useToDarkMethod';

  static const bool defaultUseToDarkMethod = false;

  static const String keyToDarkSwapPrimaryAndContainer =
      'toDarkSwapPrimaryAndContainer';

  static const bool defaultToDarkSwapPrimaryAndContainer = true;

  static const String keyDarkMethodLevel = 'darkMethodLevel';

  static const int defaultDarkMethodLevel = 10;

  static const String keyBlendLightOnColors = 'blendLightOnColors';

  static const bool defaultBlendLightOnColors = false;

  static const String keyBlendDarkOnColors = 'blendDarkOnColors';

  static const bool defaultBlendDarkOnColors = true;

  static const String keyBlendLightTextTheme = 'blendLightTextTheme';

  static const bool defaultBlendLightTextTheme = true;

  static const String keyBlendDarkTextTheme = 'blendDarkTextTheme';

  static const bool defaultBlendDarkTextTheme = true;

  static const String keyUseMaterial3 = 'useMaterial3';

  static const bool defaultUseMaterial3 = false;

  static const String keyUseKeyColors = 'useKeyColors';

  static const bool defaultUseKeyColors = false;

  static const String keyUseSecondary = 'useSecondary';

  static const bool defaultUseSecondary = false;

  static const String keyUseTertiary = 'useTertiary';

  static const bool defaultUseTertiary = false;

  static const String keyKeepPrimary = 'keepPrimary';

  static const bool defaultKeepPrimary = false;

  static const String keyKeepSecondary = 'keepSecondary';

  static const bool defaultKeepSecondary = false;

  static const String keyKeepTertiary = 'keepTertiary';

  static const bool defaultKeepTertiary = false;

  static const String keyKeepPrimaryContainer = 'keepPrimaryContainer';

  static const bool defaultKeepPrimaryContainer = false;

  static const String keyKeepSecondaryContainer = 'keepSecondaryContainer';

  static const bool defaultKeepSecondaryContainer = false;

  static const String keyKeepTertiaryContainer = 'keepTertiaryContainer';

  static const bool defaultKeepTertiaryContainer = false;

  static const String keyKeepDarkPrimary = 'keepDarkPrimary';

  static const bool defaultKeepDarkPrimary = false;

  static const String keyKeepDarkSecondary = 'keepDarkSecondary';

  static const bool defaultKeepDarkSecondary = false;

  static const String keyKeepDarkTertiary = 'keepDarkTertiary';

  static const bool defaultKeepDarkTertiary = false;

  static const String keyKeepDarkPrimaryContainer = 'keepDarkPrimaryContainer';

  static const bool defaultKeepDarkPrimaryContainer = false;

  static const String keyKeepDarkSecondaryContainer =
      'keepDarkSecondaryContainer';

  static const bool defaultKeepDarkSecondaryContainer = false;

  static const String keyKeepDarkTertiaryContainer =
      'keepDarkTertiaryContainer';

  static const bool defaultKeepDarkTertiaryContainer = false;

  static const String keyUsedFlexToneSetup = 'usedFlexToneSetup';

  static const int defaultUsedFlexToneSetup = 1;

  static const String keyUseM3ErrorColors = 'useM3ErrorColors';

  static const bool defaultUseM3ErrorColors = false;

  static const String keyOnMainsUseBWLight = 'onMainsUseBWLight';

  static const bool defaultOnMainsUseBWLight = false;

  static const String keyOnMainsUseBWDark = 'onMainsUseBWDark';

  static const bool defaultOnMainsUseBWDark = false;

  static const String keyOnSurfacesUseBWLight = 'onSurfacesUseBWLight';

  static const bool defaultOnSurfacesUseBWLight = false;

  static const String keyOnSurfacesUseBWDark = 'onSurfacesUseBWDark';

  static const bool defaultOnSurfacesUseBWDark = false;

  static const String keyInputDecoratorSchemeColorLight =
      'inputDecoratorSchemeColorLight';

  static const SchemeColor? defaultInputDecoratorSchemeColorLight = null;

  static const String keyInputDecoratorSchemeColorDark =
      'inputDecoratorSchemeColorDark';

  static const SchemeColor? defaultInputDecoratorSchemeColorDark = null;

  static const String keyInputDecoratorIsFilled = 'inputDecoratorIsFilled';

  static const bool defaultInputDecoratorIsFilled = true;

  static const String keyInputDecoratorBorderType = 'inputDecoratorBorderType';

  static const FlexInputBorderType defaultInputDecoratorBorderType =
      FlexInputBorderType.outline;

  static const String keyInputDecoratorBorderRadius =
      'inputDecoratorBorderRadius';

  static const double? defaultInputDecoratorBorderRadius = null;

  static const String keyInputDecoratorUnfocusedHasBorder =
      'inputDecoratorUnfocusedHasBorder';

  static const bool defaultInputDecoratorUnfocusedHasBorder = true;

  static const String keyInputDecoratorUnfocusedBorderIsColored =
      'inputDecoratorUnfocusedBorderIsColored';

  static const bool defaultInputDecoratorUnfocusedBorderIsColored = true;

  static const String keyInputDecoratorBorderWidth =
      'inputDecoratorBorderWidth';

  static const double? defaultInputDecoratorBorderWidth = null;

  static const String keyInputDecoratorFocusedBorderWidth =
      'inputDecoratorFocusedBorderWidth';

  static const double? defaultInputDecoratorFocusedBorderWidth = null;

  static const String keyAppBarStyleLight = 'lightAppBarStyle';

  static const FlexAppBarStyle? defaultAppBarStyleLight = null;

  static const String keyAppBarStyleDark = 'darkAppBarStyle';

  static const FlexAppBarStyle? defaultAppBarStyleDark = null;

  static const String keyAppBarOpacityLight = 'appBarOpacity';

  static const double defaultAppBarOpacityLight = 1.0;

  static const String keyAppBarOpacityDark = 'appBarOpacityDark';

  static const double defaultAppBarOpacityDark = 1.0;

  static const String keyAppBarElevationLight = 'appBarElevation';

  static const double defaultAppBarElevationLight = 0.0;

  static const String keyAppBarElevationDark = 'appBarElevationDark';

  static const double defaultAppBarElevationDark = 0.0;

  static const String keyTransparentStatusBar = 'transparentStatusBar';

  static const bool defaultTransparentStatusBar = true;

  static const String keyAppBarBackgroundSchemeColorLight =
      'appBarBackgroundSchemeColor';

  static const SchemeColor? defaultAppBarBackgroundSchemeColorLight = null;

  static const String keyAppBarBackgroundSchemeColorDark =
      'appBarBackgroundSchemeColorDark';

  static const SchemeColor? defaultAppBarBackgroundSchemeColorDark = null;

  static const String keyTabBarStyle = 'tabBarStyle';

  static const FlexTabBarStyle defaultTabBarStyle = FlexTabBarStyle.forAppBar;

  static const String keyTabBarIndicatorLight = 'tabBarIndicatorLight';

  static const SchemeColor? defaultTabBarIndicatorLight = null;

  static const String keyTabBarIndicatorDark = 'tabBarIndicatorDark';

  static const SchemeColor? defaultTabBarIndicatorDark = null;

  static const String keyTabBarItemSchemeColorLight =
      'tabBarItemSchemeColorLight';

  static const SchemeColor? defaultTabBarItemSchemeColorLight = null;

  static const String keyTabBarItemSchemeColorDark =
      'tabBarItemSchemeColorDark';

  static const SchemeColor? defaultTabBarItemSchemeColorDark = null;

  static const String keyBottomSheetSchemeColor = 'bottomSheetSchemeColor';

  static const SchemeColor? defaultBottomSheetSchemeColor = null;

  static const String keyBottomSheetElevation = 'bottomSheetElevation';

  static const double? defaultBottomSheetElevation = null;

  static const String keyBottomSheetBorderRadius = 'bottomSheetBorderRadius';

  static const double? defaultBottomSheetBorderRadius = null;

  static const String keySysNavBarStyle = 'sysNavBarStyle';

  static const FlexSystemNavBarStyle defaultSysNavBarStyle =
      FlexSystemNavBarStyle.background;

  static const String keySysNavBarOpacity = 'sysSysNavBarOpacity';

  static const double defaultSysBarOpacity = 1.0;

  static const String keyUseSysNavDivider = 'useSysNavDivider';

  static const bool defaultUseSysNavDivider = false;

  static const String keyBottomNavBarBackgroundSchemeColor =
      'bottomNavBarBackgroundSchemeColor';

  static const SchemeColor? defaultBottomNavBarBackgroundSchemeColor = null;

  static const String keyBottomNavigationBarOpacity =
      'bottomNavigationBarOpacity';

  static const double defaultBottomNavigationBarOpacity = 1.0;

  static const String keyBottomNavigationBarElevation =
      'bottomNavigationBarElevation';

  static const double defaultBottomNavigationBarElevation = 0;

  static const String keyBottomNavBarSelectedItemSchemeColor =
      'bottomNavBarSelectedItemSchemeColor';

  static const SchemeColor? defaultBottomNavBarSelectedItemSchemeColor = null;

  static const String keyBottomNavBarUnselectedSchemeColor =
      'bottomNavBarUnselectedItemSchemeColor';

  static const SchemeColor? defaultBottomNavBarUnselectedSchemeColor = null;

  static const String keyBottomNavBarMuteUnselected =
      'bottomNavBarMuteUnselected';

  static const bool defaultBottomNavBarMuteUnselected = true;

  static const String keyBottomNavShowSelectedLabels =
      'bottomNavShowSelectedLabels';

  static const bool defaultBottomNavShowSelectedLabels = true;

  static const String keyBottomNavShowUnselectedLabels =
      'bottomNavShowUnselectedLabels';

  static const bool defaultBottomNavShowUnselectedLabels = true;

  static const String keyNavBarBackgroundSchemeColor =
      'navBarBackgroundSchemeColor';

  static const SchemeColor? defaultNavBarBackgroundSchemeColor = null;

  static const String keyNavBarOpacity = 'navBarOpacity';

  static const double defaultNavBarOpacity = 1.0;

  static const String keyNavigationBarElevation = 'navigationBarElevation';

  static const double? defaultNavigationBarElevation = null;

  static const String keyNavBarHeight = 'navBarHeight';

  static const double? defaultNavBarHeight = null;

  static const String keyNavBarSelectedItemSchemeColor =
      'navBarSelectedItemSchemeColor';

  static const SchemeColor? defaultNavBarSelectedItemSchemeColor = null;

  static const String keyNavBarUnselectedSchemeColor =
      'navBarUnselectedItemSchemeColor';

  static const SchemeColor? defaultNavBarUnselectedSchemeColor = null;

  static const String keyNavBarMuteUnselected = 'navBarMuteUnselected';

  static const bool defaultNavBarMuteUnselected = true;

  static const String keyNavBarIndicatorSchemeColor =
      'navBarIndicatorSchemeColor';

  static const SchemeColor? defaultNavBarIndicatorSchemeColor = null;

  static const String keyNavBarIndicatorOpacity = 'navBarIndicatorOpacity';

  static const double? defaultNavBarIndicatorOpacity = null;

  static const String keyNavBarLabelBehavior = 'navBarLabelBehavior';

  static const NavigationDestinationLabelBehavior defaultNavBarLabelBehavior =
      NavigationDestinationLabelBehavior.alwaysShow;

  static const String keyNavRailBackgroundSchemeColor =
      'navRailBackgroundSchemeColor';

  static const SchemeColor? defaultNavRailBackgroundSchemeColor = null;

  static const String keyNavRailOpacity = 'navRailOpacity';

  static const double defaultNavRailOpacity = 1.0;

  static const String keyNavigationRailElevation = 'navigationRailElevation';

  static const double defaultNavigationRailElevation = 0;

  static const String keyNavRailSelectedItemSchemeColor =
      'navRailSelectedItemSchemeColor';

  static const SchemeColor? defaultNavRailSelectedItemSchemeColor = null;

  static const String keyNavRailUnselectedSchemeColor =
      'navRailUnselectedItemSchemeColor';

  static const SchemeColor? defaultNavRailUnselectedSchemeColor = null;

  static const String keyNavRailMuteUnselected = 'navRailMuteUnselected';

  static const bool defaultNavRailMuteUnselected = true;

  static const String keyNavRailLabelType = 'navRailLabelType';

  static const NavigationRailLabelType defaultNavRailLabelType =
      NavigationRailLabelType.all;

  static const String keyNavRailUseIndicator = 'navRailUseIndicator';

  static const bool defaultNavRailUseIndicator = true;

  static const String keyNavRailIndicatorSchemeColor =
      'navRailIndicatorSchemeColor';

  static const SchemeColor? defaultNavRailIndicatorSchemeColor = null;

  static const String keyNavRailIndicatorOpacity = 'navRailIndicatorOpacity';

  static const double? defaultNavRailIndicatorOpacity = null;

  static const String keyTextButtonSchemeColor = 'textButtonSchemeColor';

  static const SchemeColor? defaultTextButtonSchemeColor = null;

  static const String keyTextButtonBorderRadius = 'textButtonBorderRadius';

  static const double? defaultTextButtonBorderRadius = null;

  static const String keyElevatedButtonSchemeColor =
      'elevatedButtonSchemeColor';

  static const SchemeColor? defaultElevatedButtonSchemeColor = null;

  static const String keyElevatedButtonSecondarySchemeColor =
      'elevatedButtonSecondarySchemeColor';

  static const SchemeColor? defaultElevatedButtonSecondarySchemeColor = null;

  static const String keyElevatedButtonBorderRadius =
      'elevatedButtonBorderRadius';

  static const double? defaultElevatedButtonBorderRadius = null;

  static const String keyOutlinedButtonSchemeColor =
      'outlinedButtonSchemeColor';

  static const SchemeColor? defaultOutlinedButtonSchemeColor = null;

  static const String keyOutlinedButtonOutlineSchemeColor =
      'outlinedButtonOutlineSchemeColor';

  static const SchemeColor? defaultOutlinedButtonOutlineSchemeColor = null;

  static const String keyOutlinedButtonBorderRadius =
      'outlinedButtonBorderRadius';

  static const double? defaultOutlinedButtonBorderRadius = null;

  static const String keyOutlinedButtonBorderWidth =
      'outlinedButtonBorderWidth';

  static const double? defaultOutlinedButtonBorderWidth = null;

  static const String keyOutlinedButtonPressedBorderWidth =
      'outlinedButtonPressedBorderWidth';

  static const double? defaultOutlinedButtonPressedBorderWidth = null;

  static const String keyToggleButtonsSchemeColor = 'toggleButtonsSchemeColor';

  static const SchemeColor? defaultToggleButtonsSchemeColor = null;

  static const String keyToggleButtonsBorderRadius =
      'toggleButtonsBorderRadius';

  static const double? defaultToggleButtonsBorderRadius = null;

  static const String keyToggleButtonsBorderWidth = 'toggleButtonsBorderWidth';

  static const double? defaultToggleButtonsBorderWidth = null;

  static const String keyUnselectedToggleIsColored =
      'unselectedToggleIsColored';

  static const bool defaultUnselectedToggleIsColored = false;

  static const String keySwitchSchemeColor = 'switchSchemeColor';

  static const SchemeColor? defaultSwitchSchemeColor = null;

  static const String keySwitchThumbSchemeColor = 'switchThumbSchemeColor';

  static const SchemeColor? defaultSwitchThumbSchemeColor = null;

  static const String keyCheckboxSchemeColor = 'checkboxSchemeColor';

  static const SchemeColor? defaultCheckboxSchemeColor = null;

  static const String keyRadioSchemeColor = 'radioSchemeColor';

  static const SchemeColor? defaultRadioSchemeColor = null;

  static const String keySliderBaseSchemeColor = 'sliderBaseSchemeColor';

  static const SchemeColor? defaultSliderBaseSchemeColor = null;

  static const String keySliderValueTinted = 'sliderValueTinted';

  static const bool defaultSliderValueTinted = false;

  static const String keySliderTrackHeight = 'sliderTrackHeight';

  static const double? defaultSliderTrackHeight = null;

  static const String keyFabUseShape = 'fabUseShape';

  static const bool defaultFabUseShape = false;

  static const String keyFabAlwaysCircular = 'fabAlwaysCircular';

  static const bool defaultFabAlwaysCircular = false;

  static const String keyFabBorderRadius = 'fabBorderRadius';

  static const double? defaultFabBorderRadius = null;

  static const String keyFabSchemeColor = 'fabSchemeColor';

  static const SchemeColor? defaultFabSchemeColor = null;

  static const String keyChipSchemeColor = 'chipSchemeColor';

  static const SchemeColor? defaultChipSchemeColor = null;

  static const String keyChipSelectedSchemeColor = 'chipSelectedSchemeColor';

  static const SchemeColor? defaultChipSelectedSchemeColor = null;

  static const String keyChipDeleteIconSchemeColor =
      'chipDeleteIconSchemeColor';

  static const SchemeColor? defaultChipDeleteIconSchemeColor = null;

  static const String keyChipBorderRadius = 'chipBorderRadius';

  static const double? defaultChipBorderRadius = null;

  static const String keySnackBarSchemeColor = 'snackBarSchemeColor';

  static const SchemeColor? defaultSnackBarSchemeColor = null;

  static const String keyPopupMenuSchemeColor = 'popupMenuSchemeColor';

  static const SchemeColor? defaultPopupMenuSchemeColor = null;

  static const String keyPopupMenuOpacity = 'popupMenuOpacity';

  static const double defaultPopupMenuOpacity = 1;

  static const String keyPopupMenuBorderRadius = 'popupMenuBorderRadius';

  static const double? defaultPopupMenuBorderRadius = null;

  static const String keyPopupMenuElevation = 'popupMenuElevation';

  static const double? defaultPopupMenuElevation = null;

  static const String keyCardBorderRadius = 'cardBorderRadius';

  static const double? defaultCardBorderRadius = null;

  static const String keyDialogBackgroundSchemeColor =
      'dialogBackgroundSchemeColor';

  static const SchemeColor? defaultDialogBackgroundSchemeColor = null;

  static const String keyDialogBorderRadius = 'dialogBorderRadius';

  static const double? defaultDialogBorderRadius = null;

  static const String keyDialogElevation = 'dialogElevation';

  static const double? defaultDialogElevation = null;

  static const String keyTooltipRadius = 'tooltipRadius';

  static const double? defaultTooltipRadius = null;

  static const String keyTooltipWaitDuration = 'tooltipWaitDuration';

  static const int? defaultTooltipWaitDuration = null;

  static const String keyTooltipShowDuration = 'tooltipShowDuration';

  static const int? defaultTooltipShowDuration = null;

  static const String keyTooltipSchemeColor = 'tooltipSchemeColor';

  static const SchemeColor? defaultTooltipSchemeColor = null;

  static const String keyTooltipOpacity = 'tooltipOpacity';

  static const double defaultTooltipOpacity = 1.0;

  static const String keySurfaceTintLight = 'surfaceTintLight';

  static const Color? defaultSurfaceTintLight = null;

  static const String keySurfaceTintLightSchemeColor =
      'surfaceTintLightSchemeColor';

  static const SchemeColor? defaultSurfaceTintLightSchemeColor = null;

  static const String keySurfaceTintDark = 'surfaceTintDark';

  static const Color? defaultSurfaceTintDark = null;

  static const String keySurfaceTintDarkSchemeColor =
      'surfaceTintDarkSchemeColor';

  static const SchemeColor? defaultSurfaceTintDarkSchemeColor = null;

  static const String keyPrimaryLight = 'primaryLight';

  static const Color defaultPrimaryLight = AppColor.customPrimaryLight;

  static const String keyPrimaryContainerLight = 'primaryContainerLight';

  static const Color defaultPrimaryContainerLight =
      AppColor.customPrimaryContainerLight;

  static const String keySecondaryLight = 'secondaryLight';

  static const Color defaultSecondaryLight = AppColor.customSecondaryLight;

  static const String keySecondaryContainerLight = 'secondaryContainerLight';

  static const Color defaultSecondaryContainerLight =
      AppColor.customSecondaryContainerLight;

  static const String keyTertiaryLight = 'tertiaryLight';

  static const Color defaultTertiaryLight = AppColor.customTertiaryLight;

  static const String keyTertiaryContainerLight = 'tertiaryContainerLight';

  static const Color defaultTertiaryContainerLight =
      AppColor.customTertiaryContainerLight;

  static const String keyPrimaryDark = 'primaryDark';

  static const Color defaultPrimaryDark = AppColor.customPrimaryDark;

  static const String keyPrimaryContainerDark = 'primaryContainerDark';

  static const Color defaultPrimaryContainerDark =
      AppColor.customPrimaryContainerDark;

  static const String keySecondaryDark = 'secondaryDark';

  static const Color defaultSecondaryDark = AppColor.customSecondaryDark;

  static const String keySecondaryContainerDark = 'secondaryContainerDark';

  static const Color defaultSecondaryContainerDark =
      AppColor.customSecondaryContainerDark;

  static const String keyTertiaryDark = 'tertiaryDark';

  static const Color defaultTertiaryDark = AppColor.customTertiaryDark;

  static const String keyTertiaryContainerDark = 'tertiaryContainerDark';

  static const Color defaultTertiaryContainerDark =
      AppColor.customTertiaryContainerDark;
}
