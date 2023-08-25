import 'package:base_bloc/components/pin_code/builder/color_builder.dart';
import 'package:base_bloc/components/pin_code/cursor/pin_cursor.dart';
import 'package:base_bloc/components/pin_code/decoration/decoration_boxloose.dart';
import 'package:base_bloc/components/pin_code/decoration/pin_decoration.dart';
import 'package:base_bloc/components/pin_code/widget/pin_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../data/globals.dart';
import '../theme/app_styles.dart';
import '../theme/colors.dart';

class OtpTextFieldWidget extends StatelessWidget {
  final Function(String text) onChanged;
  final Function(String text) onSubmit;
  final TextEditingController controller;
  final EdgeInsetsGeometry? padding;
  final PinDecoration? pinDecoration;
  final FocusNode? focusNode;
  final double? width;
  final double? height;
  final int? pinLength;
  final double? gapSpace;
  final Cursor? cursor;

  const OtpTextFieldWidget(
      {Key? key,
      required this.onChanged,
      required this.onSubmit,
      required this.controller,
      this.focusNode,
      this.padding,
      this.pinDecoration,
      this.width,
      this.pinLength,
      this.gapSpace,
      this.height,
      this.cursor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 39.h,
      width: width ?? MediaQuery.of(context).size.width,
      padding: padding ??
          EdgeInsets.only(
              left: 30.w + contentPadding, right: 30.w + contentPadding),
      child: PinInputTextField(
        focusNode: focusNode,
        controller: controller,
        autoFocus: true,
        pinLength: pinLength ?? 4,
        decoration: pinDecoration ??
            BoxLooseDecoration(
                hintText: '    ',
                strokeWidth: 1.2,
                gapSpace: gapSpace ?? 25.w,
                strokeColorBuilder: PinListenColorBuilder(
                    Colors.black.withOpacity(0.05),
                    Colors.black.withOpacity(0.05)),
                textStyle: typoW600.copyWith()),
        //Todo
        textInputAction: TextInputAction.go,
        enabled: true,
        keyboardType: TextInputType.number,
        textCapitalization: TextCapitalization.characters,
        onSubmit: (pin) {
          onSubmit.call(pin);
        },
        onChanged: (pin) {
          onChanged.call(pin);
        },
        enableInteractiveSelection: false,
        cursor: cursor ??
            Cursor(
              width: 2,
              height: 18.h,
              color: colorBlack,
              enabled: true,
            ),
      ),
    );
  }
}
