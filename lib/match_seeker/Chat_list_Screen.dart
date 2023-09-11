import 'package:cached_network_image/cached_network_image.dart';
import 'package:cupid_match/match_seeker/chat_screen.dart';
import 'package:cupid_match/match_seeker/matched_request.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/controller/SeekerChatListController/seeker_chat_list_controller.dart';
import '../data/response/status.dart';
import '../res/components/general_exception.dart';
import '../res/components/internet_exceptions_widget.dart';

class ChatListScreen extends StatefulWidget {
  const ChatListScreen({Key? key}) : super(key: key);

  @override
  State<ChatListScreen> createState() => _ChatListScreenState();
}

class _ChatListScreenState extends State<ChatListScreen> {
  SeekerChatListController seekerChatListController = Get.put(SeekerChatListController());

  @override
  void initState() {

    // TODO: implement initState
    super.initState();
    seekerChatListController.isSeekerChatListApi();
  }
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Message",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Matches (5)",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            SizedBox(height: height * .02),
            SizedBox(
              height: height * .1,
              width: width * 1,
              child: ListView.builder(
                itemCount: 6,
                scrollDirection: Axis.horizontal,
                itemExtent: 80,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Get.to(() => MatchedRequesd());
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: CircleAvatar(
                        radius: 30.0,
                        backgroundImage: NetworkImage(
                            "https://img.freepik.com/free-photo/smiley-businesswoman-posing-outdoors-with-arms-crossed-copy-space_23-2148767055.jpg"),
                        backgroundColor: Colors.transparent,
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: height * .02),
            Text(
              "Friends (10)",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            SizedBox(height: height * .02),
            Obx(() {
              switch (seekerChatListController.rxRequestStatus.value) {
                case Status.LOADING:
                  return const Center(child: CircularProgressIndicator());
                case Status.ERROR:
                  if (seekerChatListController.error.value == 'No internet') {
                    return InterNetExceptionWidget(
                      onPress: () {},
                    );
                  } else {
                    return GeneralExceptionWidget(onPress: () {});
                  }
                case Status.COMPLETED:
                  return  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: seekerChatListController.seekerChatListValue.value.chat!.length,
                    itemExtent: 80,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Get.to(() => ChatPage());
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              height: height * .33,
                              width: width * .29,
                              child: Stack(
                                children: [
                                  Positioned(
                                    right: 30,
                                    child: CircleAvatar(
                                      radius: 30.0,
                                      backgroundImage: CachedNetworkImageProvider(
                                          seekerChatListController
                                              .seekerChatListValue
                                              .value
                                              .chat![
                                          index]
                                              .seekerwithImg!
                                              .toString()),
                                      backgroundColor: Colors.transparent,
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border:
                                      Border.all(color: Colors.white, width: 2),
                                    ),
                                    child: CircleAvatar(
                                      radius: 30.0,
                                      backgroundImage: CachedNetworkImageProvider(
                                          seekerChatListController
                                              .seekerChatListValue
                                              .value
                                              .chat![
                                          index]
                                              .seekerfromImg!
                                              .toString()),
                                      backgroundColor: Colors.transparent,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Flexible(
                              flex: 1,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: height * .01,
                                  ),
                                  Text(
                                    (seekerChatListController
                                        .seekerChatListValue
                                        .value
                                        .chat![index]
                                        .seekerfromName!
                                        .toString())+ " & "
                                       +
                                        (seekerChatListController
                                            .seekerChatListValue
                                            .value
                                            .chat![index]
                                            .seekerwithName!
                                            .toString()),
                                    style: Theme.of(context).textTheme.titleSmall,
                                  ),

                                  SizedBox(
                                    height: height * .01,
                                  ),
                                  Text(
                                    "Hey! How\'s it going?",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .copyWith(color: Colors.grey),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: width * .01),
                            Text(
                              "10:50PM",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(color: Colors.grey),
                            )
                          ],
                        ),
                      );
                    },
                  );
              }
            }),

          ],
        ),
      ),
    );
  }
}
