import 'package:base_bloc/modules/home_page/home_page.dart';
import 'package:base_bloc/modules/tab_main/tab_main.dart';
import 'package:base_bloc/modules/tab_second/tab_second.dart';
import 'package:base_bloc/modules/test_page/test_2.dart';
import 'package:base_bloc/modules/test_page/test_page.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';

var routeHome = Handler(handlerFunc: (c, p) => HomePage());
var routeTest = Handler(
    handlerFunc: (context, p) => TestPage(
          tabIndex: context!.settings!.arguments as int,
        ));

var routeTabMain = Handler(handlerFunc: (c, p) => TabMain());

var routeTabSecond = Handler(handlerFunc: (c, p) => TabSecond());
var routeTest2 = Handler(
    handlerFunc: (c, p) => Test2Page(tabIndex: c!.settings!.arguments as int));
