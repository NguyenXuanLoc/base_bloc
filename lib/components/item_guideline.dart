import 'package:base_bloc/components/app_text.dart';
import 'package:base_bloc/data/globals.dart';
import 'package:base_bloc/theme/app_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemGuideline extends StatelessWidget {
  final String title;
  final String content;

  const ItemGuideline({Key? key, required this.title, required this.content})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 30, right: 30),
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        AppText(title,
            style: typoW700.copyWith(fontSize: 20.sp),
            textAlign: TextAlign.center),
        const Spacer(),
        AppText(content,
            style: typoW600.copyWith(fontSize: 16.sp),
            textAlign: TextAlign.center)
      ]),
    );
  }
}
