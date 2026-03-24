// ignore_for_file: overridden_fields, annotate_overrides

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum DeviceSize { mobile, tablet, desktop }

abstract class FlutterFlowThemeNew {
  static DeviceSize deviceSize = DeviceSize.mobile;

  static FlutterFlowThemeNew of(BuildContext context) {
    deviceSize = getDeviceSize(context);
    return LightModeTheme();
  }

  @Deprecated('Use primary instead')
  Color get primaryColor => primary;
  @Deprecated('Use secondary instead')
  Color get secondaryColor => secondary;
  @Deprecated('Use tertiary instead')
  Color get tertiaryColor => tertiary;
  late Color primaryBlue;
  late Color primary;
  late Color secondary;
  late Color tertiary;
  late Color alternate;
  late Color primaryText;
  late Color secondaryText;
  late Color primaryBackground;
  late Color secondaryBackground;
  late Color accent1;
  late Color accent2;
  late Color accent3;
  late Color accent4;
  late Color success;
  late Color warning;
  late Color error;
  late Color info;

  late Color customColor1;
  late Color customColor2;
  late Color customColor3;
  late Color customColor4;
  late Color customColor5;

  @Deprecated('Use displaySmallFamily instead')
  String get title1Family => displaySmallFamily;
  @Deprecated('Use displaySmall instead')
  TextStyle get title1 => typography.displaySmall;
  @Deprecated('Use headlineMediumFamily instead')
  String get title2Family => typography.headlineMediumFamily;
  @Deprecated('Use headlineMedium instead')
  TextStyle get title2 => typography.headlineMedium;
  @Deprecated('Use headlineSmallFamily instead')
  String get title3Family => typography.headlineSmallFamily;
  @Deprecated('Use headlineSmall instead')
  TextStyle get title3 => typography.headlineSmall;
  @Deprecated('Use titleMediumFamily instead')
  String get subtitle1Family => typography.titleMediumFamily;
  @Deprecated('Use titleMedium instead')
  TextStyle get subtitle1 => typography.titleMedium;
  @Deprecated('Use titleSmallFamily instead')
  String get subtitle2Family => typography.titleSmallFamily;
  @Deprecated('Use titleSmall instead')
  TextStyle get subtitle2 => typography.titleSmall;
  @Deprecated('Use bodyMediumFamily instead')
  String get bodyText1Family => typography.bodyMediumFamily;
  @Deprecated('Use bodyMedium instead')
  TextStyle get bodyText1 => typography.bodyMedium;
  @Deprecated('Use bodySmallFamily instead')
  String get bodyText2Family => typography.bodySmallFamily;
  @Deprecated('Use bodySmall instead')
  TextStyle get bodyText2 => typography.bodySmall;

  String get displayLargeFamily => typography.displayLargeFamily;
  bool get displayLargeIsCustom => typography.displayLargeIsCustom;
  TextStyle get displayLarge => typography.displayLarge;
  String get displayMediumFamily => typography.displayMediumFamily;
  bool get displayMediumIsCustom => typography.displayMediumIsCustom;
  TextStyle get displayMedium => typography.displayMedium;
  String get displaySmallFamily => typography.displaySmallFamily;
  bool get displaySmallIsCustom => typography.displaySmallIsCustom;
  TextStyle get displaySmall => typography.displaySmall;
  String get headlineLargeFamily => typography.headlineLargeFamily;
  bool get headlineLargeIsCustom => typography.headlineLargeIsCustom;
  TextStyle get headlineLarge => typography.headlineLarge;
  String get headlineMediumFamily => typography.headlineMediumFamily;
  bool get headlineMediumIsCustom => typography.headlineMediumIsCustom;
  TextStyle get headlineMedium => typography.headlineMedium;
  String get headlineSmallFamily => typography.headlineSmallFamily;
  bool get headlineSmallIsCustom => typography.headlineSmallIsCustom;
  TextStyle get headlineSmall => typography.headlineSmall;
  String get titleLargeFamily => typography.titleLargeFamily;
  bool get titleLargeIsCustom => typography.titleLargeIsCustom;
  TextStyle get titleLarge => typography.titleLarge;
  String get titleMediumFamily => typography.titleMediumFamily;
  bool get titleMediumIsCustom => typography.titleMediumIsCustom;
  TextStyle get titleMedium => typography.titleMedium;
  String get titleSmallFamily => typography.titleSmallFamily;
  bool get titleSmallIsCustom => typography.titleSmallIsCustom;
  TextStyle get titleSmall => typography.titleSmall;
  String get labelLargeFamily => typography.labelLargeFamily;
  bool get labelLargeIsCustom => typography.labelLargeIsCustom;
  TextStyle get labelLarge => typography.labelLarge;
  String get labelMediumFamily => typography.labelMediumFamily;
  bool get labelMediumIsCustom => typography.labelMediumIsCustom;
  TextStyle get labelMedium => typography.labelMedium;
  String get labelSmallFamily => typography.labelSmallFamily;
  bool get labelSmallIsCustom => typography.labelSmallIsCustom;
  TextStyle get labelSmall => typography.labelSmall;
  String get bodyLargeFamily => typography.bodyLargeFamily;
  bool get bodyLargeIsCustom => typography.bodyLargeIsCustom;
  TextStyle get bodyLarge => typography.bodyLarge;
  String get bodyMediumFamily => typography.bodyMediumFamily;
  bool get bodyMediumIsCustom => typography.bodyMediumIsCustom;
  TextStyle get bodyMedium => typography.bodyMedium;
  String get bodySmallFamily => typography.bodySmallFamily;
  bool get bodySmallIsCustom => typography.bodySmallIsCustom;
  TextStyle get bodySmall => typography.bodySmall;

  Typography get typography => {
    DeviceSize.mobile: MobileTypography(this),
    DeviceSize.tablet: TabletTypography(this),
    DeviceSize.desktop: DesktopTypography(this),
  }[deviceSize]!;
}

DeviceSize getDeviceSize(BuildContext context) {
  final width = MediaQuery.sizeOf(context).width;
  if (width < 479) {
    return DeviceSize.mobile;
  } else if (width < 991) {
    return DeviceSize.tablet;
  } else {
    return DeviceSize.desktop;
  }
}

class LightModeTheme extends FlutterFlowThemeNew {
  @Deprecated('Use primary instead')
  Color get primaryColor => primary;
  @Deprecated('Use secondary instead')
  Color get secondaryColor => secondary;
  @Deprecated('Use tertiary instead')
  Color get tertiaryColor => tertiary;
  late Color  primaryBlue = Color(0xFF4A90E2);

  late Color primary = const Color(0xFF339FF3);
  late Color secondary = const Color(0xFFB9C0FF);
  late Color tertiary = const Color(0xFFA7C6ED);
  late Color alternate = const Color(0xFFEAEFFB);
  late Color primaryText = const Color(0xFF000000);
  late Color secondaryText = const Color(0xFF6C6C6C);
  late Color primaryBackground = const Color(0xFFF5F7FA);
  late Color secondaryBackground = const Color(0xFFFFFFFF);
  late Color accent1 = const Color(0xFF00BFFF);
  late Color accent2 = const Color(0xFF5C6AC4);
  late Color accent3 = const Color(0xFFFF8B94);
  late Color accent4 = const Color(0xFFFFD3B4);
  late Color success = const Color(0xFF4CAF50);
  late Color warning = const Color(0xFFFF9800);
  late Color error = const Color(0xFFF44336);
  late Color info = const Color(0xFF2196F3);

  late Color customColor1 = const Color(0xFF1D8B6B);
  late Color customColor2 = const Color(0xFF46D8AD);
  late Color customColor3 = const Color(0xFFD83B30);
  late Color customColor4 = const Color(0xFFFF7C76);
  late Color customColor5 = const Color(0xFF164874);
}

abstract class Typography {
  String get displayLargeFamily;
  bool get displayLargeIsCustom;
  TextStyle get displayLarge;
  String get displayMediumFamily;
  bool get displayMediumIsCustom;
  TextStyle get displayMedium;
  String get displaySmallFamily;
  bool get displaySmallIsCustom;
  TextStyle get displaySmall;
  String get headlineLargeFamily;
  bool get headlineLargeIsCustom;
  TextStyle get headlineLarge;
  String get headlineMediumFamily;
  bool get headlineMediumIsCustom;
  TextStyle get headlineMedium;
  String get headlineSmallFamily;
  bool get headlineSmallIsCustom;
  TextStyle get headlineSmall;
  String get titleLargeFamily;
  bool get titleLargeIsCustom;
  TextStyle get titleLarge;
  String get titleMediumFamily;
  bool get titleMediumIsCustom;
  TextStyle get titleMedium;
  String get titleSmallFamily;
  bool get titleSmallIsCustom;
  TextStyle get titleSmall;
  String get labelLargeFamily;
  bool get labelLargeIsCustom;
  TextStyle get labelLarge;
  String get labelMediumFamily;
  bool get labelMediumIsCustom;
  TextStyle get labelMedium;
  String get labelSmallFamily;
  bool get labelSmallIsCustom;
  TextStyle get labelSmall;
  String get bodyLargeFamily;
  bool get bodyLargeIsCustom;
  TextStyle get bodyLarge;
  String get bodyMediumFamily;
  bool get bodyMediumIsCustom;
  TextStyle get bodyMedium;
  String get bodySmallFamily;
  bool get bodySmallIsCustom;
  TextStyle get bodySmall;
}

class MobileTypography extends Typography {
  MobileTypography(this.theme);

  final FlutterFlowThemeNew theme;

  String get displayLargeFamily => 'Sarabun';
  bool get displayLargeIsCustom => false;
  TextStyle get displayLarge => GoogleFonts.sarabun(color: theme.primaryText, fontWeight: FontWeight.w600, fontSize: 64.0);
  String get displayMediumFamily => 'Sarabun';
  bool get displayMediumIsCustom => false;
  TextStyle get displayMedium => GoogleFonts.sarabun(color: theme.primaryText, fontWeight: FontWeight.w500, fontSize: 44.0);
  String get displaySmallFamily => 'Sarabun';
  bool get displaySmallIsCustom => false;
  TextStyle get displaySmall => GoogleFonts.sarabun(color: theme.primaryText, fontWeight: FontWeight.w500, fontSize: 36.0);
  String get headlineLargeFamily => 'Sarabun';
  bool get headlineLargeIsCustom => false;
  TextStyle get headlineLarge => GoogleFonts.sarabun(color: theme.primaryText, fontWeight: FontWeight.w500, fontSize: 32.0);
  String get headlineMediumFamily => 'Sarabun';
  bool get headlineMediumIsCustom => false;
  TextStyle get headlineMedium => GoogleFonts.sarabun(color: theme.primaryText, fontWeight: FontWeight.w500, fontSize: 28.0);
  String get headlineSmallFamily => 'Sarabun';
  bool get headlineSmallIsCustom => false;
  TextStyle get headlineSmall => GoogleFonts.sarabun(color: theme.primaryText, fontWeight: FontWeight.w500, fontSize: 24.0);
  String get titleLargeFamily => 'Sarabun';
  bool get titleLargeIsCustom => false;
  TextStyle get titleLarge => GoogleFonts.sarabun(color: theme.primaryText, fontWeight: FontWeight.w500, fontSize: 20.0);
  String get titleMediumFamily => 'Sarabun';
  bool get titleMediumIsCustom => false;
  TextStyle get titleMedium => GoogleFonts.sarabun(color: theme.primaryText, fontWeight: FontWeight.w500, fontSize: 20.0);
  String get titleSmallFamily => 'Sarabun';
  bool get titleSmallIsCustom => false;
  TextStyle get titleSmall => GoogleFonts.sarabun(color: theme.primaryText, fontWeight: FontWeight.w500, fontSize: 18.0);
  String get labelLargeFamily => 'Sarabun';
  bool get labelLargeIsCustom => false;
  TextStyle get labelLarge => GoogleFonts.sarabun(color: theme.secondaryText, fontWeight: FontWeight.normal, fontSize: 18.0);
  String get labelMediumFamily => 'Sarabun';
  bool get labelMediumIsCustom => false;
  TextStyle get labelMedium => GoogleFonts.sarabun(color: theme.primaryText, fontWeight: FontWeight.w500, fontSize: 16.0);
  String get labelSmallFamily => 'Sarabun';
  bool get labelSmallIsCustom => false;
  TextStyle get labelSmall => GoogleFonts.sarabun(color: theme.secondaryText, fontWeight: FontWeight.normal, fontSize: 14.0);
  String get bodyLargeFamily => 'Sarabun';
  bool get bodyLargeIsCustom => false;
  TextStyle get bodyLarge => GoogleFonts.sarabun(color: theme.primaryText, fontWeight: FontWeight.normal, fontSize: 18.0);
  String get bodyMediumFamily => 'Sarabun';
  bool get bodyMediumIsCustom => false;
  TextStyle get bodyMedium => GoogleFonts.sarabun(color: theme.primaryText, fontWeight: FontWeight.normal, fontSize: 16.0);
  String get bodySmallFamily => 'Sarabun';
  bool get bodySmallIsCustom => false;
  TextStyle get bodySmall => GoogleFonts.sarabun(color: theme.primaryText, fontWeight: FontWeight.normal, fontSize: 14.0);
}

class TabletTypography extends Typography {
  TabletTypography(this.theme);

  final FlutterFlowThemeNew theme;

  String get displayLargeFamily => 'Sarabun';
  bool get displayLargeIsCustom => false;
  TextStyle get displayLarge => GoogleFonts.sarabun(color: theme.primaryText, fontWeight: FontWeight.w500, fontSize: 66.0);
  String get displayMediumFamily => 'Sarabun';
  bool get displayMediumIsCustom => false;
  TextStyle get displayMedium => GoogleFonts.sarabun(color: theme.primaryText, fontWeight: FontWeight.w500, fontSize: 46.0);
  String get displaySmallFamily => 'Sarabun';
  bool get displaySmallIsCustom => false;
  TextStyle get displaySmall => GoogleFonts.sarabun(color: theme.primaryText, fontWeight: FontWeight.w500, fontSize: 38.0);
  String get headlineLargeFamily => 'Sarabun';
  bool get headlineLargeIsCustom => false;
  TextStyle get headlineLarge => GoogleFonts.sarabun(color: theme.primaryText, fontWeight: FontWeight.w500, fontSize: 34.0);
  String get headlineMediumFamily => 'Sarabun';
  bool get headlineMediumIsCustom => false;
  TextStyle get headlineMedium => GoogleFonts.sarabun(color: theme.primaryText, fontWeight: FontWeight.w500, fontSize: 30.0);
  String get headlineSmallFamily => 'Sarabun';
  bool get headlineSmallIsCustom => false;
  TextStyle get headlineSmall => GoogleFonts.sarabun(color: theme.primaryText, fontWeight: FontWeight.w500, fontSize: 26.0);
  String get titleLargeFamily => 'Sarabun';
  bool get titleLargeIsCustom => false;
  TextStyle get titleLarge => GoogleFonts.sarabun(color: theme.primaryText, fontWeight: FontWeight.w500, fontSize: 22.0);
  String get titleMediumFamily => 'Sarabun';
  bool get titleMediumIsCustom => false;
  TextStyle get titleMedium => GoogleFonts.sarabun(color: theme.primaryText, fontWeight: FontWeight.w500, fontSize: 22.0);
  String get titleSmallFamily => 'Sarabun';
  bool get titleSmallIsCustom => false;
  TextStyle get titleSmall => GoogleFonts.sarabun(color: theme.primaryText, fontWeight: FontWeight.w500, fontSize: 20.0);
  String get labelLargeFamily => 'Sarabun';
  bool get labelLargeIsCustom => false;
  TextStyle get labelLarge => GoogleFonts.sarabun(color: theme.secondaryText, fontWeight: FontWeight.normal, fontSize: 20.0);
  String get labelMediumFamily => 'Sarabun';
  bool get labelMediumIsCustom => false;
  TextStyle get labelMedium => GoogleFonts.sarabun(color: theme.primaryText, fontWeight: FontWeight.w500, fontSize: 18.0);
  String get labelSmallFamily => 'Sarabun';
  bool get labelSmallIsCustom => false;
  TextStyle get labelSmall => GoogleFonts.sarabun(color: theme.secondaryText, fontWeight: FontWeight.normal, fontSize: 16.0);
  String get bodyLargeFamily => 'Sarabun';
  bool get bodyLargeIsCustom => false;
  TextStyle get bodyLarge => GoogleFonts.sarabun(color: theme.primaryText, fontWeight: FontWeight.normal, fontSize: 20.0);
  String get bodyMediumFamily => 'Sarabun';
  bool get bodyMediumIsCustom => false;
  TextStyle get bodyMedium => GoogleFonts.sarabun(color: theme.primaryText, fontWeight: FontWeight.normal, fontSize: 18.0);
  String get bodySmallFamily => 'Sarabun';
  bool get bodySmallIsCustom => false;
  TextStyle get bodySmall => GoogleFonts.sarabun(color: theme.primaryText, fontWeight: FontWeight.normal, fontSize: 16.0);
}

class DesktopTypography extends Typography {
  DesktopTypography(this.theme);

  final FlutterFlowThemeNew theme;

  String get displayLargeFamily => 'Sarabun';
  bool get displayLargeIsCustom => false;
  TextStyle get displayLarge => GoogleFonts.sarabun(color: theme.primaryText, fontWeight: FontWeight.w500, fontSize: 66.0);
  String get displayMediumFamily => 'Sarabun';
  bool get displayMediumIsCustom => false;
  TextStyle get displayMedium => GoogleFonts.sarabun(color: theme.primaryText, fontWeight: FontWeight.w500, fontSize: 46.0);
  String get displaySmallFamily => 'Sarabun';
  bool get displaySmallIsCustom => false;
  TextStyle get displaySmall => GoogleFonts.sarabun(color: theme.primaryText, fontWeight: FontWeight.w500, fontSize: 38.0);
  String get headlineLargeFamily => 'Sarabun';
  bool get headlineLargeIsCustom => false;
  TextStyle get headlineLarge => GoogleFonts.sarabun(color: theme.primaryText, fontWeight: FontWeight.w500, fontSize: 34.0);
  String get headlineMediumFamily => 'Sarabun';
  bool get headlineMediumIsCustom => false;
  TextStyle get headlineMedium => GoogleFonts.sarabun(color: theme.primaryText, fontWeight: FontWeight.w500, fontSize: 30.0);
  String get headlineSmallFamily => 'Sarabun';
  bool get headlineSmallIsCustom => false;
  TextStyle get headlineSmall => GoogleFonts.sarabun(color: theme.primaryText, fontWeight: FontWeight.w500, fontSize: 26.0);
  String get titleLargeFamily => 'Sarabun';
  bool get titleLargeIsCustom => false;
  TextStyle get titleLarge => GoogleFonts.sarabun(color: theme.primaryText, fontWeight: FontWeight.w500, fontSize: 22.0);
  String get titleMediumFamily => 'Sarabun';
  bool get titleMediumIsCustom => false;
  TextStyle get titleMedium => GoogleFonts.sarabun(color: theme.primaryText, fontWeight: FontWeight.w500, fontSize: 22.0);
  String get titleSmallFamily => 'Sarabun';
  bool get titleSmallIsCustom => false;
  TextStyle get titleSmall => GoogleFonts.sarabun(color: theme.primaryText, fontWeight: FontWeight.w500, fontSize: 20.0);
  String get labelLargeFamily => 'Sarabun';
  bool get labelLargeIsCustom => false;
  TextStyle get labelLarge => GoogleFonts.sarabun(color: theme.secondaryText, fontWeight: FontWeight.normal, fontSize: 18.0);
  String get labelMediumFamily => 'Sarabun';
  bool get labelMediumIsCustom => false;
  TextStyle get labelMedium => GoogleFonts.sarabun(color: theme.primaryText, fontWeight: FontWeight.w500, fontSize: 18.0);
  String get labelSmallFamily => 'Sarabun';
  bool get labelSmallIsCustom => false;
  TextStyle get labelSmall => GoogleFonts.sarabun(color: theme.secondaryText, fontWeight: FontWeight.normal, fontSize: 16.0);
  String get bodyLargeFamily => 'Sarabun';
  bool get bodyLargeIsCustom => false;
  TextStyle get bodyLarge => GoogleFonts.sarabun(color: theme.primaryText, fontWeight: FontWeight.normal, fontSize: 20.0);
  String get bodyMediumFamily => 'Sarabun';
  bool get bodyMediumIsCustom => false;
  TextStyle get bodyMedium => GoogleFonts.sarabun(color: theme.primaryText, fontWeight: FontWeight.normal, fontSize: 18.0);
  String get bodySmallFamily => 'Sarabun';
  bool get bodySmallIsCustom => false;
  TextStyle get bodySmall => GoogleFonts.sarabun(color: theme.primaryText, fontWeight: FontWeight.normal, fontSize: 16.0);
}

extension TextStyleHelper on TextStyle {
  TextStyle override({
    TextStyle? font,
    String? fontFamily,
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    double? letterSpacing,
    FontStyle? fontStyle,
    bool useGoogleFonts = false,
    TextDecoration? decoration,
    double? lineHeight,
    List<Shadow>? shadows,
    String? package,
  }) {
    if (useGoogleFonts && fontFamily != null) {
      font = GoogleFonts.getFont(fontFamily, fontWeight: fontWeight ?? this.fontWeight, fontStyle: fontStyle ?? this.fontStyle);
    }

    return font != null
        ? font.copyWith(
            color: color ?? this.color,
            fontSize: fontSize ?? this.fontSize,
            letterSpacing: letterSpacing ?? this.letterSpacing,
            fontWeight: fontWeight ?? this.fontWeight,
            fontStyle: fontStyle ?? this.fontStyle,
            decoration: decoration,
            height: lineHeight,
            shadows: shadows,
          )
        : copyWith(
            fontFamily: fontFamily,
            package: package,
            color: color,
            fontSize: fontSize,
            letterSpacing: letterSpacing,
            fontWeight: fontWeight,
            fontStyle: fontStyle,
            decoration: decoration,
            height: lineHeight,
            shadows: shadows,
          );
  }
}
