import 'package:base_bloc/base/base_state.dart';
import 'package:base_bloc/base/hex_color.dart';
import 'package:base_bloc/components/app_button.dart';
import 'package:base_bloc/components/app_scalford.dart';
import 'package:base_bloc/components/app_text.dart';
import 'package:base_bloc/localization/locale_keys.dart';
import 'package:base_bloc/modules/notify_verify/notify_verify_bloc.dart';
import 'package:base_bloc/theme/app_styles.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';

class NotifyVerifyPage extends StatefulWidget {
  const NotifyVerifyPage({Key? key}) : super(key: key);

  @override
  State<NotifyVerifyPage> createState() => _NotifyVerifyPageState();
}

class _NotifyVerifyPageState
    extends BaseState<NotifyVerifyPage, NotifyVerifyBloc> {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(),
          AppText(
              textAlign: TextAlign.center,
              LocaleKeys.Start_using_Swayme.tr(),
              style: typoW700.copyWith(fontSize: 24)),
          space(height: 60),
          AppText(
            LocaleKeys.Account_verification_may_take_up_to_24_hour.tr(),
            style: typoW500.copyWith(fontSize: 15),
            textAlign: TextAlign.center,
          ),
          const Spacer(),
          const Spacer(),
          startWidget(),
          space()
        ],
      ),
    );
  }

  Widget startWidget() => Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: AppButton(
            onPress: () =>bloc.startOnClick(context),
            height: 46,
            borderRadius: 10,
            width: MediaQuery.of(context).size.width,
            backgroundColor: HexColor('D9D9D9'),
            textStyle: typoW500.copyWith(fontSize: 15),
            title: LocaleKeys.start.tr()),
      );

  Widget space({double? height}) => SizedBox(height: height ?? 20);

  @override
  NotifyVerifyBloc createCubit() => NotifyVerifyBloc();

  @override
  void init() {}
}
