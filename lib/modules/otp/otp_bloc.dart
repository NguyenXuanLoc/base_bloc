import 'dart:async';

import 'package:base_bloc/components/dialogs.dart';
import 'package:base_bloc/localization/locale_keys.dart';
import 'package:base_bloc/modules/otp/otp_state.dart';
import 'package:base_bloc/utils/log_utils.dart';
import 'package:base_bloc/utils/toast_utils.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OtpBloc extends Cubit<OtpState> {
  final VoidCallback otpSuccessCallback;
  var otpController = TextEditingController();

  OtpBloc({required this.otpSuccessCallback}) : super(const OtpState()) {
    fakeData();
  }

  void otpOnclick(BuildContext context) async {
    if (!isValid()) return;
    Dialogs.showLoadingDialog(context);
    Timer(const Duration(seconds: 1), () async {
      await Dialogs.hideLoadingDialog();
      if (fakeData()) {
        otpSuccessCallback.call();
      }
    });
  }

  void resentOtpOnclick(BuildContext context) {
    Dialogs.showLoadingDialog(context);
    Timer(const Duration(seconds: 1), () async {
      await Dialogs.hideLoadingDialog();
      toast(LocaleKeys.resent_success.tr());
    });
  }

  bool fakeData() {
    if (otpController.text.isEmpty) otpController.text = '4444';

    if (otpController.text == '4444') {
      return true;
    } else {
      toast(LocaleKeys.otp_is_not_valid.tr());
      return false;
    }
  }

  bool isValid() {
    if (otpController.text.length == 4) {
      return true;
    }
    toast(LocaleKeys.otp_is_not_valid.tr());
    return false;
  }
}
