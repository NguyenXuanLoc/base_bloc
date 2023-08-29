import 'package:base_bloc/modules/register_with_third_party/third_party_container_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../router/router_utils.dart';
import '../notify_verify/notify_verify_page.dart';
import '../register_container/register_container_cubit.dart';

class ThirdPartyContainerBloc extends Cubit<ThirdPartyContainerState> {
  var pageController = PageController();

  ThirdPartyContainerBloc() : super(const ThirdPartyContainerState());
  void nextOnclick(BuildContext context) =>
      RouterUtils.pushTo(context, const NotifyVerifyPage(), isReplace: true);
  void jumpToPage(RegisterType value, {String? email}) {
    pageController.jumpToPage(value.type);
    switch (value) {
      case RegisterType.Email:
        emit(state.copyOf(
            percentProcess: 50, currentProcess: RegisterType.Email));
        return;
      case RegisterType.ConfirmInstagram:
        emit(state.copyOf(
            percentProcess: 100,
            currentProcess: RegisterType.ConfirmInstagram));
    }
  }
}
