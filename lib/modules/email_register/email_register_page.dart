import 'package:base_bloc/base/base_state.dart';
import 'package:base_bloc/base/hex_color.dart';
import 'package:base_bloc/components/app_button.dart';
import 'package:base_bloc/components/app_scalford.dart';
import 'package:base_bloc/components/app_text.dart';
import 'package:base_bloc/components/app_text_field.dart';
import 'package:base_bloc/components/gradient_progress_bar.dart';
import 'package:base_bloc/data/globals.dart';
import 'package:base_bloc/localization/locale_keys.dart';
import 'package:base_bloc/modules/email_register/email_register_bloc.dart';
import 'package:base_bloc/theme/app_styles.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../theme/colors.dart';

class EmailRegisterPage extends StatefulWidget {
  const EmailRegisterPage({Key? key}) : super(key: key);

  @override
  State<EmailRegisterPage> createState() => _EmailRegisterPageState();
}

class _EmailRegisterPageState
    extends BaseState<EmailRegisterPage, EmailRegisterBloc> {
  @override
  void init() {}

  @override
  Widget build(BuildContext context) {
    return AppScaffold(isTabToHideKeyboard: true,
        padding: EdgeInsets.only(left: contentPadding, right: contentPadding),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            space(),
            GradientProgressBar(
                percent: 50,
                gradient: LinearGradient(
                    colors: [HexColor('004314'), HexColor('25C869')]),
                backgroundColor: HexColor('DEDEDE')),
            space(),
            center(
              AppText("1 ${LocaleKeys.out_of.tr()} 3 ${LocaleKeys.steps.tr()}",
                  style: typoW500.copyWith(fontSize: 14.sp)),
            ),
            space(),
            AppText(LocaleKeys.Join_Swayme.tr(),
                style: typoW500.copyWith(fontSize: 24.sp)),
            space(height: 5),
            textField(hintText: LocaleKeys.your_email.tr()),
            space(height: 5),
            textField(hintText: LocaleKeys.Your_Instagram_name.tr()),
            space(height: 5),
            textField(hintText: 'DD/MM/YYYY'),
            space(height: 5),
            textField(hintText: LocaleKeys.Password.tr()),
            AppText(
                LocaleKeys
                        .We_recommend_using_a_different_password_than_your_Instagram_account
                    .tr(),
                style: typoW500.copyWith(
                    fontSize: 12.sp, color: HexColor('ADADAD'))),
            space(),
            ruleWidget(LocaleKeys.I_accept_the_terms_of_use.tr()),
            space(height: 10),
            ruleWidget(LocaleKeys
                .I_confirm_that_the_given_account_is_my_personal_account.tr()),
            const Spacer(),
            nextWidtet(),
            space()
          ],
        ));
  }

  Widget nextWidtet() => Row(
        children: [
          const Icon(Icons.arrow_back_ios),
          const Spacer(),
          AppButton(
            width: 124.w,
            onPress: () {},
            height: 53.h,
            titleWidget: AppText(LocaleKeys.next.tr(),
                style: typoW500.copyWith(fontSize: 16.sp, color: colorWhite)),
            backgroundColor: colorBlack,
            borderRadius: 10,
          ),
        ],
      );

  Widget ruleWidget(String content) => Row(
        children: [
          Container(height: 25, width: 25, color: HexColor('D9D9D9')),
          const SizedBox(width: 10),
          Expanded(
              child:
                  AppText(content, style: typoW500.copyWith(fontSize: 12.sp)))
        ],
      );

  Widget textField({String? hintText}) => AppTextField(
        hintText: hintText,
        /*decoration: InputDecoration(
          hintText: hintText,
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: colorGrey20, width: 1),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: colorGrey20, width: 1),
          ),
        ),*/
        textStyle: typoW500.copyWith(color: HexColor('8F8F8F')),
      );

  Widget center(Widget widget) => Center(child: widget);

  Widget space({double? height}) => SizedBox(height: height ?? 20);

  @override
  EmailRegisterBloc createCubit() => EmailRegisterBloc();
}
