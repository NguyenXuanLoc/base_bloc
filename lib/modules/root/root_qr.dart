import 'package:base_bloc/router/router.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';

import '../../router/application.dart';

class RootQr extends StatefulWidget {
  const RootQr({Key? key}) : super(key: key);

  @override
  State<RootQr> createState() => _RootQrState();
}

class _RootQrState extends State<RootQr> {
  final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey(debugLabel: 'RootCategoryPageNavigatorState');

  @override
  void initState() {
    final router = FluroRouter();
    QrRouter.configureSecondRouters(router);
    Application.routerQr = router;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Navigator(
            key: navigatorKey, onGenerateRoute: Application.routerQr.generator),
        onWillPop: () async {
          return !navigatorKey.currentState!.canPop();
        });
  }
}
