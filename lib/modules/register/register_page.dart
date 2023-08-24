import 'package:base_bloc/base/base_state.dart';
import 'package:base_bloc/base/hex_color.dart';
import 'package:base_bloc/components/app_button.dart';
import 'package:base_bloc/components/app_scalford.dart';
import 'package:base_bloc/components/app_text.dart';
import 'package:base_bloc/localization/locale_keys.dart';
import 'package:base_bloc/modules/register/register_bloc.dart';
import 'package:base_bloc/theme/app_styles.dart';
import 'package:base_bloc/theme/colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../gen/assets.gen.dart';

enum ButtonType { FACEBOOK, APPLE, EMAIL, ACCOUNT_EXIST }

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends BaseState<RegisterPage, RegisterBloc> {
  @override
  RegisterBloc createCubit() => RegisterBloc();

  @override
  void init() {}

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        padding: const EdgeInsets.only(left: 15, right: 15),
        body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          space(height: 107 - MediaQuery.of(context).padding.top),
          AppText(LocaleKeys.Join_us_and_strengthen_your_influence.tr(),
              style: typoW700.copyWith(fontSize: 24.sp),
              textAlign: TextAlign.center),
          const Spacer(),
          buttonWidget(
              LocaleKeys.Register_with_Facebook.tr(), ButtonType.FACEBOOK,
              icon: Assets.svg.icFacebook,
              colorText: colorWhite,
              backgroundColor: HexColor('25C769')),
          space(),
          buttonWidget(
              LocaleKeys.Continue_with_Apple_ID.tr(), ButtonType.FACEBOOK,
              icon: Assets.png.icApple.path),
          space(),
          buttonWidget(LocaleKeys.Email_registration.tr(), ButtonType.EMAIL),
          const Spacer(),
          AppButton(
              onPress: () =>
                  bloc.buttonOnclick(ButtonType.ACCOUNT_EXIST, context),
              titleWidget: AppText(LocaleKeys.I_already_have_an_account.tr(),
                  style: typoW500.copyWith(fontSize: 15.sp))),
          space()
        ]));
  }

  Widget buttonWidget(String title, ButtonType type,
          {String? icon, Color? backgroundColor, Color? colorText}) =>
      AppButton(
        width: MediaQuery.of(context).size.width,
        onPress: () => bloc.buttonOnclick(type, context),
        height: 53.h,
        titleWidget: icon != null
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  icon.contains("svg")
                      ? SvgPicture.asset(icon, width: 23)
                      : Image.asset(icon, width: 28),
                  const SizedBox(width: 10),
                  AppText(title,
                      style: typoW500.copyWith(
                          fontSize: 16.sp, color: colorText ?? colorText100))
                ],
              )
            : AppText(title,
                style: typoW500.copyWith(
                    fontSize: 16.sp, color: colorText ?? colorText100)),
        backgroundColor: backgroundColor ?? HexColor('EFEFEF'),
        borderRadius: 10,
      );

  Widget space({double? height}) => SizedBox(height: height ?? 15);
}
