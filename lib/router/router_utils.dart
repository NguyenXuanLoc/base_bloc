import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';

import 'application.dart';

class RouterUtils {
  static Future<dynamic> pushTo(BuildContext context, Widget newPage,
      {bool isReplace = false}) async {
    const begin = Offset(1.0, 0.0);
    const end = Offset.zero;
    const curve = Curves.ease;
    if (isReplace) {
      return await Navigator.of(context).pushAndRemoveUntil<void>(
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) => newPage,
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              var tween =
                  Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
              return SlideTransition(
                position: animation.drive(tween),
                child: child,
              );
            },
          ),
          (Route<dynamic> route) => false);
    }
    return await Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => newPage,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          var tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        },
      ),
    );
  }

  static push<T>(
      {required BuildContext context,
      required String route,
      dynamic argument,
      bool isRemove = false}) async {
    T result = await Application.router.navigateTo(context, route,
        transition: TransitionType.inFromBottom,
        clearStack: isRemove,
        routeSettings: RouteSettings(arguments: argument));
    return result;
  }

  static pushDeal<T>(
      {required BuildContext context,
      required String route,
      dynamic argument,
      bool isRemove = false}) async {
    T result = await Application.routerDeal.navigateTo(context, route,
        transition: TransitionType.inFromRight,
        clearStack: isRemove,
        routeSettings: RouteSettings(arguments: argument));
    return result;
  }

  static pushMap<T>(
      {required BuildContext context,
      required String route,
      dynamic argument,
      bool isRemove = false}) async {
    T result = await Application.routerMap.navigateTo(context, route,
        transition: TransitionType.inFromRight,
        clearStack: isRemove,
        routeSettings: RouteSettings(arguments: argument));
    return result;
  }

  static pushQr<T>(
      {required BuildContext context,
      required String route,
      dynamic argument,
      bool isRemove = false}) async {
    T result = await Application.routerQr.navigateTo(context, route,
        transition: TransitionType.inFromRight,
        clearStack: isRemove,
        routeSettings: RouteSettings(arguments: argument));
    return result;
  }

  static pushNotify<T>(
      {required BuildContext context,
      required String route,
      dynamic argument,
      bool isRemove = false}) async {
    T result = await Application.routerNotify.navigateTo(context, route,
        transition: TransitionType.inFromRight,
        clearStack: isRemove,
        routeSettings: RouteSettings(arguments: argument));
    return result;
  }

  static pushProfile<T>(
      {required BuildContext context,
      required String route,
      dynamic argument,
      bool isRemove = false}) async {
    T result = await Application.routerProfile.navigateTo(context, route,
        transition: TransitionType.inFromRight,
        clearStack: isRemove,
        routeSettings: RouteSettings(arguments: argument));
    return result;
  }
}
