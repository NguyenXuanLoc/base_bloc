import 'package:base_bloc/base/base_state.dart';
import 'package:base_bloc/modules/register_with_third_party/third_party_register/third_party_register_bloc.dart';
import 'package:base_bloc/modules/register_with_third_party/third_party_register/third_party_register_state.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../base/hex_color.dart';
import '../../../components/app_button.dart';
import '../../../components/app_scalford.dart';
import '../../../components/app_text.dart';
import '../../../components/app_text_field.dart';
import '../../../data/globals.dart';
import '../../../gen/assets.gen.dart';
import '../../../localization/locale_keys.dart';
import '../../../theme/app_styles.dart';
import '../../../theme/colors.dart';
import '../../email_register/email_register_bloc.dart';
import '../../email_register/email_register_page.dart';

class ThirdPartyRegisterPage extends StatefulWidget {
  final VoidCallback goBack;
  final VoidCallback registerSuccessCallback;

  const ThirdPartyRegisterPage(
      {Key? key, required this.goBack, required this.registerSuccessCallback})
      : super(key: key);

  @override
  State<ThirdPartyRegisterPage> createState() => _ThirdPartyRegisterPageState();
}

class _ThirdPartyRegisterPageState
    extends BaseState<ThirdPartyRegisterPage, ThirdPartyRegisterBloc> {
  @override
  void init() {
    bloc.setRegisterSuccessCallback(
        (p0) => widget.registerSuccessCallback.call());
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        isTabToHideKeyboard: true,
        padding: EdgeInsets.only(left: contentPadding, right: contentPadding),
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          AppText(LocaleKeys.Join_Swayme.tr(),
              style: typoW500.copyWith(fontSize: 24)),
          space(height: 40),
          /*        phoneWidget(),
          space(height: 5),*/
          textField(bloc.instagramNameController, TextFieldType.InstagramName,
              hintText: LocaleKeys.Your_Instagram_name.tr()),
          /*   space(height: 5),
          textField(
              bloc.dateControllerController,
              enable: false,
              TextFieldType.DateTime,
              hintText: 'DD/MM/YYYY',
              onTap: () => bloc.dateOnclick(context)),*/
          space(height: 5),
          /*    AppText(
              LocaleKeys
                      .We_recommend_using_a_different_password_than_your_Instagram_account
                  .tr(),
              style:
                  typoW500.copyWith(fontSize: 12, color: HexColor('ADADAD'))),*/
          space(),
          ruleWidget(
              LocaleKeys.I_accept_the_terms_of_use.tr(), RuleType.AcceptRule,
              isCenter: true),
          space(height: 10),
          ruleWidget(
              LocaleKeys.I_confirm_that_the_given_account_is_my_personal_account
                  .tr(),
              RuleType.ConfirmAcc),
          BlocBuilder<ThirdPartyRegisterBloc, ThirdPartyRegisterState>(
              bloc: bloc,
              builder: (c, state) => AppText(state.errorRules ?? '',
                  style: typoW400.copyWith(
                      fontSize: 12, color: colorSemanticRed100))),
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
            width: 124,
            onPress: () => bloc.nextOnclick(
                context,
                bloc.phoneController.text,
                bloc.instagramNameController.text,
                bloc.dateControllerController.text),
            height: 47,
            titleWidget: AppText(LocaleKeys.next.tr(),
                style: typoW500.copyWith(fontSize: 16, color: colorWhite)),
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
                  height: 25,
                  width: 25,
                  color: HexColor('D9D9D9'),
                  child: BlocBuilder<ThirdPartyRegisterBloc,
                          ThirdPartyRegisterState>(
                      bloc: bloc,
                      builder: (c, state) => type == RuleType.ConfirmAcc &&
                                  state.isConfirmAccount ||
                              type == RuleType.AcceptRule && state.isAcceptRule
                          ? const Icon(Icons.check, color: colorWhite, size: 15)
                          : const SizedBox())),
            ),
            const SizedBox(width: 10),
            Expanded(
                child: AppText(content, style: typoW500.copyWith(fontSize: 12)))
          ]);

  Widget phoneWidget() => Stack(
        children: [
          textField(null, TextFieldType.Phone, colorBorder: Colors.transparent),
          Row(children: [
            Flexible(
                flex: 1,
                child: Stack(children: [
                  textField(null, TextFieldType.None),
                  Positioned(
                      top: 15,
                      left: 10,
                      child: AppText('+48',
                          style: typoW500.copyWith(color: HexColor('8F8F8F'))))
                ])),
            const SizedBox(width: 17),
            Flexible(
                flex: 5,
                child: textField(bloc.phoneController, TextFieldType.Phone,
                    isShowError: false,
                    hintText: LocaleKeys.phone_number.tr(),
                    textInputType: TextInputType.phone))
          ])
        ],
      );

  Widget textField(TextEditingController? controller, TextFieldType type,
          {String? hintText,
          bool enable = true,
          VoidCallback? onTap,
          bool? obscureText,
          TextInputType? textInputType,
          bool isShowError = true,
          InputDecoration? decoration,
          Color? colorBorder}) =>
      BlocBuilder<ThirdPartyRegisterBloc, ThirdPartyRegisterState>(
          bloc: bloc,
          builder: (c, state) => AppTextField(
              colorBorder: colorBorder,
              decoration: decoration,
              textInputType: textInputType,
              obscureText: obscureText,
              errorText: isShowError
                  ? type == TextFieldType.Phone
                      ? state.errorPhoneNumber
                      : type == TextFieldType.DateTime
                          ? state.errorDate
                          : type == TextFieldType.InstagramName
                              ? state.errorInstagramName
                              : type == TextFieldType.Pass
                                  ? state.errorPass
                                  : null
                  : null,
              readOnly: !enable,
              onTap: () => onTap?.call(),
              controller: controller,
              hintText: hintText));

  Widget center(Widget widget) => Center(child: widget);

  Widget space({double? height}) => SizedBox(height: height ?? 20);

  @override
  ThirdPartyRegisterBloc createCubit() => ThirdPartyRegisterBloc();
}
