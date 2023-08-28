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
import 'package:base_bloc/utils/log_utils.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../components/dialogs.dart';
import '../../gen/assets.gen.dart';
import '../../theme/colors.dart';
import 'email_register_state.dart';

enum TextFieldType { Email, InstagramName, DateTime, Pass }

class EmailRegisterPage extends StatefulWidget {
  final VoidCallback registerSuccessCallback;
  final VoidCallback goBack;

  const EmailRegisterPage(
      {Key? key, required this.registerSuccessCallback, required this.goBack})
      : super(key: key);

  @override
  State<EmailRegisterPage> createState() => _EmailRegisterPageState();
}

class _EmailRegisterPageState
    extends BaseState<EmailRegisterPage, EmailRegisterBloc> {
  @override
  void init() {}

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        isTabToHideKeyboard: true,
        padding: EdgeInsets.only(left: contentPadding, right: contentPadding),
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          space(),
          AppText(LocaleKeys.Join_Swayme.tr(),
              style: typoW500.copyWith(fontSize: 24.sp)),
          space(height: 5),
          textField(bloc.emailController, TextFieldType.Email,
              hintText: LocaleKeys.your_email.tr()),
          space(height: 5),
          textField(bloc.instagramNameController, TextFieldType.InstagramName,
              hintText: LocaleKeys.Your_Instagram_name.tr()),
          space(height: 5),
          textField(
              bloc.dateControllerController,
              enable: false,
              TextFieldType.DateTime,
              hintText: 'DD/MM/YYYY',
              onTap: () => bloc.dateOnclick(context)),
          space(height: 5),
          textField(
            bloc.passwordController,
            TextFieldType.Pass,
            hintText: LocaleKeys.Password.tr(),
            obscureText: true,
          ),
          AppText(
              LocaleKeys
                      .We_recommend_using_a_different_password_than_your_Instagram_account
                  .tr(),
              style: typoW500.copyWith(
                  fontSize: 12.sp, color: HexColor('ADADAD'))),
          space(),
          ruleWidget(
              LocaleKeys.I_accept_the_terms_of_use.tr(), RuleType.AcceptRule,
              isCenter: true),
          space(height: 10),
          ruleWidget(
              LocaleKeys.I_confirm_that_the_given_account_is_my_personal_account
                  .tr(),
              RuleType.ConfirmAcc),
          BlocBuilder<EmailRegisterBloc, EmailRegisterState>(
              bloc: bloc,
              builder: (c, state) => AppText(state.errorRules ?? '',
                  style: typoW400.copyWith(
                      fontSize: 12.sp, color: colorSemanticRed100))),
          const Spacer(),
          nextWidget(),
          space()
        ]));
  }

  Widget nextWidget() => Row(
        children: [
          InkWell(
              child: SvgPicture.asset(Assets.svg.icBack),
              onTap: () => widget.goBack.call()),
          const Spacer(),
          AppButton(
            width: 124.w,
            onPress: () => bloc.nextOnclick(
                context,
                bloc.emailController.text,
                bloc.instagramNameController.text,
                bloc.dateControllerController.text,
                bloc.passwordController.text),
            height: 53.h,
            titleWidget: AppText(LocaleKeys.next.tr(),
                style: typoW500.copyWith(fontSize: 16.sp, color: colorWhite)),
            backgroundColor: colorBlack,
            borderRadius: 10,
          ),
        ],
      );

  Widget ruleWidget(String content, RuleType type, {bool isCenter = false}) =>
      Row(
          crossAxisAlignment:
              isCenter ? CrossAxisAlignment.center : CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () => bloc.ruleOnClick(type),
              child: Container(
                  height: 25.h,
                  width: 25.h,
                  color: HexColor('D9D9D9'),
                  child: BlocBuilder<EmailRegisterBloc, EmailRegisterState>(
                      bloc: bloc,
                      builder: (c, state) => type == RuleType.ConfirmAcc &&
                                  state.isConfirmAccount ||
                              type == RuleType.AcceptRule && state.isAcceptRule
                          ? const Icon(
                              Icons.check,
                              color: colorWhite,
                              size: 15,
                            )
                          : const SizedBox())),
            ),
            const SizedBox(width: 10),
            Expanded(
                child:
                    AppText(content, style: typoW500.copyWith(fontSize: 12.sp)))
          ]);

  Widget textField(TextEditingController controller, TextFieldType type,
          {String? hintText,
          bool enable = true,
          VoidCallback? onTap,
          bool? obscureText}) =>
      BlocBuilder<EmailRegisterBloc, EmailRegisterState>(
          bloc: bloc,
          builder: (c, state) => AppTextField(
                obscureText: obscureText,
                errorText: type == TextFieldType.Email
                    ? state.errorEmail
                    : type == TextFieldType.DateTime
                        ? state.errorDate
                        : type == TextFieldType.InstagramName
                            ? state.errorInstagramName
                            : type == TextFieldType.Pass
                                ? state.errorPass
                                : null,
                readOnly: !enable,
                onTap: () => onTap?.call(),
                controller: controller,
                hintText: hintText,
                textStyle: typoW500.copyWith(color: HexColor('8F8F8F')),
              ));

  Widget center(Widget widget) => Center(child: widget);

  Widget space({double? height}) => SizedBox(height: height ?? 20);

  @override
  EmailRegisterBloc createCubit() => EmailRegisterBloc(
      registerSuccessCallback: () => widget.registerSuccessCallback.call());
}
