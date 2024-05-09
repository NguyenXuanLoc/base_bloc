import 'package:base_bloc/base/base_state.dart';
import 'package:base_bloc/components/app_scalford.dart';
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

class _TestPageState extends BaseState<Test2Page> {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        body: Center(
      child: TextButton(
        child: Text('TAB TEST 2: ${widget.tabIndex}'),
        onPressed: () => RouterUtils.pushMain(
            context: context,
            route: MainRouters.test,
            argument: widget.tabIndex),
      ),
    ));
  }
}
