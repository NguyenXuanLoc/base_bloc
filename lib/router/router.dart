import 'package:base_bloc/router/router_handle.dart';
import 'package:base_bloc/utils/log_utils.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';

class Routers {
  static String root = "/";
  static String test = "/test";

  static void configureRoutes(FluroRouter router) {
    router.notFoundHandler = Handler(handlerFunc:
        (BuildContext? context, Map<String, List<String>>? params) {
      logE("ROUTE WAS NOT FOUND !!!");
    });
    router.define(root, handler: routeSplash);
    router.define(test, handler: routeTest);
  }
}

class DealRouter {
  static String root = '/';
  static String test = "/test";
  static String test2 = "/test2";

  static configureMainRoutes(FluroRouter router) {
    router.notFoundHandler = Handler(handlerFunc: (c, p) {
      logE("ROUTE WAS NOT FOUND !!!");
    });
    router.define(root, handler: routeDeal);
    router.define(test, handler: routeTest);
    router.define(test2, handler: routeTest2);
  }
}

class MapRouter {
  static String root = '/';
  static String test = "/test";
  static String test2 = "/test2";

  static configureSecondRouters(FluroRouter router) {
    router.notFoundHandler = Handler(handlerFunc: (c, p) {
      logE("ROUTE WAS NOT FOUND !!!");
    });
    router.define(root, handler: routeMap);
    router.define(test, handler: routeTest);
    router.define(test2, handler: routeTest2);
  }
}

class NotifyRouter {
  static String root = '/';
  static String test = "/test";
  static String test2 = "/test2";

  static configureSecondRouters(FluroRouter router) {
    router.notFoundHandler = Handler(handlerFunc: (c, p) {
      logE("ROUTE WAS NOT FOUND !!!");
    });
    router.define(root, handler: routeNotify);
    router.define(test, handler: routeTest);
    router.define(test2, handler: routeTest2);
  }
}

class ProfileRouter {
  static String root = '/';
  static String test = "/test";
  static String test2 = "/test2";

  static configureSecondRouters(FluroRouter router) {
    router.notFoundHandler = Handler(handlerFunc: (c, p) {
      logE("ROUTE WAS NOT FOUND !!!");
    });
    router.define(root, handler: routeProfile);
    router.define(test, handler: routeTest);
    router.define(test2, handler: routeTest2);
  }
}

class QrRouter {
  static String root = '/';
  static String test = "/test";
  static String test2 = "/test2";

  static configureSecondRouters(FluroRouter router) {
    router.notFoundHandler = Handler(handlerFunc: (c, p) {
      logE("ROUTE WAS NOT FOUND !!!");
    });
    router.define(root, handler: routeQr);
    router.define(test, handler: routeTest);
    router.define(test2, handler: routeTest2);
  }
}
