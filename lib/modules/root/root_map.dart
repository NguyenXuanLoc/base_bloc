import 'package:base_bloc/router/router.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';

import '../../router/application.dart';

class RootMap extends StatefulWidget {
  const RootMap({Key? key}) : super(key: key);

  @override
  State<RootMap> createState() => _RootMapState();
}

class _RootMapState extends State<RootMap> {
  final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey(debugLabel: 'RootCategoryPageNavigatorState');

  @override
  void initState() {
    final router = FluroRouter();
    MapRouter.configureSecondRouters(router);
    Application.routerMap = router;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Navigator(
          key: navigatorKey,
          onGenerateRoute: Application.routerMap.generator,
        ),
        onWillPop: () async {
          return !navigatorKey.currentState!.canPop();
        });
  }
}
