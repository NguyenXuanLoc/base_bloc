import 'package:base_bloc/base/base_state.dart';
import 'package:base_bloc/base/hex_color.dart';
import 'package:base_bloc/components/app_action_slider_widget.dart';
import 'package:base_bloc/components/app_scalford.dart';
import 'package:base_bloc/components/app_text.dart';
import 'package:base_bloc/gen/assets.gen.dart';
import 'package:base_bloc/localization/locale_keys.dart';
import 'package:base_bloc/theme/app_styles.dart';
import 'package:base_bloc/utils/log_utils.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../components/app_bar_widget.dart';
import '../../components/confirm_slider_widget.dart';
import '../../theme/colors.dart';
import 'confirm_redeem_bloc.dart';

class ConfirmRedeemPage extends StatefulWidget {
  const ConfirmRedeemPage({Key? key}) : super(key: key);

  @override
  State<ConfirmRedeemPage> createState() => _ConfirmRedeemPageState();
}

class _ConfirmRedeemPageState
    extends BaseState<ConfirmRedeemPage, ConfirmRedeemCubit> {
  @override
  void init() {}

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        isPadding: false,
        appbar:
            AppbarWidget(title: LocaleKeys.answer.tr(), isCenterTitle: true, goBack: () =>Navigator.pop(
                context)),
        body: Column(
          children: [
            space(),
            AppText('Kawa gratis',
                style:
                    typoW700.copyWith(fontSize: 25, color: HexColor('004314'))),
            space(height: 5),
            AppText('w Anatolia Restaurant & Lounge',
                style:
                    typoW400.copyWith(fontSize: 20, color: HexColor('949494'))),
            const Spacer(),
            itemRequite(
                "1. ${LocaleKeys.take_a_photo_or_video_in_the_premises.tr()}"),
            space(height: 10),
            itemRequite("2. ${LocaleKeys.Mark_on_it.tr()}"),
            space(height: 10),
            itemRequite(
                "3. ${LocaleKeys.Post_to_your_story_within_24_hours.tr()}"),
            const Spacer(),
            confirmWidget(context)
          ],
        ));
  }

  Widget confirmWidget(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        padding:
            const EdgeInsets.only(top: 40, left: 20, right: 20, bottom: 20),
        decoration: BoxDecoration(
            color: colorWhite,
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(50), topLeft: Radius.circular(50)),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 0,
                  blurRadius: 7)
            ]),
        child: ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15), topRight: Radius.circular(15)),
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              AppText('23h59m',
                  style: typoW600.copyWith(
                      fontSize: 40, color: HexColor('C6C6C6'))),
              space(height: 15),
              RichText(
                  text: TextSpan(
                      text: "${LocaleKeys.By_swiping_right_you_accept.tr()} ",
                      children: [
                        WidgetSpan(
                            child: InkWell(
                                onTap: () => bloc.regulationOnclick(context),
                                child: Text(LocaleKeys.swayme_regulations.tr(),
                                    style: typoW500.copyWith(
                                        decoration: TextDecoration.underline,
                                        fontSize: 12,
                                        color: HexColor('C4C4C4')))))
                      ],
                      style: typoW500.copyWith(
                          fontSize: 12, color: HexColor('C4C4C4')))),
              space(),
              ConfirmSliderWidget(
                confirmSuccessCallback: () =>bloc.confirmOnclick(context)),
              space()
            ])));
  }

  Widget itemRequite(String title) => AppText(
        title,
        style: typoW500.copyWith(fontSize: 16, color: HexColor('949494')),
        textAlign: TextAlign.center,
      );

  Widget space({double? height}) => SizedBox(height: height ?? 20);

  @override
  ConfirmRedeemCubit createCubit() => ConfirmRedeemCubit();
}
