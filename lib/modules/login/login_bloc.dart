import 'dart:async';
import 'dart:math';

import 'package:base_bloc/components/dialogs.dart';
import 'package:base_bloc/modules/home_page/home_page.dart';
import 'package:base_bloc/modules/login/login_state.dart';
import 'package:base_bloc/modules/register_container/register_container_cubit.dart';
import 'package:base_bloc/modules/register_with_third_party/third_party_container_page.dart';
import 'package:base_bloc/router/router_utils.dart';
import 'package:base_bloc/utils/app_utils.dart';
import 'package:base_bloc/utils/log_utils.dart';
import 'package:base_bloc/utils/toast_utils.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

import '../../localization/locale_keys.dart';
import '../../utils/email_validate.dart';
import '../register/register_page.dart';

class LoginBloc extends Cubit<LoginState> {
  var emailController = TextEditingController();
  var passController = TextEditingController();

  LoginBloc() : super(LoginState());

  void registerOnclick(BuildContext context) =>
      RouterUtils.pushTo(context, const RegisterPage());

  void loginOnclick(BuildContext context) {
    if (isValid()) {
      Dialogs.showLoadingDialog(context);
      Timer(const Duration(seconds: 1), () async {
        await Dialogs.hideLoadingDialog();
        if (fakeData()) {
          openHomePage(context);
        }
      });
    }
  }

  void openHomePage(BuildContext context) =>
      RouterUtils.pushTo(context, const HomePage(), isReplace: true);

  Future<void> appleOnClick(BuildContext context) async {
    Dialogs.showLoadingDialog(context);
    Timer(const Duration(seconds: 1), () async {
      await Dialogs.hideLoadingDialog();
      var isExist = Random().nextBool();
      isExist
          ? openHomePage(context)
          : RouterUtils.pushTo(context,
              const FacebookContainerPage(registerType: RegisterWith.Facebook));
    });
  }

  Future<void> facebookOnClick(BuildContext context) async {
    await FacebookAuth.instance.logOut();
    final LoginResult loginResponse = await FacebookAuth.instance.login();
    var isExistAccount = await checkExistAccount(loginResponse.accessToken);
    if (isExistAccount) {
      openHomePage(context);
    } else {
      RouterUtils.pushTo(
        context,
        FacebookContainerPage(registerType: RegisterWith.Facebook),
      );
    }
  }

  Future<bool> checkExistAccount(AccessToken? accessToken) async {
    if (accessToken != null && accessToken.token.isNotEmpty) {
      var random = Random().nextBool();
      return random;
    }
    return false;
  }

  bool fakeData() {
    var email = emailController.text;
    var pass = passController.text;
    if (email == 'test@gmail.com' && pass == 'Test1234') {
      return true;
    } else
      toast('Error email or pass');
    return false;
  }

  bool isValid() {
    var isValid = true;
    var email = emailController.text;
    var pass = passController.text;
    if (email.isEmpty) {
      state.errorEmail = LocaleKeys.please_input_email.tr();
      isValid = false;
    } else if (!EmailValidator.validate(email)) {
      state.errorEmail = LocaleKeys.email_is_not_valid.tr();
      isValid = false;
    } else {
      state.errorEmail = null;
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
    emit(state.refreshUi());
    return isValid;
  }
}
