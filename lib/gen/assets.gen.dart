/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/background_icons.png
  AssetGenImage get backgroundIcons =>
      const AssetGenImage('assets/images/background_icons.png');

  /// File path: assets/images/background_icons_simple.png
  AssetGenImage get backgroundIconsSimple =>
      const AssetGenImage('assets/images/background_icons_simple.png');

  /// File path: assets/images/background_sheet.png
  AssetGenImage get backgroundSheet =>
      const AssetGenImage('assets/images/background_sheet.png');

  /// File path: assets/images/icon_student.png
  AssetGenImage get iconStudent =>
      const AssetGenImage('assets/images/icon_student.png');

  /// File path: assets/images/icon_teacher.png
  AssetGenImage get iconTeacher =>
      const AssetGenImage('assets/images/icon_teacher.png');

  /// File path: assets/images/medal_bronze.png
  AssetGenImage get medalBronze =>
      const AssetGenImage('assets/images/medal_bronze.png');

  /// File path: assets/images/medal_gold.png
  AssetGenImage get medalGold =>
      const AssetGenImage('assets/images/medal_gold.png');

  /// File path: assets/images/medal_silver.png
  AssetGenImage get medalSilver =>
      const AssetGenImage('assets/images/medal_silver.png');

  /// File path: assets/images/rating_0_5.png
  AssetGenImage get rating05 =>
      const AssetGenImage('assets/images/rating_0_5.png');

  /// File path: assets/images/rating_1.png
  AssetGenImage get rating1 =>
      const AssetGenImage('assets/images/rating_1.png');

  /// File path: assets/images/rating_1_5.png
  AssetGenImage get rating15 =>
      const AssetGenImage('assets/images/rating_1_5.png');

  /// File path: assets/images/rating_2.png
  AssetGenImage get rating2 =>
      const AssetGenImage('assets/images/rating_2.png');

  /// File path: assets/images/rating_2_5.png
  AssetGenImage get rating25 =>
      const AssetGenImage('assets/images/rating_2_5.png');

  /// File path: assets/images/rating_3.png
  AssetGenImage get rating3 =>
      const AssetGenImage('assets/images/rating_3.png');

  /// File path: assets/images/rating_3_5.png
  AssetGenImage get rating35 =>
      const AssetGenImage('assets/images/rating_3_5.png');

  /// File path: assets/images/rating_4.png
  AssetGenImage get rating4 =>
      const AssetGenImage('assets/images/rating_4.png');

  /// File path: assets/images/rating_4_5.png
  AssetGenImage get rating45 =>
      const AssetGenImage('assets/images/rating_4_5.png');

  /// File path: assets/images/rating_5.png
  AssetGenImage get rating5 =>
      const AssetGenImage('assets/images/rating_5.png');

  /// File path: assets/images/sparky.png
  AssetGenImage get sparky => const AssetGenImage('assets/images/sparky.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        backgroundIcons,
        backgroundIconsSimple,
        backgroundSheet,
        iconStudent,
        iconTeacher,
        medalBronze,
        medalGold,
        medalSilver,
        rating05,
        rating1,
        rating15,
        rating2,
        rating25,
        rating3,
        rating35,
        rating4,
        rating45,
        rating5,
        sparky
      ];
}

class Assets {
  Assets._();

  static const String aGitkeep = 'assets/.gitkeep';
  static const $AssetsImagesGen images = $AssetsImagesGen();

  /// List of all assets
  static List<String> get values => [aGitkeep];
}

class AssetGenImage {
  const AssetGenImage(this._assetName, {this.size = null});

  final String _assetName;

  final Size? size;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
