import 'package:base_bloc/modules/email_register/email_register_page.dart';
import 'package:base_bloc/modules/register/register_page.dart';
import 'package:base_bloc/modules/register/register_state.dart';
import 'package:base_bloc/modules/register_container/register_container_page.dart';
import 'package:base_bloc/router/router_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterBloc extends Cubit<RegisterState> {
  RegisterBloc() : super(RegisterState());

  void buttonOnclick(ButtonType type, BuildContext context) {
    switch (type) {
      case ButtonType.EMAIL:
        RouterUtils.pushTo(context, RegisterContainerPage());
        return;
      case ButtonType.FACEBOOK:
        return;
      case ButtonType.APPLE:
        return;
      case ButtonType.ACCOUNT_EXIST:
    }
  }
}
