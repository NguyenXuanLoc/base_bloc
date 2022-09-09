import 'package:flutter/cupertino.dart';

class NavigatorUtils {
  void pop(BuildContext context, dynamic result) =>
      Navigator.pop(context, result);

  dynamic newPage(Widget newPage, BuildContext context) async {
    return Navigator.of(context).push(PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => newPage,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.ease;
        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    ));
  }
}
