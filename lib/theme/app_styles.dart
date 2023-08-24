import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';
final googleFont = GoogleFonts.nunito(letterSpacing: 0.3, color: colorBlack);
final typoW400 = GoogleFonts.nunito(
    letterSpacing: 0.3, color: colorBlack, fontWeight: FontWeight.w400);
final typoW500 = GoogleFonts.nunito(
    letterSpacing: 0.3, color: colorBlack, fontWeight: FontWeight.w500);
final typoW600 = GoogleFonts.nunito(
    letterSpacing: 0.3, color: colorBlack, fontWeight: FontWeight.w600);
final typoW700 = GoogleFonts.nunito(
    letterSpacing: 0.3, color: colorBlack, fontWeight: FontWeight.w700);






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



final typoNormalTextBold = GoogleFonts.roboto(
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w600,
  fontSize: 16.sp,
  letterSpacing: 0.3,
  color: colorBlack,
);


final typoNormalTextRegular = GoogleFonts.roboto(
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w400,
  fontSize: 16.sp,
  letterSpacing: 0.3,
  color: colorBlack,
);

final typoNormalTextRegularNoSpacing = GoogleFonts.roboto(
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w400,
  fontSize: 16.sp,
  color: colorBlack,
);


final typoSmallTextBold = GoogleFonts.roboto(
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w600,
  fontSize:  13.5.sp,
  letterSpacing: 0.3,
  color: colorBlack,
);

final typoSmallTextRegular = GoogleFonts.roboto(
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w400,
  fontSize:  13.5.sp,
  letterSpacing: 0.3,
  color: colorBlack,
);

