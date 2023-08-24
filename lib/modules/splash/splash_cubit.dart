import 'dart:async';

import 'package:base_bloc/modules/home_page/home_page.dart';
import 'package:base_bloc/modules/splash/splash_state.dart';
import 'package:base_bloc/router/router_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashState());

  void startAnimation() {
    Timer(const Duration(milliseconds: 500),
        () => emit(state.copyOf(isStartAnimation: true)));
  }
  void openHomePage(BuildContext context){
    RouterUtils.pushTo(context, HomePage(),isReplace: true);
  }
}
