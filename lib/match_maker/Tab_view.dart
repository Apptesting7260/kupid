import 'package:cupid_match/match_maker/bottom_view.dart';
import 'package:cupid_match/match_maker/group_message.dart';
import 'package:cupid_match/match_maker/home_screen_maker.dart';
import 'package:cupid_match/match_maker/likes.dart';
import 'package:cupid_match/match_maker/profile_maker.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TabView extends StatefulWidget {
  final int index;

  const TabView({Key? key, required this.index}) : super(key: key);

  @override
  _TabViewState createState() => _TabViewState();
}

class _TabViewState extends State<TabView> {
  int? bottomSelectedIndex;
  PageController? pageController;
  DateTime currentBackPressTime = DateTime.now();
  bool loading = false;
  var data;
  final drawerKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    // fetchApi();

    // TODO: implement initState
    bottomSelectedIndex = widget.index;
    pageController = PageController(initialPage: widget.index, keepPage: true);

    super.initState();
    // studentType = MySharedPreferences.localStorage?.getString(MySharedPreferences.studentType) ?? "";
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.white,
          onPressed: () {},
          child: Icon(
            Icons.add,
            size: 30,
            color: Color(0xffFE0091),
          ),
        ),
        key: drawerKey,
        body: SafeArea(
          child: GestureDetector(
            onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
            child: PageView(
              controller: pageController,
              physics: const NeverScrollableScrollPhysics(),
              onPageChanged: (index) => pageChanged(index),
              children: [
                HomePage(),
                Likes(),
                Message(),
                ProfileTwoScreen(),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Bottom(
          bottomSelectedIndex: bottomSelectedIndex!,
          bottomTapped: bottomTapped,
        ),
      ),
    );
  }

  void bottomTapped(int index) {
    setState(
          () {
        bottomSelectedIndex = index;
        pageController!.animateToPage(index,
            duration: const Duration(microseconds: 1), curve: Curves.ease);
      },
    );
  }

  void pageChanged(int index) {
    setState(() {
      bottomSelectedIndex = index;
    });
  }

  Future<bool> _onWillPop() {
    if (bottomSelectedIndex != 1) {
      setState(
            () {
          pageController!.jumpTo(0);
        },
      );
      return Future.value(false);
    } else if (bottomSelectedIndex == 1) {
      setState(
            () {
          pageController!.jumpTo(1);
        },
      );
      return Future.value(false);
    }
    DateTime now = DateTime.now();
    if (now.difference(currentBackPressTime) > Duration(milliseconds: 500)) {
      currentBackPressTime = now;
      return Future.value(false);
    } else {
      SystemNavigator.pop();
    }
    return Future.value(true);
  }

  goAtLikeTab() {
    pageController!.animateToPage(1,
        duration: const Duration(microseconds: 1), curve: Curves.ease);
  }
}


