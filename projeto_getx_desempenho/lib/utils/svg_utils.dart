import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SvgUtils {
  static SvgPicture getSvgImage(
      String path, {double? size, Color? color}) {
    return SvgPicture.asset(
      path,
      colorFilter: color != null ? ColorFilter.mode(color, BlendMode.srcIn) : null,
      height: size,
      width: size,
    );
  }
}
