import 'package:base_bloc/base/base_state.dart';
import 'package:base_bloc/components/app_scalford.dart';
import 'package:base_bloc/modules/splash/splash_cubit.dart';
import 'package:base_bloc/modules/splash/splash_state.dart';
import 'package:base_bloc/router/router.dart';
import 'package:base_bloc/router/router_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TabDeal extends StatefulWidget {
  const TabDeal({Key? key}) : super(key: key);

  @override
  State<TabDeal> createState() => _TabDealState();
}

class _TabDealState extends BaseState<TabDeal, SplashCubit>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(body: Center());
  }

  @override
  bool get wantKeepAlive => true;

  @override
  createCubit() => SplashCubit();

  @override
  void init() {
    // TODO: implement init
  }
}
