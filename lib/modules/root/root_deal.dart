import 'package:base_bloc/router/router.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';

import '../../router/application.dart';

class RootDeal extends StatefulWidget {
  const RootDeal({Key? key}) : super(key: key);

  @override
  State<RootDeal> createState() => _RootDealState();
}

class _RootDealState extends State<RootDeal> {
  final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey(debugLabel: 'RootCategoryPageNavigatorState');

  @override
  void initState() {
    final router = FluroRouter();
    DealRouter.configureMainRoutes(router);
    Application.routerDeal = router;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Navigator(
          key: navigatorKey,
          onGenerateRoute: Application.routerDeal.generator,
        ),
        onWillPop: () async {
          return !navigatorKey.currentState!.canPop();
        });
  }
}
