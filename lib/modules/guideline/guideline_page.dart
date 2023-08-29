import 'package:base_bloc/base/base_state.dart';
import 'package:base_bloc/components/app_button.dart';
import 'package:base_bloc/components/app_scalford.dart';
import 'package:base_bloc/localization/locale_keys.dart';
import 'package:base_bloc/modules/guideline/guildline_bloc.dart';
import 'package:base_bloc/modules/home_page/home_page.dart';
import 'package:base_bloc/router/router_utils.dart';
import 'package:base_bloc/theme/app_styles.dart';
import 'package:base_bloc/theme/colors.dart';
import 'package:base_bloc/utils/log_utils.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../components/item_guideline.dart';

class GuidelinePage extends StatefulWidget {
  const GuidelinePage({Key? key}) : super(key: key);

  @override
  State<GuidelinePage> createState() => _GuidelinePageState();
}

class _GuidelinePageState extends BaseState<GuidelinePage, GuidelineBloc> {
  var pageController = PageController();
  var lTitle = [
    LocaleKeys.feel_like_an_influrencer.tr(),
    LocaleKeys.find_collaborations_that.tr(),
    LocaleKeys.get_discounts_from_the_best.tr(),
    LocaleKeys.promote_your_favourite_brands_through_your_instagram.tr(),
  ];
  var lContent = [
    LocaleKeys.scan_code_in_restaurants_to_see_the_special.tr(),
    LocaleKeys.push_photos_on_your_stories.tr(),
    LocaleKeys.find_your_favourite_restaurants_and_discover.tr(),
    LocaleKeys.getting_discounts_has_never_been_so_fun.tr(),
  ];
  var currentIndex = 0;

  @override
  void init() {
    pageController.addListener(() {
      var newIndex = pageController.page!.round();
      if (currentIndex != newIndex) {
        currentIndex = newIndex;
        setState(() {});
      }
    });
  }

  void _buttonOnClick() {
    if (currentIndex != lTitle.length - 1) {
      pageController.jumpToPage(currentIndex + 1);
    } else {
      RouterUtils.pushTo(context, const HomePage(), isReplace: true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        body: Column(
      children: [
        space(height: 90 - MediaQuery.of(context).padding.top),
        Expanded(
            child: PageView(controller: pageController, children: [
          for (int i = 0; i < lTitle.length; i++)
            ItemGuideline(title: lTitle[i], content: lContent[i])
        ])),
        space(height: 90),
        SmoothPageIndicator(
            controller: pageController, // PageController
            count: 4,
            effect: const SlideEffect(
                offset: 8,
                dotColor: colorGrey40,
                activeDotColor: colorBlack,
                dotHeight: 8,
                dotWidth: 8)),
        space(height: 40),
        buttonWidget(currentIndex == lTitle.length - 1
            ? LocaleKeys.go_to_the_application.tr()
            : LocaleKeys.next.tr()),
        space()
      ],
    ));
  }

  Widget space({double? height}) => SizedBox(height: height ?? 45);

  Widget buttonWidget(String title) => AppButton(
      padding: const EdgeInsets.only(left: 40, right: 40),
      onPress: () => _buttonOnClick(),
      title: title,
      backgroundColor: colorBlack,
      borderRadius: 10,
      textStyle: typoW500.copyWith(fontSize: 14, color: colorWhite),
      height: 47);

  @override
  GuidelineBloc createCubit() => GuidelineBloc();
}
