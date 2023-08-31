import 'package:base_bloc/base/base_state.dart';
import 'package:base_bloc/base/hex_color.dart';
import 'package:base_bloc/components/app_scalford.dart';
import 'package:base_bloc/components/app_text.dart';
import 'package:base_bloc/gen/assets.gen.dart';
import 'package:base_bloc/modules/splash/splash_cubit.dart';
import 'package:base_bloc/modules/splash/splash_state.dart';
import 'package:base_bloc/modules/tab_deal/tab_deal_bloc.dart';
import 'package:base_bloc/modules/tab_deal/tab_deal_state.dart';
import 'package:base_bloc/router/router.dart';
import 'package:base_bloc/router/router_utils.dart';
import 'package:base_bloc/theme/app_styles.dart';
import 'package:base_bloc/theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TabDeal extends StatefulWidget {
  const TabDeal({Key? key}) : super(key: key);

  @override
  State<TabDeal> createState() => _TabDealState();
}

class _TabDealState extends BaseState<TabDeal, TabDealBloc>
    with AutomaticKeepAliveClientMixin {
  @override
  void init() {}

  @override
  Widget build(BuildContext context) {
    return AppScaffold(padding: EdgeInsets.only(k),
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [locationWidget()],
    ));
  }

  Widget locationWidget() => BlocBuilder<TabDealBloc, TabDealState>(
      bloc: bloc,
      builder: (c, state) => Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  child: Image.asset(
                    Assets.png.icMapPin.path,
                    width: 28,
                  ),
                  color: colorBlack),
              AppText(
                state.location,
                style:
                    typoW700.copyWith(fontSize: 21, color: HexColor('004314')),
              )
            ],
          ));

  Widget space({double? height}) => const SizedBox(height: 20);

  @override
  bool get wantKeepAlive => true;

  @override
  createCubit() => TabDealBloc();
}
