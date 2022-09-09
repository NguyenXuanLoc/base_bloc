import 'package:base_bloc/theme/app_styles.dart';
import 'package:flutter/cupertino.dart';

class AppText extends StatelessWidget {
  final String msg;
  final TextStyle? style;
  final TextAlign? textAlign;
  final int? maxLine;
  final TextOverflow? overflow;

  const AppText(this.msg, {Key? key, this.style, this.textAlign, this.maxLine, this.overflow})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      msg,
      style: style ?? typoNormalTextRegular,
      textScaleFactor: 1,
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLine,
    );
  }
}
