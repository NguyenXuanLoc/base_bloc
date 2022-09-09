import 'package:flutter/material.dart';

import '../theme/app_styles.dart';
import '../theme/colors.dart';

class AppTextButton extends StatelessWidget {
  final String? buttonTitle;
  final Color? color;
  final VoidCallback? onPressed;
  final TextStyle? textStyle;

  const AppTextButton(
      {Key? key, this.buttonTitle, this.onPressed, this.color, this.textStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(padding: MaterialStateProperty.all(EdgeInsets.zero)),
      onPressed: onPressed,
      child: Text(
        buttonTitle ?? '',
        style: textStyle ??
            typoNormalTextBold.copyWith(color: color ?? colorPrimaryBrand100),
      ),
    );
  }
}
