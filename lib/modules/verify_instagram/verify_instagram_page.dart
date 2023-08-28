import 'package:base_bloc/base/base_state.dart';
import 'package:base_bloc/base/hex_color.dart';
import 'package:base_bloc/components/app_scalford.dart';
import 'package:base_bloc/data/globals.dart';
import 'package:base_bloc/modules/verify_instagram/verify_instagram_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../components/app_button.dart';
import '../../components/app_text.dart';
import '../../gen/assets.gen.dart';
import '../../localization/locale_keys.dart';
import '../../theme/app_styles.dart';
import '../../theme/colors.dart';

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
        padding: EdgeInsets.only(left: contentPadding, right: contentPadding),
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
                    text:
                        "${LocaleKeys.Copy_and_paste_the_given_text_under_the_last_post_on_the.tr()} ",
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
                    style: typoW500.copyWith(fontSize: 14.sp))),
            space(height: 80),
            copyWidget(),
            Spacer(),
            nextWidget(),
            space()
          ],
        ));
  }

  Widget nextWidget() => Row(
        children: [
          InkWell(
              child: SvgPicture.asset(Assets.svg.icBack),
              onTap: () => Navigator.pop(context)),
          const Spacer(),
          AppButton(
              width: 124.w,
              onPress: () =>bloc.nextOnclick(),
              height: 53.h,
              titleWidget: AppText(LocaleKeys.next.tr(),
                  style: typoW500.copyWith(fontSize: 16.sp, color: colorWhite)),
              backgroundColor: colorBlack,
              borderRadius: 10)
        ],
      );

  Widget copyWidget() => Container(
      width: MediaQuery.of(context).size.width,
      height: 57.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5), color: HexColor("EBEBEB")),
      child: Row(
        children: [
          const SizedBox(width: 42),
          Expanded(
              child: Center(
                  child: Image.asset(Assets.png.icSupper.path, width: 90.w))),
          InkWell(
              child: Image.asset(Assets.png.icCopy.path, width: 42),
              onTap: () => bloc.copyOnClick(context)),
          const SizedBox(width: 10)
        ],
      ));

  Widget center(Widget widget) => Center(child: widget);

  Widget space({double? height}) => SizedBox(height: height ?? 20);

  @override
  VerifyInstagramCubit createCubit() => VerifyInstagramCubit();
}
