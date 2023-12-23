import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:x_clone_app/theme/theme.dart';

import '../const/constants.dart';

class UIUtils {
  static AppBar appBar() {
    return AppBar(
      centerTitle: true,
      automaticallyImplyLeading: false,
      title: SvgPicture.asset(
        AssetsConstants.ASSETS_SVG_X_SVG,
        colorFilter:
            const ColorFilter.mode(Palette.whiteColor, BlendMode.srcIn),
        width: 50,
        height: 50,
      ),
    );
  }
}
