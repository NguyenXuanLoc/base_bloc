import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GradientProgressBar extends StatelessWidget {
  ///it can be anything between 0 to 100
  final int percent;
  final LinearGradient gradient;
  final Color backgroundColor;

  const GradientProgressBar(
      {required this.percent,
      required this.gradient,
      required this.backgroundColor,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: const BorderRadius.all(Radius.circular(10))),
          child: SizedBox(height: 14.h),
        ),
        Row(
          children: [
            Flexible(
              flex: percent,
              fit: FlexFit.tight,
              child: Container(
                  decoration: BoxDecoration(
                      gradient: gradient,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10))),
                  child: SizedBox(height: 14.h)),
            ),
            Flexible(
                fit: FlexFit.tight,
                flex: 100 - percent,
                child: Container(
                    decoration: BoxDecoration(
                        color: backgroundColor,
                        borderRadius: BorderRadius.circular(10)),
                    child: SizedBox(height: 14.h)))
          ],
        ),
      ],
    );
  }
}
