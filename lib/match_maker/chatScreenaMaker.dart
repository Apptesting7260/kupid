import 'package:cached_network_image/cached_network_image.dart';
import 'package:cupid_match/controllers/MakerChatListController/MakerChatListController.dart';
import 'package:cupid_match/match_seeker/chat_screen.dart';
import 'package:cupid_match/utils/app_colors.dart';
import 'package:cupid_match/widgets/MakerDrawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/response/status.dart';
import '../res/components/general_exception.dart';
import '../res/components/internet_exceptions_widget.dart';

class ChatScreenMaker extends StatefulWidget {
  const ChatScreenMaker({Key? key}) : super(key: key);

  @override
  State<ChatScreenMaker> createState() => _ChatScreenMakerState();
}

class _ChatScreenMakerState extends State<ChatScreenMaker> {
  MakerChatListController makerChatListController =
      Get.put(MakerChatListController());
  List imagesList = [
    "https://images.unsplash.com/photo-1687076613219-fb4b3d94e75a?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxMzJ8fHxlbnwwfHx8fHw%3D&auto=format&fit=crop&w=500&q=60",
    "https://plus.unsplash.com/premium_photo-1686777550406-98c56a8bd590?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxNzZ8fHxlbnwwfHx8fHw%3D&auto=format&fit=crop&w=500&q=60"
  ];

  @override
  void initState() {
    super.initState();
    makerChatListController.isMakerChatListApi();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Message",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        centerTitle: true,
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
      endDrawer: Drawer(child: MakerDrawer()),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * .04),
        child: ListView(
          children: [
            SizedBox(
              height: height * .03,
            ),
            // Text(
            //   "Matches (5)",
            //   style: Theme.of(context)
            //       .textTheme
            //       .bodyLarge
            //       ?.copyWith(color: Color(0xff000000)),
            // ),
            // Container(
            //   height: height * .1,
            //   child: ListView.builder(
            //     itemCount: 20,
            //     shrinkWrap: true,
            //     scrollDirection: Axis.horizontal,
            //     physics: AlwaysScrollableScrollPhysics(),
            //     itemBuilder: (context, index) {
            //       return CircleAvatar(
            //         radius: 28,
            //         backgroundColor: AppColors.white,
            //         child: CircleAvatar(
            //           radius: 26,
            //           backgroundImage: NetworkImage(
            //               "https://images.unsplash.com/photo-1687076613219-fb4b3d94e75a?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxMzJ8fHxlbnwwfHx8fHw%3D&auto=format&fit=crop&w=500&q=60"),
            //         ),
            //       );
            //     },
            //   ),
            // ),
            SizedBox(
              height: height * .01,
            ),
            // Text(
            //   "Friends (10)",
            //   style: Theme.of(context).textTheme.bodyLarge,
            // ),
            SizedBox(
              height: height * .2,
            ),
            // Obx(() {
            //   switch (makerChatListController.rxRequestStatus.value) {
            //     case Status.LOADING:
            //       return const Center(child: CircularProgressIndicator());
            //     case Status.ERROR:
            //       if (makerChatListController.error.value == 'No internet') {
            //         return InterNetExceptionWidget(
            //           onPress: () {},
            //         );
            //       } else {
            //         return GeneralExceptionWidget(onPress: () {});
            //       }
            //     case Status.COMPLETED:
            //       if (makerChatListController.makerChatListValue.value.status !=
            //           "Data No Found") {
            //         return ListView.builder(
            //           physics: NeverScrollableScrollPhysics(),
            //           itemCount: makerChatListController
            //               .makerChatListValue.value.chat!.length,
            //           itemExtent: 80,
            //           shrinkWrap: true,
            //           itemBuilder: (context, index) {
            //             return GestureDetector(
            //               onTap: () {
            //                 Get.to(() => ChatPage());
            //               },
            //               child: Row(
            //                 mainAxisAlignment: MainAxisAlignment.start,
            //                 children: [
            //                   Container(
            //                     height: height * .33,
            //                     width: width * .29,
            //                     child: Stack(
            //                       children: [
            //                         Positioned(
            //                           right: 30,
            //                           child: CircleAvatar(
            //                             radius: 30.0,
            //                             backgroundImage:
            //                                 CachedNetworkImageProvider(
            //                                     makerChatListController
            //                                         .makerChatListValue
            //                                         .value
            //                                         .chat![index]
            //                                         .seekerwithImg!
            //                                         .toString()),
            //                             backgroundColor: Colors.transparent,
            //                           ),
            //                         ),
            //                         Container(
            //                           decoration: BoxDecoration(
            //                             shape: BoxShape.circle,
            //                             border: Border.all(
            //                                 color: Colors.white, width: 2),
            //                           ),
            //                           child: CircleAvatar(
            //                             radius: 30.0,
            //                             backgroundImage:
            //                                 CachedNetworkImageProvider(
            //                                     makerChatListController
            //                                         .makerChatListValue
            //                                         .value
            //                                         .chat![index]
            //                                         .seekerfromImg!
            //                                         .toString()),
            //                             backgroundColor: Colors.transparent,
            //                           ),
            //                         ),
            //                       ],
            //                     ),
            //                   ),
            //                   Flexible(
            //                     flex: 1,
            //                     child: Column(
            //                       crossAxisAlignment: CrossAxisAlignment.start,
            //                       children: [
            //                         SizedBox(
            //                           height: height * .01,
            //                         ),
            //                         Text(
            //                           (makerChatListController
            //                                   .makerChatListValue
            //                                   .value
            //                                   .chat![index]
            //                                   .seekerfromName!
            //                                   .toString()) +
            //                               " & " +
            //                               (makerChatListController
            //                                   .makerChatListValue
            //                                   .value
            //                                   .chat![index]
            //                                   .seekerwithName!
            //                                   .toString()),
            //                           style: Theme.of(context)
            //                               .textTheme
            //                               .titleSmall,
            //                         ),
            //                         SizedBox(
            //                           height: height * .01,
            //                         ),
            //                         Text(
            //                           "Hey! How\'s it going?",
            //                           style: Theme.of(context)
            //                               .textTheme
            //                               .bodySmall!
            //                               .copyWith(color: Colors.grey),
            //                         ),
            //                       ],
            //                     ),
            //                   ),
            //                   SizedBox(width: width * .01),
            //                   Text(
            //                     "10:50PM",
            //                     style: Theme.of(context)
            //                         .textTheme
            //                         .bodySmall!
            //                         .copyWith(color: Colors.grey),
            //                   )
            //                 ],
            //               ),
            //             );
            //           },
            //         );
            //       } else {
                     Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/recentmatchempt.png',
                          width: Get.width * 0.83,
                        ),
                        Text(
                          "Reference site about Lorem Ipsum, giving information on its origins",
                          style: Get.theme.textTheme.bodySmall,
                          textAlign: TextAlign.center,
                        )
                      ],
                    )
            //       }
            //   }
            // })
          ],
        ),
      ),
    );
  }
}
