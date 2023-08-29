import 'dart:async';

import 'package:base_bloc/base/base_state.dart';
import 'package:base_bloc/components/app_scalford.dart';
import 'package:base_bloc/modules/splash/splash_cubit.dart';
import 'package:base_bloc/modules/splash/splash_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../components/splash_transition_widget.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends BaseState<SplashPage, SplashCubit> {
  late ScaleTransitionController _scaleController;

  @override
  void init() {
    bloc.startAnimation();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        body: Center(
            child: BlocBuilder<SplashCubit, SplashState>(
                bloc: bloc,
                builder: (c, state) => AnimatedRotation(
                    onEnd: () => _scaleController.setRotate = true,
                    turns: state.isStartAnimation ? -0.5 : 0,
                    duration: const Duration(milliseconds: 400),
                    child: Padding(
                        padding: const EdgeInsets.all(50),
                        child: ScaleTransitionWidget(
                            controller: (value) => _scaleController = value,
                            onFinish: () => bloc.openHomePage(context)))))));
  }

  @override
  SplashCubit createCubit() => SplashCubit();
}
