import 'package:base_bloc/base/base_state.dart';
import 'package:base_bloc/modules/splash/splash_cubit.dart';
import 'package:base_bloc/modules/splash/splash_state.dart';
import 'package:base_bloc/router/router_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../components/app_scalford.dart';
import '../../router/router.dart';

class TabMap extends StatefulWidget {
  const TabMap({Key? key}) : super(key: key);

  @override
  State<TabMap> createState() => _TabMapState();
}

class _TabMapState extends BaseState<TabMap, SplashCubit> {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        body: Center(
      child: TextButton(
        onPressed: () {},
        child: Text('Tab second'),
      ),
    ));
  }

  @override
  SplashCubit createCubit() => SplashCubit();

  @override
  void init() {
    // TODO: implement init
  }
}
