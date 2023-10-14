import 'package:cached_network_image/cached_network_image.dart';
import 'package:cupid_match/GlobalVariable/GlobalVariable.dart';
import 'package:cupid_match/match_seeker/chat_screen.dart';
import 'package:cupid_match/match_seeker/matched_request.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/controller/SeekerChatListController/seeker_chat_list_controller.dart';
import '../data/response/status.dart';
import '../res/colors/app_color.dart';
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
      body:
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

            return
              SingleChildScrollView(
                child: Column(
              
                  children: [
              
                    if(seekerChatListController.seekerChatListValue.value.message =='No data Found')SizedBox(height:Get.height*0.12),
                    if(seekerChatListController.seekerChatListValue.value.message =='No data Found')
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset('assets/images/emessage.png',width: Get.width*0.7,),
                          SizedBox(height: Get.height*0.05,),
                          Text("No Messages, yet.",style: Get.theme.textTheme.headlineSmall!.copyWith(
                              color: AppColor.blackColor
                          )),
                          SizedBox(height: Get.height*0.02,),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 70.0),
                            child: Text("No messages in your inbox, yet! Start chatting with people around you.",style: Get.theme.textTheme.bodyMedium!.copyWith(
                                color: AppColor.blackColor,fontWeight: FontWeight.w300
                            ),textAlign: TextAlign.center,),
                          )
                        ],
                      ),
              
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: seekerChatListController.seekerChatListValue.value.chat!.length,
                        itemExtent: 80,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                             
                              roomid =  seekerChatListController.seekerChatListValue.value.chat![index].roomid
              
                                  .toString();
              chatname=seekerChatListController
                  .seekerChatListValue
                  .value
                  .chat![index]
                  .seekerfromName!
                  .toString();
              chatimage=seekerChatListController
                  .seekerChatListValue
                  .value
                  .chat![index]
                  .seekerwithImg!
                  .toString();
              setState(() {
                chatname;
                chatimage;
              });
                              if (requestid != null) {
                                print(requestid);
                                Get.to(ChatPage());
                              }
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
                      ),
                    )
                  ],
                ),
              );
        }
      }
      )
      // Obx(() {
      //   return
      //
      // })

    );
  }
}
// seekerChatListController.seekerChatListValue.value.message