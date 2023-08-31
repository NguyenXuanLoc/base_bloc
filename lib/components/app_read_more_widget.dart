import 'package:base_bloc/components/read_more.dart';
import 'package:base_bloc/theme/app_styles.dart';
import 'package:base_bloc/theme/colors.dart';
import 'package:flutter/cupertino.dart';

class AppReadMoreWidget extends StatelessWidget {
  final String message;
  final TextStyle? style;

  const AppReadMoreWidget({Key? key, required this.message, this.style})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
        child: ReadMoreText(
          message,
          textScaleFactor: 1,
          trimLines: 3,
          style: style ?? typoSmallTextRegular,
          colorClickableText: colorText100,
          trimMode: TrimMode.Line,
          lessStyle: style != null
              ? style!.copyWith(
                  color: colorText100, decoration: TextDecoration.underline)
              : typoSmallTextRegular.copyWith(
                  color: colorText100, decoration: TextDecoration.underline),
          moreStyle: style != null
              ? style!.copyWith(
                  color: colorText100, decoration: TextDecoration.underline)
              : typoSmallTextRegular.copyWith(
                  color: colorText100, decoration: TextDecoration.underline),
          trimCollapsedText: '\nAn bot',
          trimExpandedText: '\nXem them',
          delimiter: '...',
        ));
  }
}
