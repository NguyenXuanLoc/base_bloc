library app.globals;

import 'package:flutter_screenutil/flutter_screenutil.dart';

String accessToken = '';
String refreshToken = '';
String lang = '';
String avatar = '';
String deviceId = '';
String deviceName = '';
String deviceModel = '';
String accountId = '';
String userName = '';

bool isLogin = false;
bool isTokenExpired = false;
int timePackageRemaining = 0;
int timeOut = 30;

double contentPadding = 13.w;
