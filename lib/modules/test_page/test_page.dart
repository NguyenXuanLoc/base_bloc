import 'package:base_bloc/base/base_state.dart';
import 'package:base_bloc/components/app_scalford.dart';
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

class _TestPageState extends BaseState<TestPage> {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        body: Center(
      child: TextButton(
        child: Text('TAB INDEX: ${widget.tabIndex}'),
        onPressed: () => RouterUtils.pushMain(
            context: context,
            route: MainRouters.test2,
            argument: widget.tabIndex),
      ),
    ));
  }
}
