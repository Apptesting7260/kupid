import 'package:cupid_match/match_maker/chat_screen.dart';
import 'package:cupid_match/match_maker/invite_state.dart';
import 'package:cupid_match/match_maker/new_matches.dart';
import 'package:cupid_match/match_maker/payment_info.dart';
import 'package:cupid_match/match_maker/pending_matches.dart';
import 'package:cupid_match/match_maker/premium.dart';
import 'package:cupid_match/match_maker/profile_maker.dart';
import 'package:cupid_match/match_maker/recent_conversations.dart';
import 'package:cupid_match/match_maker/recent_matches.dart';
import 'package:cupid_match/match_maker/request_matches.dart';
import 'package:cupid_match/match_maker/subscriptions.dart';
import 'package:cupid_match/utils/app_colors.dart';
import 'package:cupid_match/widgets/my_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'dart:math' as math;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Align(
            alignment: Alignment.topLeft,
            child: Text(
              "Home",
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),
          actions: [
            Builder(
              builder: (context) {
                return GestureDetector(
                    onTap: () {
                      Scaffold.of(context).openEndDrawer();
                      MaterialLocalizations.of(context).openAppDrawerTooltip;
                    },
                    child: Image.asset("assets/icons/menu.png"));
              },
            )
          ],
        ),
        endDrawer: Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(color: Color(0xffF3F3F3)),
                child: Column(
                  children: [
                    Align(
                        alignment: Alignment.topRight,
                        child: GestureDetector(
                            onTap: () {
                              Get.back();
                            },
                            child: Image.asset(
                              'assets/maker/Group 115 (1).png',
                              height: 25,
                            ))),
                    ListTile(
                      leading: CircleAvatar(
                        radius: 30.0,
                        backgroundImage: NetworkImage(
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR2av8pAdOHJdgpwkYC5go5OE07n8-tZzTgwg&usqp=CAU"),
                        backgroundColor: Colors.transparent,
                      ),

                      title: Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Text(
                          "Name jon deo, 22",
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall
                              ?.copyWith(
                                  fontSize: 14, fontWeight: FontWeight.w600),
                        ),
                      ),

                      subtitle: Padding(
                        padding: const EdgeInsets.only(right: 70, left: 0),
                        child: GestureDetector(
                          onTap: () {
                            Get.to(() => ProfileTwoScreen());
                          },
                          child: Container(
                            width: 30,
                            height: height * .03,
                            decoration: BoxDecoration(
                                color: Color(0xffF3F3F3),
                                borderRadius: BorderRadius.circular(22),
                                border: Border.all(
                                    color: Color(0xff000CAA), width: 2)),
                            child: Center(
                                child: Text(
                              "View Profile",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall
                                  ?.copyWith(
                                      fontSize: 10, color: Color(0xff000CAA)),
                            )),
                          ),
                        ),
                      ),
                      // subtitle: OutlinedButton(
                      //   style: OutlinedButton.styleFrom(
                      //     shape: RoundedRectangleBorder(
                      //       borderRadius: BorderRadius.circular(27),
                      //     ),
                      //     side: BorderSide(color: Color(0xff000CAA), width: 2),
                      //   fixedSize: Size(30, 40)
                      //   ),
                      //   onPressed: () {},
                      //   child: Text(
                      //     "View Profile",
                      //     style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Color(0xff000CAA),fontWeight: FontWeight.w700),
                      //   ),
                      // ),
                    )
                  ],
                ),
              ),
              ListTile(
                onTap: () {
                  Get.back();
                },
                leading: Image.asset(
                  'assets/maker/Mask group (1).png',
                  width: 25,
                ),
                title: Text(
                  'Home',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
              Divider(
                height: 10,
                color: Color(0xffBABABA),
                thickness: .1,
                endIndent: 20,
                indent: 25,
              ),
              ListTile(
                onTap: () {
                  Get.to(() => CreateNewMatchesScreen());
                },
                leading: Image.asset(
                  'assets/maker/Mask group (2).png',
                  width: 25,
                ),
                title: Text(
                  'Create New Matches',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
              Divider(
                height: 10,
                color: Color(0xffBABABA),
                thickness: .1,
                endIndent: 20,
                indent: 25,
              ),
              ListTile(
                onTap: () {
                  Get.to(() => ChooseSubscriptions());
                },
                leading: Image.asset(
                  'assets/maker/Mask group (3).png',
                  width: 25,
                ),
                title: Text(
                  'Create Subsciption',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
              Divider(
                height: 10,
                color: Color(0xffBABABA),
                thickness: .1,
                endIndent: 20,
                indent: 25,
              ),
              ListTile(
                onTap: () {
                  Get.to(() => PaymentInfo());
                },
                leading: Image.asset(
                  'assets/maker/Mask group (4).png',
                  width: 25,
                ),
                title: Text(
                  'Payment Info',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
              Divider(
                height: 10,
                color: Color(0xffBABABA),
                thickness: .1,
                endIndent: 20,
                indent: 25,
              ),
              ListTile(
                onTap: () {
                  Get.to(() => PremiumTab());
                },
                leading: Image.asset(
                  'assets/maker/Mask group (5).png',
                  width: 25,
                ),
                title: Text(
                  'Premium & Free Seekers',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
              Divider(
                height: 10,
                color: Color(0xffBABABA),
                thickness: .1,
                endIndent: 20,
                indent: 25,
              ),
              ListTile(
                onTap: () {
                  Get.to(() => PendingMatches());
                },
                leading: Image.asset(
                  'assets/maker/Mask group (6).png',
                  width: 25,
                ),
                title: Text(
                  'Pending Matches',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
              Divider(
                height: 10,
                color: Color(0xffBABABA),
                thickness: .1,
                endIndent: 20,
                indent: 25,
              ),
              ListTile(
                onTap: () {
                  Get.to(() => Invite());
                },
                leading: Image.asset(
                  'assets/maker/Mask group (8).png',
                  width: 25,
                ),
                title: Text(
                  'Refer Friend',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
              Divider(
                height: 10,
                color: Color(0xffBABABA),
                thickness: .1,
                endIndent: 20,
                indent: 25,
              ),
              ListTile(
                onTap: () {
                  Get.to(()=>ProfileTwoScreen());
                },
                leading: Image.asset(
                  'assets/maker/Mask group (7).png',
                  width: 25,
                ),
                title: Text(
                  'Update Profile',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
              Divider(
                height: 10,
                color: Color(0xffBABABA),
                thickness: .1,
                endIndent: 20,
                indent: 25,
              ),
              ListTile(
                leading: Image.asset(
                  'assets/maker/Mask group (10).png',
                  width: 25,
                ),
                title: Text(
                  'Update Additional Info',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
              SizedBox(
                height: height * .2,
              ),
              Center(
                child: MyButton(
                  width: width * .5,
                  title: 'Log Out',
                  onTap: () {},
                ),
              ),
              SizedBox(
                height: height * .1,
              ),
            ],
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: width * 0.05, vertical: height * 0.02),
          child: SingleChildScrollView(
            child: Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                      alignment: Alignment.center,
                      child: GestureDetector(
                          onTap: () {
                            Get.to(CreateNewMatchesScreen());
                          },
                          child: Image.asset('assets/maker/Mask_group.png'))),
                  SizedBox(
                    height: height * 0.04,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            "Recent Matches",
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          Column(
                            children: [
                              Text("But no conversation",
                                  style: Theme.of(context).textTheme.bodyLarge)
                            ],
                          )
                        ],
                      ),
                      TextButton(
                          onPressed: () {
                            Get.to(RecentMatches());
                          },
                          style: TextButton.styleFrom(),
                          child: Text(
                            'ViewAll',
                            style: Theme.of(context).textTheme.bodySmall,
                          )),
                    ],
                  ),
                  // Align(
                  //   alignment: Alignment.centerLeft,
                  //   child: Text(
                  //     "But no conversation",
                  //     style: Theme.of(context)
                  //         .textTheme
                  //         .bodySmall
                  //         ?.copyWith(
                  //             color: AppColors.black, fontSize: 13),
                  //   ),
                  // ),
                  SizedBox(
                    height: height * .02,
                  ),

                  Container(
                    width: width,
                    height: height * .45,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      physics: AlwaysScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 20,
                      itemBuilder: (context, index) {
                        return Container(
                          width: width * .45,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Stack(
                                  children: [
                                    Container(
                                      height: height * 0.32,
                                      width: width * 0.43,
                                      decoration: BoxDecoration(
                                          color: AppColors.ratingcodeColor,
                                          borderRadius:
                                              BorderRadius.circular(18)),
                                    ),
                                    Transform.rotate(
                                      angle: (math.pi / 390) * 11,
                                      origin: Offset(-190.0, 760.0),
                                      child: Container(
                                        height: height * .2,
                                        width: width * .2,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(22),
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                  'https://images.unsplash.com/photo-1685464670063-2cbac395fc24?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw5M3x8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=500&q=60'),
                                              fit: BoxFit.cover),
                                        ),
                                      ),
                                    ),
                                    Transform.rotate(
                                      angle: (math.pi / 850) * -40,
                                      origin: Offset(520.0, -80.0),
                                      child: Container(
                                        height: height * .2,
                                        width: width * .2,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                  'https://plus.unsplash.com/premium_photo-1664547606960-008623079291?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw3fHx8ZW58MHx8fHx8&auto=format&fit=crop&w=500&q=60'),
                                              fit: BoxFit.cover),
                                          borderRadius:
                                              BorderRadius.circular(22),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 10,
                                      left: 10,
                                      child: CircleAvatar(
                                        radius: 20,
                                        child: CircleAvatar(
                                          radius: 50,
                                          backgroundColor: AppColors.white,
                                          child: Icon(Icons.heart_broken),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 60,
                                      top: 6,
                                      child: CircleAvatar(
                                        radius: 20,
                                        child: CircleAvatar(
                                          radius: 50,
                                          backgroundColor: AppColors.white,
                                          child: Icon(Icons.heart_broken),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: height * .01,
                                ),
                                Text(
                                  "It’s a match, Jake!",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall
                                      ?.copyWith(color: AppColors.red),
                                  maxLines: 1,
                                ),
                                SizedBox(
                                  height: height * .01,
                                ),
                                Text(
                                  "Start a conversation now with each other",
                                  style: Theme.of(context).textTheme.labelSmall,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Recent Conversations",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      TextButton(
                          onPressed: () {
                            Get.to(RecentConversations());
                          },
                          child: Text(
                            'ViewAll',
                            style: Theme.of(context).textTheme.bodySmall,
                          )),
                    ],
                  ),

                  SizedBox(
                    height: height * 0.02,
                  ),

                  Container(
                    width: width,
                    height: height * .12,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      physics: AlwaysScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 2,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                              decoration: BoxDecoration(
                                  color: AppColors.ratingcodeColor,
                                  borderRadius: BorderRadius.circular(15)),
                              width: width * .65,
                              // height: 50,
                              child: ListTile(
                                leading: Container(
                                  width: width * .08,
                                  height: height * 0.05,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount:
                                        images.length >= 3 ? 3 : images.length,
                                    shrinkWrap: true,
                                    reverse: true,
                                    itemBuilder: (context, index) {
                                      return Align(
                                        alignment: Alignment.centerRight,
                                        widthFactor: 0.3,
                                        child: CircleAvatar(
                                          radius: 18,
                                          backgroundColor: AppColors.white,
                                          child: CircleAvatar(
                                            radius: 16,
                                            backgroundImage:
                                                NetworkImage(images[index]),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                title: Text(
                                  "Name",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(color: AppColors.black),
                                ),
                                subtitle: Text(
                                  "25/05/2022",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(
                                          fontSize: 10, color: AppColors.black),
                                ),
                                trailing: GestureDetector(
                                    onTap: () => Get.to(() => ChatScreen()),
                                    child: Image.asset(
                                      "assets/maker/Group 221.png",
                                      width: width * 0.09,
                                    )),
                              )),
                        );
                      },
                    ),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Request Matches",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      TextButton(
                          onPressed: () {
                            Get.to(RequestMatches());
                          },
                          child: Text(
                            'View All',
                            style: Theme.of(context).textTheme.bodySmall,
                          )),
                    ],
                  ),

                  SizedBox(
                    height: height * 0.02,
                  ),

                  Container(
                    width: width,
                    height: height * .12,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      physics: AlwaysScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 2,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                              decoration: BoxDecoration(
                                  color: AppColors.ratingcodeColor,
                                  borderRadius: BorderRadius.circular(15)),
                              width: width * .65,
                              height: 50,
                              child: ListTile(
                                leading: CircleAvatar(
                                    radius: 18,
                                    backgroundColor: AppColors.white,
                                    backgroundImage: NetworkImage(
                                      "https://www.seiu1000.org/sites/main/files/main-images/camera_lense_0.jpeg",
                                    )),
                                title: Text(
                                  "Name",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(color: AppColors.black),
                                ),
                                subtitle: Text(
                                  "25/05/2022",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(
                                          fontSize: 10, color: AppColors.black),
                                ),
                                //trailing: Image.asset("assets/images/Group 221.png",width: width*0.09,),
                              )),
                        );
                      },
                    ),
                  ),
                ]),
          ),
        ));
  }

  List images = [
    "https://images.unsplash.com/photo-1575936123452-b67c3203c357?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aW1hZ2V8ZW58MHx8MHx8fDA%3D&w=1000&q=80",
    "https://www.seiu1000.org/sites/main/files/main-images/camera_lense_0.jpeg"
  ];
}
