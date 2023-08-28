
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../base/hex_color.dart';
import '../theme/colors.dart';

class AppCircleLoading extends StatelessWidget {
  const AppCircleLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 24.w,
      height: 24.h,
      child:  CircularProgressIndicator(
        color: HexColor('004314'),
        strokeWidth: 2.0,
      ),
    );
  }
}
