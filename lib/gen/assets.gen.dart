/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsIconGen {
  const $AssetsIconGen();

  /// File path: assets/icon/icon.png
  AssetGenImage get icon => const AssetGenImage('assets/icon/icon.png');

  /// List of all assets
  List<AssetGenImage> get values => [icon];
}

class $AssetsPngGen {
  const $AssetsPngGen();

  /// File path: assets/png/doctor.png
  AssetGenImage get doctor => const AssetGenImage('assets/png/doctor.png');

  /// File path: assets/png/ic_apple.png
  AssetGenImage get icApple => const AssetGenImage('assets/png/ic_apple.png');

  /// File path: assets/png/ic_copy.png
  AssetGenImage get icCopy => const AssetGenImage('assets/png/ic_copy.png');

  /// File path: assets/png/ic_map_pin.png
  AssetGenImage get icMapPin =>
      const AssetGenImage('assets/png/ic_map_pin.png');

  /// File path: assets/png/ic_supper.png
  AssetGenImage get icSupper => const AssetGenImage('assets/png/ic_supper.png');

  /// List of all assets
  List<AssetGenImage> get values =>
      [doctor, icApple, icCopy, icMapPin, icSupper];
}

class $AssetsSvgGen {
  const $AssetsSvgGen();

  /// File path: assets/svg/avatar_test.png
  AssetGenImage get avatarTest =>
      const AssetGenImage('assets/svg/avatar_test.png');

  /// File path: assets/svg/back_circle.svg
  String get backCircle => 'assets/svg/back_circle.svg';

  /// File path: assets/svg/doctor.png
  AssetGenImage get doctor => const AssetGenImage('assets/svg/doctor.png');

  /// File path: assets/svg/doctor_background.svg
  String get doctorBackground => 'assets/svg/doctor_background.svg';

  /// File path: assets/svg/ic_apple.svg
  String get icApple => 'assets/svg/ic_apple.svg';

  /// File path: assets/svg/ic_back.svg
  String get icBack => 'assets/svg/ic_back.svg';

  /// File path: assets/svg/ic_bell.svg
  String get icBell => 'assets/svg/ic_bell.svg';

  /// File path: assets/svg/ic_bell_green.svg
  String get icBellGreen => 'assets/svg/ic_bell_green.svg';

  /// File path: assets/svg/ic_copy.svg
  String get icCopy => 'assets/svg/ic_copy.svg';

  /// File path: assets/svg/ic_deal.svg
  String get icDeal => 'assets/svg/ic_deal.svg';

  /// File path: assets/svg/ic_deal_green.svg
  String get icDealGreen => 'assets/svg/ic_deal_green.svg';

  /// File path: assets/svg/ic_facebook.svg
  String get icFacebook => 'assets/svg/ic_facebook.svg';

  /// File path: assets/svg/ic_logo.svg
  String get icLogo => 'assets/svg/ic_logo.svg';

  /// File path: assets/svg/ic_logo_test.svg
  String get icLogoTest => 'assets/svg/ic_logo_test.svg';

  /// File path: assets/svg/ic_map.svg
  String get icMap => 'assets/svg/ic_map.svg';

  /// File path: assets/svg/ic_map_green.svg
  String get icMapGreen => 'assets/svg/ic_map_green.svg';

  /// File path: assets/svg/ic_personal.svg
  String get icPersonal => 'assets/svg/ic_personal.svg';

  /// File path: assets/svg/ic_personal_green.svg
  String get icPersonalGreen => 'assets/svg/ic_personal_green.svg';

  /// File path: assets/svg/ic_qr.svg
  String get icQr => 'assets/svg/ic_qr.svg';

  /// File path: assets/svg/ic_supper.svg
  String get icSupper => 'assets/svg/ic_supper.svg';

  /// List of all assets
  List<dynamic> get values => [
        avatarTest,
        backCircle,
        doctor,
        doctorBackground,
        icApple,
        icBack,
        icBell,
        icBellGreen,
        icCopy,
        icDeal,
        icDealGreen,
        icFacebook,
        icLogo,
        icLogoTest,
        icMap,
        icMapGreen,
        icPersonal,
        icPersonalGreen,
        icQr,
        icSupper
      ];
}

class $AssetsTranslationsGen {
  const $AssetsTranslationsGen();

  /// File path: assets/translations/en.json
  String get en => 'assets/translations/en.json';

  /// File path: assets/translations/pl.json
  String get pl => 'assets/translations/pl.json';

  /// List of all assets
  List<String> get values => [en, pl];
}

class Assets {
  Assets._();

  static const $AssetsIconGen icon = $AssetsIconGen();
  static const $AssetsPngGen png = $AssetsPngGen();
  static const $AssetsSvgGen svg = $AssetsSvgGen();
  static const $AssetsTranslationsGen translations = $AssetsTranslationsGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

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
