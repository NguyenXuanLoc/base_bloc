import 'package:base_bloc/base/base_state.dart';
import 'package:base_bloc/components/app_scalford.dart';
import 'package:base_bloc/modules/register_container/register_container_cubit.dart';
import 'package:base_bloc/modules/register_with_third_party/third_party_container_bloc.dart';
import 'package:base_bloc/modules/register_with_third_party/third_party_container_state.dart';
import 'package:base_bloc/modules/register_with_third_party/third_party_register/third_party_register_page.dart';
import 'package:base_bloc/modules/verify_instagram/verify_instagram_page.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../base/hex_color.dart';
import '../../components/app_text.dart';
import '../../components/gradient_progress_bar.dart';
import '../../localization/locale_keys.dart';
import '../../theme/app_styles.dart';

enum RegisterWith { Facebook, Apple }

class FacebookContainerPage extends StatefulWidget {
  final RegisterWith registerType;

  const FacebookContainerPage({Key? key, required this.registerType})
      : super(key: key);

  @override
  State<FacebookContainerPage> createState() => _FacebookContainerPageState();
}

class _FacebookContainerPageState
    extends BaseState<FacebookContainerPage, ThirdPartyContainerBloc> {
  @override
  ThirdPartyContainerBloc createCubit() => ThirdPartyContainerBloc();

  @override
  void init() {}

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        body: Column(children: [
      space(),
      processWidget(),
      space(),
      Expanded(
          child: PageView(
        controller: bloc.pageController,
        children: [
          ThirdPartyRegisterPage(
              goBack: () => Navigator.pop(context),
              registerSuccessCallback: () =>
                  bloc.jumpToPage(RegisterType.ConfirmInstagram)),
          VerifyInstagramPage(
              verifySuccessCallback: () => bloc.nextOnclick(context),
              goBack: () => Navigator.pop(context))
        ],
      ))
    ]));
  }

  Widget processWidget() =>
      BlocBuilder<ThirdPartyContainerBloc, ThirdPartyContainerState>(
          bloc: bloc,
          builder: (c, state) =>
              Column(mainAxisSize: MainAxisSize.min, children: [
                Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: GradientProgressBar(
                        percent: state.percentProcess,
                        gradient: LinearGradient(
                            colors: [HexColor('004314'), HexColor('25C869')]),
                        backgroundColor: HexColor('DEDEDE'))),
                space(),
                center(AppText(
                    "${state.currentProcess == RegisterType.Email ? "1" : "2"} ${LocaleKeys.out_of.tr()} 2 ${LocaleKeys.steps.tr()}",
                    style: typoW500.copyWith(fontSize: 14)))
              ]));

  Widget center(Widget widget) => Center(child: widget);

  Widget space({double? height}) => SizedBox(height: height ?? 20);
}
