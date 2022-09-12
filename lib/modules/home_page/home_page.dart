import 'package:base_bloc/components/app_scalford.dart';
import 'package:base_bloc/modules/home_page/home_bloc.dart';
import 'package:base_bloc/modules/root/root_main_page.dart';
import 'package:base_bloc/modules/root/root_second_page.dart';
import 'package:base_bloc/utils/log_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/eventbus/switch_tab_event.dart';
import '../../utils/app_utils.dart';
import 'home_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PageController _pageController;
  var _currentIndex = 0;
  final _bloc = HomeBloc();

  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }

  void _jumpToTab(int index) {
    if (index == _currentIndex) {
      Utils.fireEvent(SwitchTabEvent(index));
    }
    _currentIndex = index;
    _pageController.jumpToPage(_currentIndex);
    _bloc.jumpToPageEvent(index);
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        body: PageView(
          controller: _pageController,
          children: [RootMainPage(), RootSecondPage()],
        ),
        bottomNavigationBar: BlocBuilder(
          bloc: _bloc,
          builder: (BuildContext context, state) => BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: (index) => _jumpToTab(index),
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.abc_outlined), label: 'Home'),
            ],
          ),
        ));
  }
}
