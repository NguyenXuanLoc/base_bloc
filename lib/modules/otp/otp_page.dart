import 'package:base_bloc/base/base_state.dart';
import 'package:base_bloc/base/hex_color.dart';
import 'package:base_bloc/components/app_scalford.dart';
import 'package:base_bloc/modules/otp/otp_bloc.dart';
import 'package:base_bloc/modules/otp/otp_state.dart';
import 'package:base_bloc/theme/colors.dart';
import 'package:base_bloc/utils/log_utils.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../components/app_button.dart';
import '../../components/app_text.dart';
import '../../components/otp_text_field_widget.dart';
import '../../components/pin_code/builder/color_builder.dart';
import '../../components/pin_code/cursor/pin_cursor.dart';
import '../../components/pin_code/decoration/decoration_boxloose.dart';
import '../../data/globals.dart';
import '../../localization/locale_keys.dart';
import '../../theme/app_styles.dart';
class OtpPage extends StatefulWidget {
  final String email;
  final VoidCallback otpCallbackSuccess;
  final VoidCallback goBack;

  const OtpPage(
      {Key? key,
      required this.otpCallbackSuccess,
      required this.goBack,
    required this.email})
      : super(key: key);

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends BaseState<OtpPage, OtpBloc> {

  @override
  void init() {
}

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        isTabToHideKeyboard: true,
        padding: EdgeInsets.only(left: contentPadding, right: contentPadding),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText(LocaleKeys.We_have_sent_the_activation_code.tr(),
                style: typoW500.copyWith(fontSize: 24)),
            space(),
            AppText("${LocaleKeys.To_the_email_address_provided.tr()}:",
                style: typoW500.copyWith(fontSize: 16)),
            space(height: 2),
            emailWidget(),
            const Spacer(),
            center(otpWidget()),
            const Spacer(),
            center(confirmWidget()),
            space(),
            textButton(LocaleKeys.send_it_again.tr(),
                () => bloc.resentOtpOnclick(context)),
            space(),
            textButton(
                LocaleKeys.change_email.tr(), () => Navigator.pop(context)),
            space(height: 27)
          ],
        ));
  }

  Widget emailWidget() => BlocBuilder<OtpBloc, OtpState>(
      bloc: bloc,
      builder: (c, state) =>
          AppText(widget.email, style: typoW700.copyWith(fontSize: 16)));

  Widget textButton(String title, VoidCallback callback) => Center(
        child: InkWell(
            child: AppText(title, style: typoW500.copyWith(fontSize: 16)),
            onTap: () => callback.call()),
      );

  Widget confirmWidget() => AppButton(
        width: 186,
        onPress: () => bloc.otpOnclick(context),
        height: 47,
        titleWidget: AppText(LocaleKeys.Confirm_the_code.tr(),
            style: typoW500.copyWith(fontSize: 16, color: colorWhite)),
        backgroundColor: colorBlack,
        borderRadius: 10,
      );

  Widget center(Widget widget) => Center(child: widget);

  Widget space({double? height}) => SizedBox(height: height ?? 20);

  Widget otpWidget() => Container(
        width: MediaQuery.of(context).size.width / 1.6,
        padding: EdgeInsets.only(left: 4.w),
        child: OtpTextFieldWidget(
          cursor: Cursor(
            width: 1,
            height: 40,
            color: HexColor('D9D9D9'),
            enabled: true,
          ),
          height: 81,
          width: 5,
          pinLength: 4,
          pinDecoration: BoxLooseDecoration(
              hintText: '    ',
              hintTextStyle: typoSmallTextRegular.copyWith(
                  color: colorText100, fontSize: 30),
              strokeWidth: 1.2,
              gapSpace: 15,
              strokeColorBuilder:
                  PinListenColorBuilder(HexColor('D9D9D9'), HexColor('D9D9D9')),
              textStyle:
                  typoW400.copyWith(fontSize: 30, color: HexColor('D9D9D9'))),
          padding: const EdgeInsets.all(0),
          onSubmit: (String text) {},
          //Todo
          onChanged: (String text) {},
          controller: bloc.otpController,
        ),
      );

  @override
  OtpBloc createCubit() =>
      OtpBloc(otpSuccessCallback: () => widget.otpCallbackSuccess.call());
}
