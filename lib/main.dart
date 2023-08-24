import 'dart:io';

import 'package:base_bloc/router/application.dart';
import 'package:base_bloc/router/router.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';

import 'localization/codegen_loader.g.dart';
import 'localization/locale_keys.dart';

void main() async {

  await configApp();
  runApp(
    EasyLocalization(
        assetLoader: const Applocalizations(),
        supportedLocales: Applocalizations.supportedLocales,
        path: 'assets/translations',
        child: const MyApp()),
  );
}

Future<void> configApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();
  configOrientation();
  await GetStorage.init();
  // await dotenv.load(fileName: '.env.dev');
}

void configOrientation() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  initState() {
    configRouter();
    super.initState();
  }

  void configRouter() {
    final router = FluroRouter();
    Routers.configureRoutes(router);
    Application.router = router;
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(390, 962),
        builder: (c, w) => MaterialApp(
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            debugShowCheckedModeBanner: true,
            locale: context.locale,
            theme: ThemeData(
              textTheme: GoogleFonts.mulishTextTheme(),
              backgroundColor: Colors.white,
              primaryColor: Colors.white,
              bottomAppBarColor: Colors.yellow,
              dividerColor: Colors.transparent,
              shadowColor: Colors.transparent,
              appBarTheme: const AppBarTheme(elevation: 0),
            ),
            onGenerateRoute: Application.router.generator));
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
