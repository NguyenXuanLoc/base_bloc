import 'package:base_bloc/router/router.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';

import '../../router/application.dart';

class RootSecondPage extends StatefulWidget {
  final GlobalKey<NavigatorState> navigatorKey;
  const RootSecondPage({Key? key, required this.navigatorKey})
      : super(key: key);

  @override
  State<RootSecondPage> createState() => _RootSecondPageState();
}

class _RootSecondPageState extends State<RootSecondPage> {
  @override
  void initState() {
    final router = FluroRouter();
    SecondRouters.configureSecondRouters(router);
    Application.routerTabSecond = router;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
        key: widget.navigatorKey,
        onGenerateRoute: Application.routerTabSecond.generator);
  }
}
