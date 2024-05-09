import 'package:base_bloc/components/app_scalford.dart';
import 'package:base_bloc/modules/home_page/home_bloc.dart';
import 'package:base_bloc/modules/root/root_main_page.dart';
import 'package:base_bloc/modules/root/root_second_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomConstant {
  static final BOTTOM_HOME = 0;
  static final BOTTOM_SECOND = 1;
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PageController _pageController;
  var _currentIndex = BottomConstant.BOTTOM_HOME;
  final _bloc = HomeBloc();
  final _navigatorKeys = {
    BottomConstant.BOTTOM_HOME: GlobalKey<NavigatorState>(debugLabel: "A"),
    BottomConstant.BOTTOM_SECOND: GlobalKey<NavigatorState>(debugLabel: "B")
  };

  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }

  void _jumpToTab(int index) {
    if (index == _currentIndex) {
      _navigatorKeys[_currentIndex]!.currentState!.maybePop();
    } else {
      _currentIndex = index;
      _pageController.jumpToPage(_currentIndex);
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final isFirstRouteInCurrentTab =
            !await _navigatorKeys[_currentIndex]!.currentState!.maybePop();
        if (isFirstRouteInCurrentTab) {
          _jumpToTab(_currentIndex);
          return false;
        }
        return isFirstRouteInCurrentTab;
      },
      child: AppScaffold(
          body: PageView(controller: _pageController, children: [
            RootMainPage(
                navigatorKey: _navigatorKeys[BottomConstant.BOTTOM_HOME]!),
            RootSecondPage(
                navigatorKey: _navigatorKeys[BottomConstant.BOTTOM_SECOND]!)
          ]),
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
          )),
    );
  }
}
