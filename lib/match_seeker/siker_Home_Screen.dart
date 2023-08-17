import 'package:cupid_match/match_maker/Create_Match/Create_Match.dart';
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
import 'package:cupid_match/match_maker/Chose_Subcription.dart';
import 'package:cupid_match/match_seeker/Chose_role_Type.dart';
import 'package:cupid_match/match_seeker/Requests/IncomingRequest.dart';
<<<<<<< HEAD
import 'package:cupid_match/match_seeker/Requests/outgoingRequest.dart';
=======
>>>>>>> origin/main
import 'package:cupid_match/match_seeker/home_screen.dart';
import 'package:cupid_match/utils/app_colors.dart';
import 'package:cupid_match/widgets/MakerDrawer.dart';
import 'package:cupid_match/widgets/drawer.dart';
import 'package:cupid_match/widgets/my_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'dart:math' as math;

class SikerHomeScreen extends StatefulWidget {
  const SikerHomeScreen({Key? key}) : super(key: key);

  @override
  State<SikerHomeScreen> createState() => _SikerHomeScreenState();
}

class _SikerHomeScreenState extends State<SikerHomeScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text(
            "Home",
            style: Theme.of(context).textTheme.titleSmall,
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
    
        endDrawer: MyDrawer(),
      
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
                            Get.to(Chose_Role_Type());
                          },
                          child: Image.asset('assets/images/match.png'))),
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

<<<<<<< HEAD
                  // recent conversation and view all text ****************************

                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     Text(
                  //       "Recent Conversations",
                  //       style: Theme.of(context).textTheme.titleLarge,
                  //     ),
                  //     TextButton(
                  //         onPressed: () {
                  //           Get.to(RecentConversations());
                  //         },
                  //         child: Text(
                  //           'ViewAll',
                  //           style: Theme.of(context).textTheme.bodySmall,
                  //         )),
                  //   ],
                  // ),
                  //
                  // SizedBox(
                  //   height: height * 0.02,
                  // ),
                  //
                  // Container(
                  //   width: width,
                  //   height: height * .12,
                  //   child: ListView.builder(
                  //     scrollDirection: Axis.horizontal,
                  //     physics: AlwaysScrollableScrollPhysics(),
                  //     shrinkWrap: true,
                  //     itemCount: 2,
                  //     itemBuilder: (context, index) {
                  //       return Padding(
                  //         padding: const EdgeInsets.all(8.0),
                  //         child: Container(
                  //             decoration: BoxDecoration(
                  //                 color: AppColors.ratingcodeColor,
                  //                 borderRadius: BorderRadius.circular(15)),
                  //             width: width * .65,
                  //             // height: 50,
                  //             child: ListTile(
                  //               leading: Container(
                  //                 width: width * .08,
                  //                 height: height * 0.05,
                  //                 child: ListView.builder(
                  //                   scrollDirection: Axis.horizontal,
                  //                   itemCount:
                  //                       images.length >= 3 ? 3 : images.length,
                  //                   shrinkWrap: true,
                  //                   reverse: true,
                  //                   itemBuilder: (context, index) {
                  //                     return Align(
                  //                       alignment: Alignment.centerRight,
                  //                       widthFactor: 0.3,
                  //                       child: CircleAvatar(
                  //                         radius: 18,
                  //                         backgroundColor: AppColors.white,
                  //                         child: CircleAvatar(
                  //                           radius: 16,
                  //                           backgroundImage:
                  //                               NetworkImage(images[index]),
                  //                         ),
                  //                       ),
                  //                     );
                  //                   },
                  //                 ),
                  //               ),
                  //               title: Text(
                  //                 "Name",
                  //                 style: Theme.of(context)
                  //                     .textTheme
                  //                     .bodyMedium
                  //                     ?.copyWith(color: AppColors.black),
                  //               ),
                  //               subtitle: Text(
                  //                 "25/05/2022",
                  //                 style: Theme.of(context)
                  //                     .textTheme
                  //                     .bodyLarge
                  //                     ?.copyWith(
                  //                         fontSize: 10, color: AppColors.black),
                  //               ),
                  //               trailing: GestureDetector(
                  //                   onTap: () => Get.to(() => ChatScreen()),
                  //                   child: Image.asset(
                  //                     "assets/maker/Group 221.png",
                  //                     width: width * 0.09,
                  //                   )),
                  //             )),
                  //       );
                  //     },
                  //   ),
                  // ),
=======
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
>>>>>>> origin/main

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Request To Match",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      TextButton(
                          onPressed: () {
                            Get.to(IncomingRequests());
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

<<<<<<< HEAD

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Request To Be Match",
=======
                    Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Request To Accept",
>>>>>>> origin/main
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      TextButton(
                          onPressed: () {
<<<<<<< HEAD
                            Get.to(OutGoingRequest());
=======
                            Get.to(IncomingRequests());
>>>>>>> origin/main
                          },
                          child: Text(
                            'View All',
                            style: Theme.of(context).textTheme.bodySmall,
                          )),
                    ],
                  ),
<<<<<<< HEAD
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

=======
>>>>>>> origin/main

                  SizedBox(
                    height: height * 0.02,
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
