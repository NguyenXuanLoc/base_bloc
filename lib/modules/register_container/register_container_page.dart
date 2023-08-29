import 'package:base_bloc/base/base_state.dart';
import 'package:base_bloc/components/app_scalford.dart';
import 'package:base_bloc/data/globals.dart';
import 'package:base_bloc/modules/email_register/email_register_page.dart';
import 'package:base_bloc/modules/otp/otp_page.dart';
import 'package:base_bloc/modules/register_container/register_container_cubit.dart';
import 'package:base_bloc/modules/register_container/register_container_state.dart';
import 'package:base_bloc/modules/verify_instagram/verify_instagram_page.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../base/hex_color.dart';
import '../../components/app_text.dart';
import '../../components/gradient_progress_bar.dart';
import '../../localization/locale_keys.dart';
import '../../theme/app_styles.dart';

class RegisterContainerPage extends StatefulWidget {
  const RegisterContainerPage({Key? key}) : super(key: key);

  @override
  State<RegisterContainerPage> createState() => _RegisterContainerPageState();
}

class _RegisterContainerPageState
    extends BaseState<RegisterContainerPage, RegisterContainerCubit> {
  @override
  void init() {}

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        padding: EdgeInsets.only(left: contentPadding, right: contentPadding),
        body: Column(
          children: [
            space(),
            processWidget(),
            space(),
            Expanded(
                child: PageView(
                    // physics: const NeverScrollableScrollPhysics(),
                    controller: bloc.pageController,
                    children: [
                  EmailRegisterPage(
                      registerSuccessCallback: (email) =>
                          bloc.jumpToPage(RegisterType.Otp, email: email),
                      goBack: () => Navigator.pop(context)),
                  otpWidget(),
                  VerifyInstagramPage(
                      verifySuccessCallback: () => bloc.nextOnclick(context),
                      goBack: () => bloc.jumpToPage(RegisterType.Email))
                ]))
          ],
        ));
  }

  Widget
      otpWidget() =>
          BlocBuilder<RegisterContainerCubit, RegisterContainerState>(
              bloc: bloc,
              builder:
                  (c, state) =>
                      OtpPage(
                          otpCallbackSuccess: () =>
                              bloc.jumpToPage(RegisterType.ConfirmInstagram),
                          goBack: () => bloc.jumpToPage(RegisterType.Email),
                          email: state.email ?? ''));

  Widget center(Widget widget) => Center(child: widget);

  Widget processWidget() =>
      BlocBuilder<RegisterContainerCubit, RegisterContainerState>(
          bloc: bloc,
          builder: (c, state) =>
              Column(mainAxisSize: MainAxisSize.min, children: [
                GradientProgressBar(
                    percent: state.percentProcess,
                    gradient: LinearGradient(
                        colors: [HexColor('004314'), HexColor('25C869')]),
                    backgroundColor: HexColor('DEDEDE')),
                space(),
                center(AppText(
                    "${state.currentProcess.type + 1} ${LocaleKeys.out_of.tr()} 3 ${LocaleKeys.steps.tr()}",
                    style: typoW500.copyWith(fontSize: 14)))
              ]));

  Widget space({double? height}) => SizedBox(height: height ?? 20);

  @override
  RegisterContainerCubit createCubit() => RegisterContainerCubit();
}
