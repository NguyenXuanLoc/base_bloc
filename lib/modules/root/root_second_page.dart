import 'package:base_bloc/router/router.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';

import '../../router/application.dart';

class RootSecondPage extends StatefulWidget {
  const RootSecondPage({Key? key}) : super(key: key);

  @override
  State<RootSecondPage> createState() => _RootSecondPageState();
}

class _RootSecondPageState extends State<RootSecondPage> {
  final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey(debugLabel: 'RootCategoryPageNavigatorState');

  @override
  void initState() {
    final router = FluroRouter();
    SecondRouters.configureSecondRouters(router);
    Application.routerTabSecond = router;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Navigator(
          key: navigatorKey,
          onGenerateRoute: Application.routerTabSecond.generator,
        ),
        onWillPop: () async {
          return !navigatorKey.currentState!.canPop();
        });
  }
}
