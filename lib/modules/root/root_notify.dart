import 'package:base_bloc/router/router.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';

import '../../router/application.dart';

class RootNotify extends StatefulWidget {
  const RootNotify({Key? key}) : super(key: key);

  @override
  State<RootNotify> createState() => _RootNotifyState();
}

class _RootNotifyState extends State<RootNotify> {
  final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey(debugLabel: 'RootCategoryPageNavigatorState');

  @override
  void initState() {
    final router = FluroRouter();
    NotifyRouter.configureSecondRouters(router);
    Application.routerNotify = router;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Navigator(
            key: navigatorKey,
            onGenerateRoute: Application.routerNotify.generator),
        onWillPop: () async {
          return !navigatorKey.currentState!.canPop();
        });
  }
}
