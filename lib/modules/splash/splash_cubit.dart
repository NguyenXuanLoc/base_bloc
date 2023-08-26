import 'dart:async';

import 'package:base_bloc/modules/guideline/guideline_page.dart';
import 'package:base_bloc/modules/home_page/home_page.dart';
import 'package:base_bloc/modules/otp/otp_page.dart';
import 'package:base_bloc/modules/register/register_page.dart';
import 'package:base_bloc/modules/splash/splash_state.dart';
import 'package:base_bloc/modules/verify_instagram/verify_instagram_page.dart';
import 'package:base_bloc/router/router_utils.dart';
import 'package:base_bloc/utils/storage_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(const SplashState());

  void startAnimation() {
    Timer(const Duration(milliseconds: 500),
        () => emit(state.copyOf(isStartAnimation: true)));
  }

  void openHomePage(BuildContext context) async {
    var isGuideline = await StorageUtils.isGuideline();
    RouterUtils.pushTo(context,
        VerifyInstagramPage() /*!isGuideline ? const GuidelinePage() : const HomePage()*/,
        isReplace: true);
  }
}
