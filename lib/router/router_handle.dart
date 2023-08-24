import 'package:base_bloc/modules/home_page/home_page.dart';
import 'package:base_bloc/modules/splash/splash_page.dart';
import 'package:base_bloc/modules/tab_notify/tab_notify.dart';
import 'package:base_bloc/modules/tab_profile/tab_profile.dart';
import 'package:base_bloc/modules/test_page/test_2.dart';
import 'package:base_bloc/modules/test_page/test_page.dart';
import 'package:fluro/fluro.dart';

import '../modules/tab_deal/tab_deal.dart';
import '../modules/tab_map/tab_map.dart';
import '../modules/tab_qr/tab_qr.dart';

var routeHome = Handler(handlerFunc: (c, p) => const HomePage());
var routeSplash = Handler(handlerFunc: (c, p) => const SplashPage());
var routeTest = Handler(
    handlerFunc: (context, p) => TestPage(
          tabIndex: context!.settings!.arguments as int,
        ));

var routeDeal = Handler(handlerFunc: (c, p) => const TabDeal());
var routeMap = Handler(handlerFunc: (c, p) => const TabMap());
var routeQr = Handler(handlerFunc: (c, p) => const TabQr());
var routeNotify = Handler(handlerFunc: (c, p) => const TabNotify());
var routeProfile = Handler(handlerFunc: (c, p) => const TabProfile());
var routeTest2 = Handler(
    handlerFunc: (c, p) => Test2Page(tabIndex: c!.settings!.arguments as int));
