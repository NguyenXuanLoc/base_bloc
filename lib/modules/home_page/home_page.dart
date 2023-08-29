import 'package:base_bloc/base/base_state.dart';
import 'package:base_bloc/components/app_scalford.dart';
import 'package:base_bloc/modules/home_page/home_bloc.dart';
import 'package:base_bloc/modules/home_page/home_state.dart';
import 'package:base_bloc/modules/root/root_deal.dart';
import 'package:base_bloc/modules/root/root_map.dart';
import 'package:base_bloc/modules/root/root_notify.dart';
import 'package:base_bloc/modules/root/root_profile.dart';
import 'package:base_bloc/modules/root/root_qr.dart';
import 'package:base_bloc/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../data/eventbus/switch_tab_event.dart';
import '../../gen/assets.gen.dart';
import '../../utils/app_utils.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends BaseState<HomePage, HomeBloc> {
  late PageController _pageController;
  var _currentIndex = 0;

  @override
  void init() {
    _pageController = PageController();
  }

  void _jumpToTab(int index) {
    if (index == _currentIndex) Utils.fireEvent(SwitchTabEvent(index));
    _currentIndex = index;
    _pageController.jumpToPage(_currentIndex);
    bloc.jumpToPageEvent(index);
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        body: PageView(controller: _pageController, children: const [
          RootDeal(),
          RootMap(),
          RootQr(),
          RootNotify(),
          RootProfile()
        ]),
        bottomNavigationBar: bottomNavigationWidget(context));
  }

  Widget bottomNavigationWidget(BuildContext context) {
    return Container(
        height: 63,
        decoration: BoxDecoration(
            color: colorWhite,
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(15), topLeft: Radius.circular(15)),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 0,
                  blurRadius: 7)
            ]),
        child: ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15), topRight: Radius.circular(15)),
            child: BottomAppBar(
                elevation: 0,
                color: colorWhite,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      itemBottomBar(Assets.svg.icDeal, Assets.svg.icDealGreen,
                          0, context),
                      itemBottomBar(
                          Assets.svg.icMap, Assets.svg.icMapGreen, 1, context),
                      itemBottomBar(
                          Assets.svg.icQr, Assets.svg.icQr, 2, context),
                      itemBottomBar(Assets.svg.icBell, Assets.svg.icBellGreen,
                          3, context),
                      itemBottomBar(Assets.svg.icPersonal,
                          Assets.svg.icPersonalGreen, 4, context)
                    ]))));
  }

  Widget itemBottomBar(String assetSvg, String iconChoose, int index,
          BuildContext context) =>
      BlocBuilder<HomeBloc, HomeState>(
          bloc: bloc,
          builder: (c, state) => Expanded(
              child: InkWell(
                  highlightColor: colorTransparent,
                  splashColor: colorTransparent,
                  child: SvgPicture.asset(
                      index == _currentIndex ? iconChoose : assetSvg,
                      fit: BoxFit.contain,
                      width: 26,
                      height: 26),
                  onTap: () => _jumpToTab(index))));

  @override
  HomeBloc createCubit() => HomeBloc();
}
