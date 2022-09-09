import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

void toast(String? message) {
/*
  Get.snackbar(LocaleKeys.not_result.tr, message,
      backgroundColor: colorBackgroundWhite,
      animationDuration: Duration(seconds: 1),duration: Duration(seconds: 1),
      snackPosition: SnackPosition.BOTTOM);
*/
  if (message == null) return;
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.CENTER,
    timeInSecForIosWeb: 1,
    backgroundColor: Colors.white,
    textColor: Colors.black,
    fontSize: 14.sp,
  );
}
