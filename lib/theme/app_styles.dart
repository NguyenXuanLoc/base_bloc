import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'colors.dart';

final styleButtonWhite = ButtonStyle(
  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
      side: const BorderSide(color: Colors.transparent),
    ),
  ),
  backgroundColor: MaterialStateProperty.all<Color>(colorWhite),
  foregroundColor: MaterialStateProperty.resolveWith((states) {
    return states.contains(MaterialState.disabled)
        ? colorNeutralDark40
        : colorPrimaryBrand100;
  }),
  // shadowColor: MaterialStateProperty.all<Color>(colorNeutralDark20),
  overlayColor: MaterialStateProperty.resolveWith((states) {
    return states.contains(MaterialState.pressed) ? colorNeutralDark5 : null;
  }),
  padding:
      MaterialStateProperty.all<EdgeInsetsGeometry>(const EdgeInsets.all(12)),
  textStyle: MaterialStateProperty.all<TextStyle>(typoNormalTextBold),
);

final styleButtonPrimary = ButtonStyle(
  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
      side: const BorderSide(color: Colors.transparent),
    ),
  ),
  backgroundColor:
      MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
    if (states.contains(MaterialState.disabled)) {
      return colorNeutralDark10;
    }
    return colorPrimaryBrand100;
  }),
  padding:
      MaterialStateProperty.all<EdgeInsetsGeometry>(const EdgeInsets.all(12)),
  textStyle: MaterialStateProperty.all<TextStyle>(typoNormalTextBold),
);

final styleButtonOrange = ButtonStyle(
  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(24.0),
      side: const BorderSide(color: Colors.transparent),
    ),
  ),
  backgroundColor: MaterialStateProperty.all<Color>(colorPrimaryOrange100),
  foregroundColor: MaterialStateProperty.resolveWith((states) {
    return states.contains(MaterialState.disabled)
        ? colorNeutralDark40
        : colorPrimaryOrange100;
  }),
  // shadowColor: MaterialStateProperty.all<Color>(colorNeutralDark20),
  overlayColor: MaterialStateProperty.resolveWith((states) {
    return states.contains(MaterialState.pressed)
        ? colorPrimaryOrange100
        : null;
  }),
  padding:
      MaterialStateProperty.all<EdgeInsetsGeometry>(const EdgeInsets.all(12)),
  textStyle: MaterialStateProperty.all<TextStyle>(typoNormalTextBold),
);

final styleButtonWhiteBorder = ButtonStyle(
  shape: MaterialStateProperty.resolveWith((states) {
    return states.contains(MaterialState.disabled)
        ? RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
            side: const BorderSide(color: colorNeutralDark10, width: 2),
          )
        : RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
            side: const BorderSide(color: colorPrimaryBrand100, width: 2),
          );
  }),
  backgroundColor: MaterialStateProperty.all<Color>(colorWhite),
  foregroundColor: MaterialStateProperty.resolveWith((states) {
    return states.contains(MaterialState.disabled)
        ? colorNeutralDark40
        : colorPrimaryBrand100;
  }),
  // shadowColor: MaterialStateProperty.all<Color>(colorNeutralDark20),
  overlayColor: MaterialStateProperty.resolveWith((states) {
    return states.contains(MaterialState.pressed) ? colorNeutralDark5 : null;
  }),
  padding:
      MaterialStateProperty.all<EdgeInsetsGeometry>(const EdgeInsets.all(12)),
  textStyle: MaterialStateProperty.all<TextStyle>(typoNormalTextBold),
);

final styleButtonChip = ButtonStyle(
  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.0),
      side: const BorderSide(color: Colors.transparent),
    ),
  ),
  backgroundColor:
      MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
    if (states.contains(MaterialState.disabled)) {
      return colorNeutralDark10;
    }
    return colorPrimaryBrand5;
  }),
  foregroundColor: MaterialStateProperty.all<Color>(colorNeutralDark100),
  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
      const EdgeInsets.symmetric(horizontal: 12, vertical: 0)),
  textStyle: MaterialStateProperty.all<TextStyle>(typoNormalTextBold),
);

final styleButtonChipActive = ButtonStyle(
  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.0),
      side: const BorderSide(color: colorPrimaryGreen100, width: 1.0),
    ),
  ),
  backgroundColor:
      MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
    if (states.contains(MaterialState.disabled)) {
      return colorNeutralDark10;
    }
    return colorPrimaryBrand5;
  }),
  foregroundColor: MaterialStateProperty.all<Color>(colorPrimaryBrand100),
  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
      const EdgeInsets.symmetric(horizontal: 12, vertical: 0)),
  textStyle: MaterialStateProperty.all<TextStyle>(typoNormalTextBold),
);

final styleTextField =
    typoSmallTextRegular.copyWith(color: colorNeutralDark100);

final styleTextFieldBold =
    typoSmallTextBold.copyWith(color: colorNeutralDark100);

final decorTextField = InputDecoration(
  enabledBorder: const OutlineInputBorder(
    borderSide: BorderSide(color: colorGreyBorder, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(7)),
  ),
  focusedBorder: const OutlineInputBorder(
    borderSide: BorderSide(color: colorGreyBorder, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(7)),
  ),
  errorBorder: const OutlineInputBorder(
    borderSide: BorderSide(color: colorGreyBorder, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(7)),
  ),
  focusedErrorBorder: const OutlineInputBorder(
    borderSide: BorderSide(color: colorGreyBorder, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(7)),
  ),
  contentPadding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 16),
  hintStyle: typoNormalTextRegular.copyWith(
      color: colorNeutralDark40.withOpacity(0.4)),
  errorStyle: typoSmallTextRegular.copyWith(color: colorSemanticRed100),
  counterText: '',
  fillColor: Colors.white,
  filled: true,
);

final decorScreenContainerSelect = BoxDecoration(
  borderRadius: const BorderRadius.all(Radius.circular(20)),
  boxShadow: boxShadowSelectBox,
  color: colorWhite,
);

final decorScreenContainer = BoxDecoration(
  borderRadius: const BorderRadius.only(
    topRight: Radius.circular(20),
    topLeft: Radius.circular(20),
  ),
  boxShadow: boxShadow,
  color: colorWhite,
);

const decorScreenContainerNoShadow = BoxDecoration(
  borderRadius: BorderRadius.only(
    topRight: Radius.circular(20),
    topLeft: Radius.circular(20),
  ),
  color: colorWhite,
);

final decorContainerBox = BoxDecoration(
  borderRadius: const BorderRadius.all(Radius.circular(10)),
  boxShadow: boxShadow,
  color: colorWhite,
);

final boxShadow = [
  BoxShadow(
    color: colorBlack.withOpacity(0.05),
    spreadRadius: 0,
    blurRadius: 10,
    offset: const Offset(0, 0),
  ),
];

final boxShadowFocus = [
  BoxShadow(
    color: colorBlack.withOpacity(0.15),
    spreadRadius: 0,
    blurRadius: 40,
    offset: const Offset(0, 10),
  ),
];

final boxShadowSelectBox = [
  BoxShadow(
    color: colorBlack.withOpacity(0.2),
    spreadRadius: 0,
    blurRadius: 5,
    offset: const Offset(0, 4),
  ),
];

final typoHeading2 = TextStyle(
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w800,
  fontSize: 48.sp,
  letterSpacing: 0.3,
  color: colorBlack,
);

final typoHeading4 = TextStyle(
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w500,
  fontSize: 32.sp,
  letterSpacing: 0.3,
  color: colorBlack,
);

final typoHeading5 = TextStyle(
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w500,
  fontSize: 24.sp,
  letterSpacing: 0.3,
  color: colorBlack,
);

final typoHeading6 = TextStyle(
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w500,
  fontSize: 20.sp,
  letterSpacing: 0.3,
  color: colorBlack,
);

final typoSuperLargeTextBold = TextStyle(
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w500,
  fontSize: 24.sp,
  letterSpacing: 0.3,
  color: colorBlack,
);

final typoLargeTextBold = TextStyle(
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w500,
  fontSize: 20.sp,
  letterSpacing: 0.3,
  color: colorBlack,
);

final typoLargeTextRegular = TextStyle(
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w400,
  fontSize: 20.sp,
  letterSpacing: 0.3,
  color: colorBlack,
);

final typoMediumTextBold = TextStyle(
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w600,
  fontSize: 18.sp,
  letterSpacing: 0.3,
  color: colorBlack,
);

final typoMediumTextRegular = TextStyle(
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w400,
  fontSize: 18.sp,
  letterSpacing: 0.3,
  color: colorBlack,
);

final typoNormalTextBold = TextStyle(
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w600,
  fontSize: 16.sp,
  letterSpacing: 0.3,
  color: colorBlack,
);

final typoNormalTextBEBold = TextStyle(
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w500,
  fontSize: 16.sp,
  letterSpacing: 0.3,
  color: colorBlack,
);

final typoNormalTextRegular = TextStyle(
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w400,
  fontSize: 16.sp,
  letterSpacing: 0.3,
  color: colorBlack,
);

final typoNormalTextRegularNoSpacing = TextStyle(
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w400,
  fontSize: 16.sp,
  color: colorBlack,
);

final typoNormalBETextRegularNoSpacing = TextStyle(
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w100,
  fontSize: 16.sp,
  color: colorBlack,
);

final typoNormalTextThinRegular = TextStyle(
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w200,
  fontSize: 16.sp,
  color: colorBlack,
);

final typoSmallTextBold = TextStyle(
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w600,
  fontSize:  13.5.sp,
  letterSpacing: 0.3,
  color: colorBlack,
);
final typoSmallTextW700 = TextStyle(
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w700,
  fontSize:  13.5.sp,
  letterSpacing: 0.3,
  color: colorBlack,
);
final typoSmallTextRegular = TextStyle(
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w400,
  fontSize:  13.5.sp,
  letterSpacing: 0.3,
  color: colorBlack,
);

final typoSmallTextRegularNoSpacing = TextStyle(
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w400,
  fontSize: 14.sp,
  color: colorBlack,
);

final typoExtraSmallTextBold = TextStyle(
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w600,
  fontSize: 14.sp,
  letterSpacing: 0.3,
  color: colorBlack,
);

final typoExtraSmallTextRegular = TextStyle(
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w400,
  fontSize: 12.sp,
  letterSpacing: 0.3,
  color: colorBlack,
);

final typoSuperSmallTextBold = TextStyle(
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w500,
  fontSize: 13.sp,
  letterSpacing: 0.3,
  color: colorBlack,
);
final typoSuperSmallTextRegular = TextStyle(
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w400,
  fontSize: 13.sp,
  letterSpacing: 0.3,
  color: colorBlack,
);

final typoTitleHeader = TextStyle(
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w800,
  fontSize: 16.sp,
  // letterSpacing: 1.02,
  color: colorBlack,
);

final typoHintEditTextSuperSmallTextRegular = TextStyle(
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w400,
  fontSize: 12.sp,
  letterSpacing: 0.3,
  color: colorText60,
);
