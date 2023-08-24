import 'package:base_bloc/router/router.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';

import '../../router/application.dart';

class RootProfile extends StatefulWidget {
  const RootProfile({Key? key}) : super(key: key);

  @override
  State<RootProfile> createState() => _RootProfileState();
}

class _RootProfileState extends State<RootProfile> {
  final GlobalKey<NavigatorState> navigatorKey =
  GlobalKey(debugLabel: 'RootCategoryPageNavigatorState');

  @override
  void initState() {
    final router = FluroRouter();
    ProfileRouter.configureSecondRouters(router);
    Application.routerProfile = router;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Navigator(
            key: navigatorKey,
            onGenerateRoute: Application.routerProfile.generator),
        onWillPop: () async {
          return !navigatorKey.currentState!.canPop();
        });
  }
}
