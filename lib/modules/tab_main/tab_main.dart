import 'package:base_bloc/base/base_state.dart';
import 'package:base_bloc/components/app_scalford.dart';
import 'package:base_bloc/router/router.dart';
import 'package:base_bloc/router/router_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TabMain extends StatefulWidget {
  const TabMain({Key? key}) : super(key: key);

  @override
  State<TabMain> createState() => _TabMainState();
}

class _TabMainState extends BaseState<TabMain>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        body: Center(
      child: TextButton(
        child: Text('TEST'),
        onPressed: () => RouterUtils.pushMain(
            context: context, route: MainRouters.test, argument: 0),
      ),
    ));
  }

  @override
  bool get wantKeepAlive => true;
}
