import 'package:base_bloc/base/base_state.dart';
import 'package:base_bloc/router/router_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../components/app_scalford.dart';
import '../../router/router.dart';

class TabSecond extends StatefulWidget {
  const TabSecond({Key? key}) : super(key: key);

  @override
  State<TabSecond> createState() => _TabSecondState();
}

class _TabSecondState extends BaseState<TabSecond> {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        body: Center(
      child: TextButton(
        onPressed: () => RouterUtils.pushSecond(
            context: context, route: SecondRouters.test, argument: 1),
        child: Text('Tab second'),
      ),
    ));
  }
}
