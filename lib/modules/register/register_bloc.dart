import 'dart:async';

import 'package:base_bloc/components/dialogs.dart';
import 'package:base_bloc/modules/login/login_page.dart';
import 'package:base_bloc/modules/register/register_page.dart';
import 'package:base_bloc/modules/register/register_state.dart';
import 'package:base_bloc/modules/register_container/register_container_page.dart';
import 'package:base_bloc/router/router_utils.dart';
import 'package:base_bloc/utils/toast_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

import '../register_with_third_party/third_party_container_page.dart';

class RegisterBloc extends Cubit<RegisterState> {
  RegisterBloc() : super(RegisterState());

  void buttonOnclick(ButtonType type, BuildContext context) {
    switch (type) {
      case ButtonType.EMAIL:
        RouterUtils.pushTo(context, const RegisterContainerPage());
        return;
      case ButtonType.FACEBOOK:
        facebookOnClick(context);
        return;
      case ButtonType.APPLE:
        appleOnClick(context);
        return;
      case ButtonType.ACCOUNT_EXIST:
        RouterUtils.pushTo(context, const LoginPage());
    }
  }

  Future<void> facebookOnClick(BuildContext context) async {
    await logoutByFacebook();
    final LoginResult loginResponse = await FacebookAuth.instance.login();
    var isExistAccount = await checkExistAccount(loginResponse.accessToken);
    if (isExistAccount)
      toast('Account is exist, please login');
    else {
      RouterUtils.pushTo(context,
          const FacebookContainerPage(registerType: RegisterWith.Facebook));
    }
  }

  Future<void> appleOnClick(BuildContext context) async {
    Dialogs.showLoadingDialog(context);
    Timer(const Duration(seconds: 1), () async {
      await Dialogs.hideLoadingDialog();
      RouterUtils.pushTo(context,
          const FacebookContainerPage(registerType: RegisterWith.Facebook));
    });
  }

  Future<bool> checkExistAccount(AccessToken? accessToken) async {
    if (accessToken != null && accessToken.token.isNotEmpty) {
      return false;
    }
    return true;
  }

  Future<void> logoutByFacebook() async {
    await FacebookAuth.instance.logOut();
  }
}
