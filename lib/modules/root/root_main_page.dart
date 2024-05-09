import 'package:base_bloc/router/router.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';

import '../../router/application.dart';

class RootMainPage extends StatefulWidget {
  final GlobalKey<NavigatorState> navigatorKey;

  const RootMainPage({Key? key, required this.navigatorKey}) : super(key: key);

  @override
  State<RootMainPage> createState() => _RootMainPageState();
}

class _RootMainPageState extends State<RootMainPage> {
  @override
  void initState() {
    final router = FluroRouter();
    MainRouters.configureMainRoutes(router);
    Application.routerTabMain = router;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: widget.navigatorKey,
      onGenerateRoute: Application.routerTabMain.generator,
    );
  }
}
