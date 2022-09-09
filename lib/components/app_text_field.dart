import 'package:base_bloc/theme/app_styles.dart';
import 'package:base_bloc/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextField extends StatefulWidget {
  final TextEditingController? controller;
  final String? hintText;
  final String? errorText;
  final bool? obscureText;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final int? maxLength;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool? autofocus;
  final bool? readOnly;
  final Function()? onEditingComplete;
  final Function(String)? onChanged;
  final Function()? onTap;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  final InputDecoration? decoration;
  final FocusNode? focusNode;
  final Function(String)? onSubmitted;
  final MaxLengthEnforcement? maxLengthEnforcement;
  final bool? enable;
  final double? height;
  final bool isShowErrorText;
  final int? maxLine;
  final List<TextInputFormatter>? inputFormatters;

  const AppTextField(
      {this.controller,
      this.hintText,
      this.errorText,
      this.obscureText,
      this.keyboardType,
      this.textInputAction,
      this.maxLength,
      this.prefixIcon,
      this.suffixIcon,
      this.autofocus,
      this.readOnly,
      this.onEditingComplete,
      this.onChanged,
      this.onTap,
      Key? key,
      this.textStyle,
      this.hintStyle,
      this.decoration,
      this.focusNode,
      this.onSubmitted,
      this.maxLengthEnforcement,
      this.enable,
      this.height,
      this.isShowErrorText = true,
      this.maxLine,
      this.inputFormatters})
      : super(key: key);

  @override
  _AppTextFieldState createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: 5,
      children: [
        TextField(
          inputFormatters: widget.inputFormatters,
          enabled: widget.enable,
          readOnly: widget.readOnly ?? false,
          maxLengthEnforcement: widget.maxLengthEnforcement,
          focusNode: widget.focusNode,
          controller: widget.controller,
          style: widget.textStyle?.copyWith(height: widget.height) ??
              styleTextField.copyWith(height: widget.height),
          obscureText: widget.obscureText ?? false,
          keyboardType: widget.keyboardType,
          textInputAction: widget.textInputAction,
          maxLength: widget.maxLength,
          autofocus: widget.autofocus ?? false,
          autocorrect: false,
          maxLines: widget.maxLine ??
              (widget.keyboardType == TextInputType.multiline ? 4 : 1),
          onEditingComplete: widget.onEditingComplete,
          onChanged: widget.onChanged,
          onSubmitted: (text) {
            if (widget.onSubmitted != null) widget.onSubmitted!(text);
          },
          onTap: widget.onTap,
          decoration: widget.decoration ??
              decorTextField.copyWith(
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: colorGrey20, width: 1),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: colorGrey20, width: 1),
                  ),
                  /*contentPadding: EdgeInsets.only(),*/
                  hintText: widget.hintText,
                  prefixIcon: widget.prefixIcon,
                  suffixIcon: widget.suffixIcon,
                  hintStyle: widget.hintStyle),
        ),
        Text(
            widget.isShowErrorText
                ? (widget.errorText != null &&
                        widget.errorText.toString().isNotEmpty)
                    ? widget.errorText!
                    : ' '
                : '',
            style: typoNormalTextRegular.copyWith(
                color: colorSemanticRed100, fontSize: 11.sp))
      ],
    );
  }
}
