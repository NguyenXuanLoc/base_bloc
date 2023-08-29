import 'package:base_bloc/data/globals.dart';
import 'package:base_bloc/theme/colors.dart';
import 'package:base_bloc/utils/app_utils.dart';
import 'package:flutter/material.dart';

class AppScaffold extends StatelessWidget {
  final Widget body;
  final PreferredSizeWidget? appbar;
  final Color? backgroundColor;
  final EdgeInsets? padding;
  final Widget? bottomNavigationBar;
  final bool isTabToHideKeyboard;
  final bool isPadding;

  const AppScaffold(
      {Key? key,
      required this.body,
      this.appbar,
      this.isTabToHideKeyboard = false,
      this.backgroundColor,
      this.padding,
      this.bottomNavigationBar,
      this.isPadding = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var content = MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
        child: Scaffold(
            backgroundColor: backgroundColor ?? colorBackgroundColor,
            resizeToAvoidBottomInset: false,
            appBar: appbar,
            body: SafeArea(
              minimum: padding ??
                  (isPadding
                      ? EdgeInsets.only(
                          left: contentPadding, right: contentPadding)
                      : EdgeInsets.zero),
              child: SizedBox(
                  width: MediaQuery.of(context).size.width, child: body),
            ),
            bottomNavigationBar: bottomNavigationBar));
    return isTabToHideKeyboard
        ? Material(
            child: GestureDetector(
                onTap: () => Utils.hideKeyboard(context), child: content))
        : content;
  }
}
