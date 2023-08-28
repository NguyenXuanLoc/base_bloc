import 'package:base_bloc/modules/home_page/home_page.dart';
import 'package:base_bloc/modules/register_container/register_container_state.dart';
import 'package:base_bloc/router/router_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum RegisterType { Email, Otp, ConfirmInstagram }

extension RegisterTypeValue on RegisterType {
  int get type {
    switch (this) {
      case RegisterType.Email:
        return 0;
      case RegisterType.Otp:
        return 1;
      case RegisterType.ConfirmInstagram:
        return 2;
    }
  }
}

class RegisterContainerCubit extends Cubit<RegisterContainerState> {
  final pageController = PageController();

  RegisterContainerCubit() : super(const RegisterContainerState());

  void jumpToPage(RegisterType value) {
    pageController.jumpToPage(value.type);
    switch (value) {
      case RegisterType.Email:
        emit(state.copyOf(percentProcess: 30,currentProcess: RegisterType.Email));
        return;
      case RegisterType.Otp:
        emit(state.copyOf(percentProcess: 60,currentProcess: RegisterType.Otp));
        return;
      case RegisterType.ConfirmInstagram:
        emit(state.copyOf(percentProcess: 100,currentProcess: RegisterType.ConfirmInstagram));
    }
  }

  void nextOnclick(BuildContext context) =>
      RouterUtils.pushTo(context, const HomePage(), isReplace: true);
}