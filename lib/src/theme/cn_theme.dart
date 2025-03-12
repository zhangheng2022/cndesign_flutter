import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import './cn_default_theme.dart';
import 'dart:convert';

class CnTheme extends StatelessWidget {
  const CnTheme({
    super.key,
    this.systemData,
    required this.child,
    required this.themeData,
  });

  /// Flutter系统主题数据
  final ThemeData? systemData;

  /// 子控件
  final Widget child;

  /// 主题数据
  final CnThemeData themeData;

  /// 主题数据
  static CnThemeData? _singleData;

  @override
  Widget build(BuildContext context) {
    _singleData = themeData;
    var extensions = [themeData];
    return Theme(
      data:
          systemData?.copyWith(extensions: extensions) ??
          ThemeData(extensions: extensions),
      child: child,
    );
  }

  /// 获取默认主题数据，全局唯一
  static CnThemeData defaultData() {
    return CnThemeData.defaultData();
  }

  /// 获取主题数据，如果未传context则获取全局唯一的默认数据,
  /// 传了context，则获取最近的主题，取不到则会获取全局唯一默认数据
  static CnThemeData of([BuildContext? context]) {
    if (context == null) {
      // 如果context为null,则返回全局默认主题
      return _singleData ?? CnThemeData.defaultData();
    }
    // 如果传了context，则从其中获取最近主题
    try {
      return Theme.of(context).extension<CnThemeData>() ??
          CnThemeData.defaultData();
    } catch (e) {
      print('CnTheme.of() error: $e');
      return CnThemeData.defaultData();
    }
  }

  /// 获取主题数据，取不到则可空
  /// 传了context，则获取最近的主题，取不到或未传context则返回null
  static CnThemeData? ofNullable([BuildContext? context]) {
    if (context == null) return null;
    // 如果传了context，则从其中获取最近主题
    return Theme.of(context).extension<CnThemeData>();
  }
}

/// 主题数据
class CnThemeData extends ThemeExtension<CnThemeData> {
  static const String _defaultThemeName = 'default';
  static CnThemeData? _defaultThemeData;

  /// 名称
  late String name;

  /// 颜色
  late CnMap<String, Color> colorMap;

  /// 圆角
  late CnMap<String, double> radiusMap;

  /// 映射关系
  late CnMap<String, String> refMap;

  CnThemeData({
    required this.name,
    required this.colorMap,
    required this.radiusMap,
    required this.refMap,
  });

  /// 获取默认Data，一个App里只有一个，用于没有context的地方
  static CnThemeData defaultData() {
    _defaultThemeData ??=
        fromJson(_defaultThemeName, CnDefaultTheme.defaultThemeConfig) ??
        _emptyData(_defaultThemeName);

    return _defaultThemeData!;
  }

  /// 从父类拷贝
  CnThemeData copyWithCnThemeData(
    String name, {
    Map<String, Color>? colorMap,
    Map<String, double>? radiusMap,
  }) {
    return copyWith(name: name, colorMap: colorMap, radiusMap: radiusMap)
        as CnThemeData;
  }

  @override
  ThemeExtension<CnThemeData> copyWith({
    String? name,
    Map<String, Color>? colorMap,
    Map<String, double>? radiusMap,
  }) {
    var result = CnThemeData(
      name: name ?? this.name,
      colorMap: _copyMap<Color>(this.colorMap, colorMap),
      radiusMap: _copyMap<double>(this.radiusMap, radiusMap),
      refMap: _copyMap<String>(refMap, null),
    );
    return result;
  }

  /// 拷贝Map,防止内层
  CnMap<String, T> _copyMap<T>(CnMap<String, T> src, Map<String, T>? add) {
    var map = CnMap<String, T>(factory: () => src);

    src.forEach((key, value) {
      map[key] = value;
    });
    if (add != null) {
      map.addAll(add);
    }
    return map;
  }

  /// 创建空对象
  static CnThemeData _emptyData(String name) {
    var refMap = CnMap<String, String>();
    return CnThemeData(
      name: name,
      colorMap: CnMap(factory: () => defaultData().colorMap, refs: refMap),
      radiusMap: CnMap(factory: () => defaultData().radiusMap, refs: refMap),
      refMap: refMap,
    );
  }

  /// 解析配置的json文件为主题数据
  static CnThemeData? fromJson(
    String name,
    String themeJson, {
    bool recoverDefault = false,
  }) {
    if (themeJson.isEmpty) {
      print('CnTheme: parse themeJson is empty');
      return null;
    }

    try {
      final Map<String, dynamic> themeConfig = json.decode(themeJson);
      if (themeConfig.containsKey(name)) {
        var theme = _emptyData(name);
        Map<String, dynamic> curThemeMap = themeConfig[name];

        // 设置颜色
        Map<String, dynamic>? colorsMap = curThemeMap['color'];
        colorsMap?.forEach((key, value) {
          var color = _parseColor(value);
          if (color != null) {
            theme.colorMap[key] = color;
          }
        });

        // 设置圆角
        Map<String, dynamic>? radiusMap = curThemeMap['radius'];
        radiusMap?.forEach((key, value) {
          theme.radiusMap[key] = value is double ? value : value.toDouble();
        });

        // 设置引用关系
        Map<String, dynamic>? refMap = curThemeMap['ref'];
        refMap?.forEach((key, value) {
          theme.refMap[key] = value.toString();
        });

        if (recoverDefault) {
          _defaultThemeData = theme;
        }
        return theme;
      } else {
        print('CnTheme: theme not found with name: $name');
        return null;
      }
    } catch (e) {
      print('CnTheme: parse theme data error: $e');
      return null;
    }
  }

  // 辅助方法：解析颜色
  static Color? _parseColor(dynamic value) {
    if (value is String && value.startsWith('#')) {
      value = value.substring(1);
      if (value.length == 6) {
        value = 'FF$value';
      }
      return Color(int.parse(value, radix: 16));
    }
    return null;
  }

  Color? ofColor(String? key) {
    return colorMap[key];
  }

  double? ofRadius(String? key) {
    return radiusMap[key];
  }

  @override
  ThemeExtension<CnThemeData> lerp(
    ThemeExtension<CnThemeData>? other,
    double t,
  ) {
    if (other is! CnThemeData) {
      return this;
    }
    return CnThemeData(
      name: other.name,
      colorMap: other.colorMap,
      radiusMap: other.radiusMap,
      refMap: other.refMap,
    );
  }

  // 添加便捷方法
  Color getColor(String key, {Color? defaultColor}) {
    return colorMap[key] ?? defaultColor ?? Colors.transparent;
  }

  double getRadius(String key, {double defaultRadius = 0.0}) {
    return radiusMap[key] ?? defaultRadius;
  }
}

typedef DefaultMapFactory = CnMap? Function();

/// 自定义Map
class CnMap<K, V> extends DelegatingMap<K, V> {
  CnMap({this.factory, this.refs}) : super({});
  DefaultMapFactory? factory;
  CnMap? refs;

  @override
  V? operator [](Object? key) {
    if (key == null) return null;

    // 先检查引用映射
    key = refs?[key] ?? key;

    // 直接从当前Map获取
    var value = super[key];
    if (value != null) {
      return value;
    }

    // 从默认工厂获取
    return factory?.call()?.get(key) as V?;
  }

  V? get(Object? key) {
    return super[key];
  }
}
