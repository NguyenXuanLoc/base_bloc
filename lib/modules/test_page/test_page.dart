import 'package:base_bloc/base/base_state.dart';
import 'package:base_bloc/components/app_scalford.dart';
import 'package:base_bloc/modules/splash/splash_cubit.dart';
import 'package:base_bloc/modules/splash/splash_state.dart';
import 'package:base_bloc/router/router.dart';
import 'package:base_bloc/router/router_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TestPage extends StatefulWidget {
  final int tabIndex;

  const TestPage({Key? key, required this.tabIndex}) : super(key: key);

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends BasePopState<TestPage, SplashCubit> {
  @override
  Widget buildWidget(BuildContext context) {
    return AppScaffold(
        body: Center(
      child: TextButton(
        child: Text('TAB INDEX: ${widget.tabIndex}'),
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
