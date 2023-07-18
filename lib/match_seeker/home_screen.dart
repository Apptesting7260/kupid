import 'package:cupid_match/match_seeker/choose_one.dart';
import 'package:cupid_match/match_seeker/tab_screen.dart';
import 'package:cupid_match/widgets/drawer.dart';
import 'package:cupid_match/widgets/my_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:get/get.dart';
import 'package:rxdart/rxdart.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isVisible = true;
  bool isNotVisible = false;
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  final selected = BehaviorSubject<int>();
  int rewards = 0;
  int selectedRadioTile = 0;
  List<int> items = [100, 200, 300];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedRadioTile = 0;
  }

  setSelectedRadioTile(int value) {
    setState(() {
      selectedRadioTile = value;
    });
  }

  @override
  void dispose() {
    selected.close();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: MyDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Home",
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                GestureDetector(
                    onTap: () {
                      _scaffoldKey.currentState!.openEndDrawer();
                    },
                    child: Image.asset("assets/icons/menu.png"))
              ],
            ),
            SizedBox(
              height: height * .03,
            ),
            Center(
                child: GestureDetector(
                    onTap: () {
                      Get.to(() => ChooseOne());
                    },
                    child: Image.asset("assets/images/match.png"))),
            SizedBox(
              height: height * .05,
            ),
            Center(
              child: (isVisible = !isNotVisible)
                  ? Text(
                      "Find Your Matches",
                      style: Theme.of(context).textTheme.titleLarge,
                    )
                  : Text(
                      "Select Your 2 Matches",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
            ),
            SizedBox(
              height: height * .03,
            ),
            SizedBox(
              height: 300,
              child: FortuneWheel(
                  selected: selected.stream,
                  animateFirst: false,
                  onAnimationEnd: () {
                    setState(() {
                      rewards = items[selected.value];
                    });
                    print(rewards);
                  },
                  items: [
                    for (int i = 0; i < items.length; i++) ...<FortuneItem>{
                      FortuneItem(child: Text(items[i].toString()))
                    }
                  ]),
            ),
            SizedBox(
              height: height * .03,
            ),
            Visibility(
              visible: isVisible,
              child: Center(
                child: MyButton(
                  title: "Spin Now",
                  onTap: () {
                    setState(() {
                      selected.add(Fortune.randomInt(0, items.length));
                      isVisible = !isVisible;
                      isNotVisible = !isNotVisible;
                    });
                  },
                ),
              ),
            ),
            SizedBox(
              height: height * .02,
            ),
            Visibility(
              visible: isNotVisible,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Request to be matched",
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  Text(
                    "See all",
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .copyWith(color: Color(0xff000CAA)),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: height * .02,
            ),
            Visibility(
              visible: isNotVisible,
              child: Container(
                width: width * 1,
                height: height * .2,
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 2,
                  itemExtent: 80,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 30.0,
                          backgroundImage: NetworkImage(
                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR2av8pAdOHJdgpwkYC5go5OE07n8-tZzTgwg&usqp=CAU"),
                          backgroundColor: Colors.transparent,
                        ),
                        SizedBox(
                          width: width * .03,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "John Deo",
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                            SizedBox(
                              height: height * .01,
                            ),
                            Text(
                              "Match Maker",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(color: Colors.grey),
                            ),
                          ],
                        ),
                        SizedBox(width: width * .17),
                        GestureDetector(
                          onTap: () {
                            showDialog(
                              barrierDismissible: false,
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(32.0))),
                                  insetPadding: EdgeInsets.all(0),
                                  title: Column(
                                    children: [
                                      Align(
                                          alignment: Alignment.bottomRight,
                                          child: GestureDetector(
                                            onTap: () {
                                              Get.back();
                                            },
                                            child: Image.asset(
                                                "assets/icons/cancel.png"),
                                          )),
                                      Stack(
                                        children: <Widget>[
                                          Center(
                                            child: Container(
                                              height: height * .3,
                                              width: width * .3,
                                              child: CircleAvatar(
                                                radius: 30.0,
                                                backgroundImage: NetworkImage(
                                                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR2av8pAdOHJdgpwkYC5go5OE07n8-tZzTgwg&usqp=CAU"),
                                                backgroundColor:
                                                    Colors.transparent,
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                              top: 80,
                                              left: 55,
                                              right: 0,
                                              child: Image.asset(
                                                  "assets/icons/locked 1.png"))
                                        ],
                                      ),

                                      Text(
                                        "How old do you think i am",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall,
                                      ),
                                      // Column(
                                      //   children: [
                                      //     RadioListTile(
                                      //       activeColor: Color(0xffFE0091),
                                      //       value: 1,
                                      //       groupValue: selectedRadioTile,
                                      //       title: Text("20"),
                                      //       onChanged: (value) {
                                      //         print("Radio Tile pressed $value");
                                      //         setSelectedRadioTile(value!);
                                      //       },
                                      //     ),
                                      //     RadioListTile(
                                      //       activeColor: Color(0xffFE0091),
                                      //       value: 2,
                                      //       groupValue: selectedRadioTile,
                                      //       title: Text("30"),
                                      //       onChanged: (value) {
                                      //         print("Radio Tile pressed $value");
                                      //         setSelectedRadioTile(value!);
                                      //       },
                                      //     ),
                                      //     RadioListTile(
                                      //       activeColor: Color(0xffFE0091),
                                      //       value: 3,
                                      //       groupValue: selectedRadioTile,
                                      //       title: Text("40"),
                                      //       onChanged: (value) {
                                      //         print("Radio Tile pressed $value");
                                      //         setSelectedRadioTile(value!);
                                      //       },
                                      //     ),
                                      //   ],
                                      // ),
                                      SizedBox(
                                        height: height * .01,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          showDialog(
                                            barrierDismissible: false,
                                            context: context,
                                            builder: (context) {
                                              return AlertDialog(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                32.0))),
                                                insetPadding: EdgeInsets.all(0),
                                                title: Column(
                                                  children: [
                                                    Align(
                                                        alignment: Alignment
                                                            .bottomRight,
                                                        child: GestureDetector(
                                                          onTap: () {
                                                            Get.back();
                                                          },
                                                          child: Image.asset(
                                                              "assets/icons/cancel.png"),
                                                        )),
                                                    Stack(
                                                      children: <Widget>[
                                                        Center(
                                                          child: Container(
                                                            height: height * .3,
                                                            width: width * .3,
                                                            child: CircleAvatar(
                                                              radius: 30.0,
                                                              backgroundImage:
                                                                  NetworkImage(
                                                                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR2av8pAdOHJdgpwkYC5go5OE07n8-tZzTgwg&usqp=CAU"),
                                                              backgroundColor:
                                                                  Colors
                                                                      .transparent,
                                                            ),
                                                          ),
                                                        ),
                                                        Positioned(
                                                            top: 80,
                                                            left: 55,
                                                            right: 0,
                                                            child: Image.asset(
                                                                "assets/icons/unlocked 1.png"))
                                                      ],
                                                    ),
                                                    Text(
                                                      "Profile Unlocked",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .titleSmall,
                                                    ),
                                                    SizedBox(
                                                      height: height * .01,
                                                    ),
                                                    Text(
                                                      "Your answer is correct.",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodySmall!
                                                          .copyWith(
                                                              color:
                                                                  Colors.grey),
                                                    ),
                                                    SizedBox(
                                                      height: height * .02,
                                                    ),
                                                    GestureDetector(
                                                      onTap: () {
                                                        showDialog(
                                                          barrierDismissible:
                                                              false,
                                                          context: context,
                                                          builder: (context) {
                                                            return AlertDialog(
                                                              shape: RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius.all(
                                                                          Radius.circular(
                                                                              32.0))),
                                                              insetPadding:
                                                                  EdgeInsets
                                                                      .all(0),
                                                              title: Column(
                                                                children: [
                                                                  Align(
                                                                      alignment:
                                                                          Alignment
                                                                              .bottomRight,
                                                                      child:
                                                                          GestureDetector(
                                                                        onTap:
                                                                            () {
                                                                          Get.back();
                                                                        },
                                                                        child: Image.asset(
                                                                            "assets/icons/cancel.png"),
                                                                      )),
                                                                  Stack(
                                                                    children: <Widget>[
                                                                      Center(
                                                                        child:
                                                                            Container(
                                                                          height:
                                                                              height * .3,
                                                                          width:
                                                                              width * .3,
                                                                          child:
                                                                              CircleAvatar(
                                                                            radius:
                                                                                30.0,
                                                                            backgroundImage:
                                                                                NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR2av8pAdOHJdgpwkYC5go5OE07n8-tZzTgwg&usqp=CAU"),
                                                                            backgroundColor:
                                                                                Colors.transparent,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Positioned(
                                                                          top:
                                                                              80,
                                                                          left:
                                                                              50,
                                                                          right:
                                                                              0,
                                                                          child:
                                                                              Image.asset("assets/icons/locked 1.png"))
                                                                    ],
                                                                  ),
                                                                  Text(
                                                                    "Profile locked",
                                                                    style: Theme.of(
                                                                            context)
                                                                        .textTheme
                                                                        .titleSmall,
                                                                  ),
                                                                  SizedBox(
                                                                    height:
                                                                        height *
                                                                            .01,
                                                                  ),
                                                                  Text(
                                                                    "Better Luck Next Time!",
                                                                    style: Theme.of(
                                                                            context)
                                                                        .textTheme
                                                                        .bodySmall!
                                                                        .copyWith(
                                                                            color:
                                                                                Colors.grey),
                                                                  ),
                                                                  SizedBox(
                                                                    height:
                                                                        height *
                                                                            .02,
                                                                  ),
                                                                  GestureDetector(
                                                                    onTap: () {
                                                                      Get.to(() =>
                                                                          HomeScreen());
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      height:
                                                                          height *
                                                                              .04,
                                                                      width:
                                                                          width *
                                                                              .3,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: Color(
                                                                            0xffFE0091),
                                                                        borderRadius:
                                                                            BorderRadius.circular(15),
                                                                      ),
                                                                      child:
                                                                          Center(
                                                                        child:
                                                                            Text(
                                                                          "Back",
                                                                          style: Theme.of(context)
                                                                              .textTheme
                                                                              .bodySmall!
                                                                              .copyWith(color: Colors.white),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    height: MediaQuery.of(context)
                                                                            .size
                                                                            .height *
                                                                        .02,
                                                                  ),
                                                                ],
                                                              ),
                                                            );
                                                          },
                                                        );
                                                      },
                                                      child: Container(
                                                        height: height * .04,
                                                        width: width * .3,
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Color(0xffFE0091),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(15),
                                                        ),
                                                        child: Center(
                                                          child: Text(
                                                            "Message",
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .bodySmall!
                                                                .copyWith(
                                                                    color: Colors
                                                                        .white),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              .02,
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                          );
                                        },
                                        child: Container(
                                          height: height * .04,
                                          width: width * .3,
                                          decoration: BoxDecoration(
                                            color: Color(0xffFE0091),
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                          child: Center(
                                            child: Text(
                                              "Submit",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodySmall!
                                                  .copyWith(
                                                      color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                .02,
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                          child: Container(
                            height: height * .04,
                            width: width * .3,
                            decoration: BoxDecoration(
                              color: Color(0xffFE0091),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Center(
                              child: Text(
                                "Request",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(color: Colors.white),
                              ),
                            ),
                          ),
                        )
                      ],
                    );
                  },
                ),
              ),
            ),
            SizedBox(
              height: height * .02,
            ),
            Visibility(
              visible: isNotVisible,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Request to be matched",
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  Text(
                    "See all",
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .copyWith(color: Color(0xff000CAA)),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: height * .02,
            ),
            Visibility(
              visible: isNotVisible,
              child: Container(
                width: width * 1,
                height: height * .2,
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 2,
                  itemExtent: 80,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        CircleAvatar(
                          radius: 30.0,
                          backgroundImage: NetworkImage(
                              "https://img.freepik.com/free-photo/smiley-businesswoman-posing-outdoors-with-arms-crossed-copy-space_23-2148767055.jpg"),
                          backgroundColor: Colors.transparent,
                        ),
                        SizedBox(
                          width: width * .05,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Valentina, 20",
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                            SizedBox(
                              height: height * .01,
                            ),
                            Text(
                              "America",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(color: Colors.grey),
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
