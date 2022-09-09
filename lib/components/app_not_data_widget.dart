import 'package:base_bloc/components/app_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../theme/app_styles.dart';

class AppNotDataWidget extends StatelessWidget {
  final String? message;

  const AppNotDataWidget({Key? key, this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AppText(
        message ?? 'Chưa có dữ liệu',
        style: typoSmallTextRegular,
      ),
    );
  }
}
