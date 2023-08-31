import 'dart:math';

import 'package:base_bloc/base/base_state.dart';
import 'package:base_bloc/components/app_scalford.dart';
import 'package:base_bloc/modules/login/login_bloc.dart';
import 'package:base_bloc/modules/login/login_state.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../base/hex_color.dart';
import '../../components/app_button.dart';
import '../../components/app_text.dart';
import '../../components/app_text_field.dart';
import '../../gen/assets.gen.dart';
import '../../localization/locale_keys.dart';
import '../../theme/app_styles.dart';
import '../../theme/colors.dart';
import '../../utils/log_utils.dart';
import '../email_register/email_register_page.dart';
import '../register/register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends BaseState<LoginPage, LoginBloc> {
  @override
  void init() {}

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        isTabToHideKeyboard: true,
        padding: const EdgeInsets.only(left: 25, right: 25),
        body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          space(height: 60),
          AppText(LocaleKeys.Welcome_back.tr(),
              style: typoW700.copyWith(fontSize: 24)),
          const Spacer(),
          textField(bloc.emailController, TextFieldType.Email,
              hintText: LocaleKeys.your_email.tr()),
          textField(bloc.passController, TextFieldType.Pass,
              hintText: LocaleKeys.Password.tr()),
          space(height: 50),
          buttonWidget(LocaleKeys.Login.tr(), () => bloc.loginOnclick(context),
              backgroundColor: colorBlack,
              colorText: colorWhite,
              width: 0,
              padding: const EdgeInsets.only(left: 40, right: 40)),
          space(height: 100),
          Row(
            children: [
              Expanded(
                  child: buttonWidget(LocaleKeys.Log_in_with_Facebook.tr(),
                      () => bloc.facebookOnClick(context),
                      icon: Assets.svg.icFacebook,
                      colorText: colorWhite,
                      backgroundColor: HexColor('25C769'))),
              const SizedBox(width: 10),
              Expanded(
                  child: buttonWidget(LocaleKeys.Sign_in_with_Apple_ID.tr(),
                      () => bloc.appleOnClick(context),
                      icon: Assets.png.icApple.path)),
            ],
          ),
          const Spacer(),
          buttonWidget(LocaleKeys.Create_an_account.tr(),
              () => bloc.registerOnclick(context),
              backgroundColor: colorTransparent, width: 0),
          space()
        ]));
  }

  Widget buttonWidget(String title, VoidCallback callback,
          {String? icon,
          EdgeInsets? padding,
          double? width,
          Color? backgroundColor,
          Color? colorText,
          double? fontSize}) =>
      AppButton(
        padding: padding ?? EdgeInsets.zero,
        width: width ?? MediaQuery.of(context).size.width,
        onPress: () => callback.call(),
        height: 52,
        titleWidget: icon != null
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  icon.contains("svg")
                      ? SvgPicture.asset(icon, width: 21)
                      : Image.asset(icon, width: 21),
                  const SizedBox(width: 10),
                  AppText(title,
                      style: typoW500.copyWith(
                          fontSize: fontSize ?? 12,
                          color: colorText ?? colorText100))
                ],
              )
            : AppText(title,
                style: typoW500.copyWith(
                    fontSize: 12, color: colorText ?? colorText100)),
        backgroundColor: backgroundColor ?? HexColor('EFEFEF'),
        borderRadius: 10,
      );

  Widget space({double? height}) => SizedBox(height: height ?? 15);

  Widget textField(TextEditingController controller, TextFieldType type,
          {String? hintText,
          bool enable = true,
          VoidCallback? onTap,
          bool? obscureText}) =>
      BlocBuilder<LoginBloc, LoginState>(
          bloc: bloc,
          builder: (c, state) => AppTextField(
              obscureText: obscureText,
              errorText: type == TextFieldType.Email
                  ? state.errorEmail
                  : type == TextFieldType.Pass
                      ? state.errorPass
                      : null,
              readOnly: !enable,
              onTap: () => onTap?.call(),
              controller: controller,
              hintText: hintText));

  @override
  LoginBloc createCubit() => LoginBloc();
}
