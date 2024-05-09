import 'package:flutter/material.dart';

abstract class BaseState<T extends StatefulWidget> extends BaseSetState<T> {
  // late ProgressHUD progressHUD;

  @override
  void initState() {
    super.initState();
    /*   progressHUD = ProgressHUD(
        backgroundColor: Colors.black12,
        color: Colors.white,
        containerColor: DefaultColor.colorProgress,
        borderRadius: ScreenUtil().setWidth(20));*/
  }
}

abstract class BaseSetState<T extends StatefulWidget> extends State<T> {
  @override
  void setState(fn) {
    if (!mounted) {
      return;
    }
    super.setState(fn);
  }
}
