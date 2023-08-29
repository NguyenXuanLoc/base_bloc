import 'dart:async';
import 'package:base_bloc/modules/register_with_third_party/third_party_register/third_party_register_state.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../components/dialogs.dart';
import '../../../localization/locale_keys.dart';
import '../../../utils/app_utils.dart';
import '../../email_register/email_register_bloc.dart';

class ThirdPartyRegisterBloc extends Cubit<ThirdPartyRegisterState> {
  var phoneController = TextEditingController();
  var instagramNameController = TextEditingController();
  var dateControllerController = TextEditingController();
  Function(String)? registerSuccessCallback;

  ThirdPartyRegisterBloc() : super(ThirdPartyRegisterState()) {
    fakeData();
  }

  void setRegisterSuccessCallback(Function(String) registerSuccessCallback) =>
      this.registerSuccessCallback = registerSuccessCallback;

  void dateOnclick(BuildContext context) {
    Utils.pickDate(context, (p0) {
      var result = DateFormat('dd/MM/yyyy').format(p0);
      dateControllerController.text = result;
      emit(state.copyOf(dateTime: result));
    });
  }

  void ruleOnClick(RuleType type) {
    switch (type) {
      case RuleType.AcceptRule:
        emit(state.copyOf(isAcceptRule: !state.isAcceptRule));
        return;
      case RuleType.ConfirmAcc:
        emit(state.copyOf(isConfirmAcc: !state.isConfirmAccount));
        return;
    }
  }

  bool isValid(String phone, String instagramName, String dateTime) {
    var isValid = true;
    if (phone.isEmpty) {
      state.errorPhoneNumber = LocaleKeys.please_input_phone.tr();
      isValid = false;
    } else if (!Utils.validateMobile(phone)) {
      state.errorPhoneNumber = LocaleKeys.phone_is_not_valid.tr();
      isValid = false;
    } else {
      state.errorPhoneNumber = null;
    }
    if (instagramName.isEmpty) {
      state.errorInstagramName = LocaleKeys.please_input_instargram_name.tr();
      isValid = false;
    } else {
      state.errorInstagramName = null;
    }
    if (dateTime.isEmpty) {
      state.errorDate = LocaleKeys.please_input_date_time.tr();
      isValid = false;
    } else {
      state.errorDate = null;
    }
    if (!state.isAcceptRule || !state.isConfirmAccount) {
      state.errorRules = LocaleKeys.please_accept_rule.tr();
      isValid = false;
    } else {
      state.errorRules = null;
    }
    emit(state.refeshUI());
    return isValid;
  }

  void nextOnclick(BuildContext context, String phoneNumber,
      String instagramName, String dateTime) async {
    if (isValid(phoneNumber, instagramName, dateTime)) {
      Dialogs.showLoadingDialog(context);
      Timer(const Duration(seconds: 1), () async {
        await Dialogs.hideLoadingDialog();
        registerSuccessCallback?.call(phoneNumber);
      });
    }
  }

  void fakeData() {
    if (phoneController.text.isEmpty) {
      phoneController.text = '0999999999';
      instagramNameController.text = 'OOOOOOOOOO';
      dateControllerController.text = '20/10/2022';
      emit(state.copyOf(isConfirmAcc: true, isAcceptRule: true));
    }
  }
}
