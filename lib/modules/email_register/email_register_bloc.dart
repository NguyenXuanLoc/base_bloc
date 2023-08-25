import 'dart:async';

import 'package:base_bloc/localization/locale_keys.dart';
import 'package:base_bloc/modules/email_register/email_register_state.dart';
import 'package:base_bloc/utils/email_validate.dart';
import 'package:base_bloc/utils/log_utils.dart';
import 'package:base_bloc/utils/toast_utils.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../components/dialogs.dart';
import '../../utils/app_utils.dart';

enum RuleType { AcceptRule, ConfirmAcc }

class EmailRegisterBloc extends Cubit<EmailRegisterState> {
  var emailController = TextEditingController();
  var instagramNameController = TextEditingController();
  var dateControllerController = TextEditingController();
  var passwordController = TextEditingController();

  EmailRegisterBloc() : super(EmailRegisterState());

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

  void nextOnclick(BuildContext context, String email, String instagramName,
      String dateTime, String pass) async {
    if (isValid(email, instagramName, dateTime, pass)) {
      Dialogs.showLoadingDialog(context);
      Timer(const Duration(seconds: 1), () async {
        await Dialogs.hideLoadingDialog();
        if (!fakeData(email, pass)) {
          toast('Password is not correct, Please try again...');
        } else {}
      });
    }
  }

  bool fakeData(String email, String pass) {
    if (email == 'locduoi1998@gmail.com' && pass == 'Test1234') {
      return true;
    }
    return false;
  }

  bool isValid(
      String email, String instagramName, String dateTime, String pass) {
    var isValid = true;
    if (email.isEmpty) {
      state.errorEmail = LocaleKeys.please_input_email.tr();
      isValid = false;
    } else if (!EmailValidator.validate(email)) {
      state.errorEmail = LocaleKeys.email_is_not_valid.tr();
      isValid = false;
    } else {
      state.errorEmail = null;
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
    if (pass.isEmpty) {
      state.errorPass = LocaleKeys.please_input_pass.tr();
      isValid = false;
    } else if (!Utils.validatePassword(pass)) {
      state.errorPass = LocaleKeys.pass_is_valid.tr();
      isValid = false;
    } else {
      state.errorPass = null;
    }
    if (!state.isAcceptRule || !state.isConfirmAccount) {
      state.errorRules = LocaleKeys.please_accept_rule.tr();
    } else {
      state.errorRules = null;
    }
    emit(state.refeshUI());
    return isValid;
  }

  void dateOnclick(BuildContext context) {
    Utils.pickDate(context, (p0) {
      var result = DateFormat('dd/MM/yyyy').format(p0);
      dateControllerController.text = result;
      emit(state.copyOf(dateTime: result));
    });
  }
}
