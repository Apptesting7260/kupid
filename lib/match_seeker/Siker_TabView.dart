import 'package:cupid_match/match_maker/Create_Match/Create_Match.dart';
import 'package:cupid_match/match_maker/MakerLikes.dart';
import 'package:cupid_match/match_seeker/home_screen.dart';
import 'package:cupid_match/match_seeker/invitation.dart';
import 'package:cupid_match/match_seeker/likes_seeker.dart';
import 'package:cupid_match/match_seeker/message_screen.dart';
import 'package:cupid_match/match_seeker/profile/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'bottom_navigation.dart';

class Siker_Tab_View extends StatefulWidget {
  final int index;

  const Siker_Tab_View({Key? key, required this.index}) : super(key: key);

  @override
  _Siker_Tab_ViewState createState() => _Siker_Tab_ViewState();
}

class _Siker_Tab_ViewState extends State<Siker_Tab_View> {
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
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {
   
        },
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
              HomeScreen(),
              LikesSeeker(),
              MessageScreen(),
              ProfilePage(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Bottom(
        bottomSelectedIndex: bottomSelectedIndex!,
        bottomTapped: bottomTapped,
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
        SystemNavigator.pop();
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
