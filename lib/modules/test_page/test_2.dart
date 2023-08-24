import 'package:base_bloc/base/base_state.dart';
import 'package:base_bloc/components/app_scalford.dart';
import 'package:base_bloc/modules/splash/splash_cubit.dart';
import 'package:base_bloc/modules/splash/splash_state.dart';
import 'package:base_bloc/router/router.dart';
import 'package:base_bloc/router/router_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Test2Page extends StatefulWidget {
  final int tabIndex;

  const Test2Page({Key? key, required this.tabIndex}) : super(key: key);

  @override
  State<Test2Page> createState() => _TestPageState();
}

class _TestPageState extends BasePopState<Test2Page, SplashCubit> {
  @override
  Widget buildWidget(BuildContext context) {
    return AppScaffold(
        body: Center(
      child: TextButton(
        child: Text('TAB TEST 2: ${widget.tabIndex}'),
        onPressed: () {},
      ),
    ));
  }

  @override
  int get tabIndex => widget.tabIndex;

  @override
  SplashCubit createCubit() => SplashCubit();

  @override
  void init() {
    // TODO: implement init
  }
}
