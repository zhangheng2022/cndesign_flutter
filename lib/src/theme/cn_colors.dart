export 'package:flutter/material.dart';
import 'dart:ui';

import 'cn_theme.dart';

extension CnColors on CnThemeData {
  /// 功能色组----------------------------------------------------

  ///#F2F3FF
  Color get brandColor1 => colorMap['brandColor1'] ?? const Color(0xFFF2F3FF);

  ///#D9E1FF
  Color get brandColor2 => colorMap['brandColor2'] ?? const Color(0xFFD9E1FF);

  ///#B5C7FF
  Color get brandColor3 => colorMap['brandColor3'] ?? const Color(0xFFB5C7FF);

  ///#8EABFF
  Color get brandColor4 => colorMap['brandColor4'] ?? const Color(0xFF8EABFF);

  ///#618DFF
  Color get brandColor5 => colorMap['brandColor5'] ?? const Color(0xFF618DFF);

  ///#366EF4
  Color get brandColor6 => colorMap['brandColor6'] ?? const Color(0xFF366EF4);

  ///#0052D9
  Color get brandColor7 => colorMap['brandColor7'] ?? const Color(0xFF0052D9);

  ///#003CAB
  Color get brandColor8 => colorMap['brandColor8'] ?? const Color(0xFF003CAB);

  ///#002A7C
  Color get brandColor9 => colorMap['brandColor9'] ?? const Color(0xFF002A7C);

  ///#001A57
  Color get brandColor10 => colorMap['brandColor10'] ?? const Color(0xFF001A57);

  ///#F2F3FF
  Color get brandLightColor => colorMap['brandLightColor'] ?? brandColor1;

  ///#D9E1FF
  Color get brandFocusColor => colorMap['brandFocusColor'] ?? brandColor2;

  ///#B5C7FF
  Color get brandDisabledColor => colorMap['brandDisabledColor'] ?? brandColor3;

  ///#366EF4
  Color get brandHoverColor => colorMap['brandHoverColor'] ?? brandColor6;

  ///#0052D9
  Color get brandNormalColor => colorMap['brandNormalColor'] ?? brandColor7;

  ///#003CAB
  Color get brandClickColor => colorMap['brandClickColor'] ?? brandColor8;

  /// 错误色组----------------------------------------------------

  ///#FFF0ED
  Color get errorColor1 => colorMap['errorColor1'] ?? const Color(0xFFFFF0ED);

  ///#FFD8D2
  Color get errorColor2 => colorMap['errorColor2'] ?? const Color(0xFFFFD8D2);

  ///#FFB9B0
  Color get errorColor3 => colorMap['errorColor3'] ?? const Color(0xFFFFB9B0);

  ///#FF9285
  Color get errorColor4 => colorMap['errorColor4'] ?? const Color(0xFFFF9285);

  ///#F6685D
  Color get errorColor5 => colorMap['errorColor5'] ?? const Color(0xFFF6685D);

  ///#D54941
  Color get errorColor6 => colorMap['errorColor6'] ?? const Color(0xFFD54941);

  ///#AD352F
  Color get errorColor7 => colorMap['errorColor7'] ?? const Color(0xFFAD352F);

  ///#881F1C
  Color get errorColor8 => colorMap['errorColor8'] ?? const Color(0xFF881F1C);

  ///#68070A
  Color get errorColor9 => colorMap['errorColor9'] ?? const Color(0xFF68070A);

  ///#490002
  Color get errorColor10 => colorMap['errorColor10'] ?? const Color(0xFF490002);

  ///#FFF0ED
  Color get errorLightColor => colorMap['errorLightColor'] ?? errorColor1;

  ///#FFD8D2
  Color get errorFocusColor => colorMap['errorFocusColor'] ?? errorColor2;

  ///#FFB9B0
  Color get errorDisabledColor => colorMap['errorDisabledColor'] ?? errorColor3;

  ///#F6685D
  Color get errorHoverColor => colorMap['errorHoverColor'] ?? errorColor5;

  ///#D54941
  Color get errorNormalColor => colorMap['errorNormalColor'] ?? errorColor6;

  ///#AD352F
  Color get errorClickColor => colorMap['errorClickColor'] ?? errorColor7;
}
