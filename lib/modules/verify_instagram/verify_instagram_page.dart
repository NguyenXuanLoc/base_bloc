import 'package:base_bloc/base/base_state.dart';
import 'package:base_bloc/components/app_scalford.dart';
import 'package:base_bloc/data/globals.dart';
import 'package:base_bloc/modules/verify_instagram/verify_instagram_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../components/app_text.dart';
import '../../localization/locale_keys.dart';
import '../../theme/app_styles.dart';

class VerifyInstagramPage extends StatefulWidget {
  const VerifyInstagramPage({Key? key}) : super(key: key);

  @override
  State<VerifyInstagramPage> createState() => _VerifyInstagramPageState();
}

class _VerifyInstagramPageState
    extends BaseState<VerifyInstagramPage, VerifyInstagramCubit> {
  @override
  void init() {}

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        padding: EdgeInsets.only(
            left: contentPadding + 2, right: 70),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            space(),
            AppText(LocaleKeys.Verify_your_Instagram.tr(),
                style: typoW700.copyWith(fontSize: 24.sp)),
            space(),
            RichText(
                textAlign: TextAlign.start,
                text: TextSpan(
                    text: "${LocaleKeys.Copy_and_paste_the_given_text_under_the_last_post_on_the.tr()} ",
                    children: [
                      TextSpan(
                          text: "@${LocaleKeys.appName.tr()} ",
                          style: typoW700.copyWith(fontSize: 14.sp)),
                      TextSpan(
                          style: typoW500.copyWith(fontSize: 14.sp),
                          text: LocaleKeys
                                  .Instagram_profile_from_the_previously_provided_account
                              .tr())
                    ],
                    style: typoW500.copyWith(fontSize: 14.sp)))
          ],
        ));
  }

  Widget center(Widget widget) => Center(child: widget);

  Widget space({double? height}) => SizedBox(height: height ?? 20);

  @override
  VerifyInstagramCubit createCubit() => VerifyInstagramCubit();
}
