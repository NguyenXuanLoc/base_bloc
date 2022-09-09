
/*
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

typedef IndexedWidgetBuilder = Widget Function(BuildContext context, int index);

class MyListView extends StatelessWidget {
  final IndexedWidgetBuilder itemBuilder;
  final int axisCount;
  final ScrollController? controller;
  final int itemCount;
  final Axis scrollDirection;
  final bool shrinkWrap;
  final bool? primary;

  const MyListView({
    Key? key,
    required this.itemBuilder,
    required this.itemCount,
    this.axisCount = 1,
    this.controller,
    this.scrollDirection = Axis.vertical,
    this.shrinkWrap = false,
    this.primary,
  }) : super(key: key);

  /// If the [primary] argument is true, the [controller] must be null.
  @override
  Widget build(BuildContext context) {
    return MasonryGridView.count(
      primary: primary,
      shrinkWrap: shrinkWrap,
      scrollDirection: scrollDirection,
      mainAxisSpacing: 2.w,
      crossAxisSpacing: 2.w,
      itemCount: itemCount,
      controller: controller,
      itemBuilder: (BuildContext context, int index) {
        return itemBuilder(context, index);
      },
      crossAxisCount: axisCount,
    );
  }
}
*/