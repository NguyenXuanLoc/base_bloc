import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../gen/assets.gen.dart';

class ScaleTransitionController {
  void Function(bool value)? _startRotate;

  ScaleTransitionController();

  set setRotate(bool value) {
    _startRotate!(value);
  }
}

class ScaleTransitionWidget extends StatefulWidget {
  final Function(ScaleTransitionController) controller;
  final VoidCallback onFinish;

  const ScaleTransitionWidget(
      {Key? key, required this.controller, required this.onFinish})
      : super(key: key);

  @override
  State<ScaleTransitionWidget> createState() => _ScaleTransitionWidgetState();
}

class _ScaleTransitionWidgetState extends State<ScaleTransitionWidget>
    with TickerProviderStateMixin {
  final _scaleController = ScaleTransitionController();
  bool isVisible = false;
  bool isScale = false;
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 5),
    vsync: this,
  )..repeat(reverse: false);
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.slowMiddle,
  );

  @override
  void initState() {
    _controller.forward();
    _scaleController._startRotate = (value) {
      isScale = true;
      _controller.reverse();
      isVisible = !isVisible;
      setState(() {});
    };
    widget.controller.call(_scaleController);
    super.initState();
  }
@override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      scale: isScale ? 5 : 1,
      duration: const Duration(milliseconds: 300),
      child: AnimatedOpacity(
        onEnd: () => widget.onFinish.call(),
        opacity: isVisible ? 0.02 : 1.0,
        duration: const Duration(milliseconds: 300),
        child: SvgPicture.asset(Assets.svg.icLogoTest, width: 100.w),
      ),
    );
  }
}
