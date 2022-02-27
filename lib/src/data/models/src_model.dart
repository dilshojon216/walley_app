import '../../domain/entites/src.dart';

class SrcModel extends Src {
  const SrcModel(
      {required String original,
      required String large2x,
      required String large,
      required String medium,
      required String small,
      required String portrait,
      required String landscape,
      required String tiny})
      : super(
            original: original,
            large2x: large2x,
            large: large,
            medium: medium,
            small: small,
            portrait: portrait,
            landscape: landscape,
            tiny: tiny);

  factory SrcModel.fromJson(Map<String, dynamic> json) => SrcModel(
        original: json['original'],
        large2x: json['large2x'],
        large: json['large'],
        medium: json['medium'],
        small: json['small'],
        portrait: json['portrait'],
        landscape: json['landscape'],
        tiny: json['tiny'],
      );

  static Src fromSrc(SrcModel src) {
    return Src(
      original: src.original,
      large2x: src.large2x,
      large: src.large,
      medium: src.medium,
      small: src.small,
      portrait: src.portrait,
      landscape: src.landscape,
      tiny: src.tiny,
    );
  }
}
