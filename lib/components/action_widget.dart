import 'package:flutter/material.dart';

class ActionWidget extends StatelessWidget {
  final Widget widget;
  final double? scale;
  final double? scaleX;
  final double? scaleY;

  const ActionWidget(
      {Key? key, required this.widget, this.scale, this.scaleX, this.scaleY})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: scale,
      scaleY: scaleY,
      scaleX: scaleX,
      child: widget,
    );
  }
}
