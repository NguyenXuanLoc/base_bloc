import 'package:base_bloc/components/app_text.dart';
import 'package:base_bloc/theme/app_styles.dart';
import 'package:base_bloc/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SuggestWidget extends StatelessWidget {
  final Set<String> listSuggestion;
  final Function(String) callBack;

  const SuggestWidget(
      {Key? key, required this.listSuggestion, required this.callBack})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10.h,
      runSpacing: 10.h,
      children: listSuggestion
          .map((e) => InkWell(
                onTap: () => callBack(e),
                child: Wrap(
                  children: [
                    AppText(
                      e.toString(),
                      style: typoSmallTextBold.copyWith(
                          color: colorWhite,
                          fontSize: 11.sp,
                          // fontWeight: FontWeight.w600,
                          decoration: TextDecoration.underline),
                    ),
                    (e == listSuggestion.elementAt(listSuggestion.length - 1))
                        ? const SizedBox()
                        : AppText("   |",
                            style: typoSmallTextRegular.copyWith(
                                color: colorGrey80, fontSize: 10.sp))
                  ],
                ),
              ))
          .toList(),
    );
  }
}
