import 'package:base_bloc/theme/colors.dart';
import 'package:flutter/material.dart';

import '../base/hex_color.dart';

class Dialogs {
  static final GlobalKey<State> _keyLoader = GlobalKey<State>();

  static Future<void>? showLoadingDialog(BuildContext? context) {
    if (context == null) {
      return null;
    }
    return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return WillPopScope(
            onWillPop: () async => false,
            child: SimpleDialog(
              key: _keyLoader,
              backgroundColor: Colors.transparent,
              children:  <Widget>[
                Center(
                  child: CircularProgressIndicator(
                    backgroundColor: colorNeutralDark20,
                    valueColor:
                        AlwaysStoppedAnimation<Color>(HexColor('25C869')),
                  ),
                )
              ],
            ),
          );
        });
  }

  static Future<void> hideLoadingDialog() async {
    await Future.delayed(
        const Duration(milliseconds: 200),
        () => Navigator.of(_keyLoader.currentContext!, rootNavigator: true)
            .pop());
  }
}
