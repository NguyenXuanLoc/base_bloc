import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_network_image.dart';

class AppCircleImage extends StatelessWidget {
  final String? url;
  final String? filePath;
  final String urlError;
  final double? height;
  final double? width;

  const AppCircleImage(
      {Key? key,
      required this.url,
      required this.urlError,
      this.height,
      this.width,
      this.filePath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (filePath != null && filePath!.isNotEmpty) {
      return ClipOval(
        child: SizedBox(
          width: height ?? 46.w,
          height: width ?? 46.w,
          child: Image.file(
            File(filePath!),
            fit: BoxFit.cover,
          ),
        ),
      );
    } else if (url != null && url!.isNotEmpty) {
      return ClipOval(
        child: SizedBox(
          width: height ?? 46.w,
          height: width ?? 46.w,
          child: AppNetworkImage(source: url, errorSource: urlError,fit:BoxFit.cover,),
        ),
      );
    }
    return ClipOval(
      child: SizedBox(
        width: height ?? 46.w,
        height: width ?? 46.w,
        child: const AppNetworkImage(
          source: '',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
