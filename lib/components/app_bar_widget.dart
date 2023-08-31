import 'package:base_bloc/components/app_text.dart';
import 'package:base_bloc/data/globals.dart';
import 'package:base_bloc/gen/assets.gen.dart';
import 'package:base_bloc/theme/app_styles.dart';
import 'package:base_bloc/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

PreferredSizeWidget AppbarWidget(
        {required VoidCallback goBack,
        String? title,
        bool isBoldTitle = false,
        bool? isCenterTitle}) =>
    AppBar(
        leadingWidth: 30,
        backgroundColor: colorWhite,
        leading: Padding(
            padding: EdgeInsets.only(top: 18, left: contentPadding, bottom: 18),
            child: InkWell(
              child: SvgPicture.asset(Assets.svg.icBack),
              onTap: () => goBack.call()
            )),
        centerTitle: isCenterTitle,
        title: AppText(title ?? '',
            style: isBoldTitle
                ? typoW700.copyWith(fontSize: 25)
                : typoW400.copyWith(fontSize: 25)));
