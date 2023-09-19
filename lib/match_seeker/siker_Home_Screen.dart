import 'package:cached_network_image/cached_network_image.dart';
import 'package:cupid_match/GlobalVariable/GlobalVariable.dart';
import 'package:cupid_match/controllers/controller/IncomingRequestController/IncomingRequestController.dart';
import 'package:cupid_match/controllers/controller/OutgoingRequestController/OutgoingRequestController.dart';
import 'package:cupid_match/data/response/status.dart';
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
import 'package:cupid_match/match_seeker/Demo/homeScreenwidget.dart';
import 'package:cupid_match/match_seeker/Requests/IncomingRequest.dart';
import 'package:cupid_match/match_seeker/Requests/outgoingRequest.dart';
import 'package:cupid_match/match_seeker/home_screen.dart';
import 'package:cupid_match/match_seeker/chat_screen.dart';
import 'package:cupid_match/res/components/general_exception.dart';
import 'package:cupid_match/res/components/internet_exceptions_widget.dart';
import 'package:cupid_match/utils/app_colors.dart';
import 'package:cupid_match/widgets/MakerDrawer.dart';
import 'package:cupid_match/widgets/drawer.dart';
import 'package:cupid_match/widgets/my_button.dart';
import 'package:cupid_match/widgets/seekershortprofile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'dart:math' as math;

import '../controllers/controller/RecentSeekerMatchesController/recent_seeker_matches_controller.dart';
import '../controllers/controller/ViewSikerDetailsController/ViewSikerDetaolsController.dart';

class SikerHomeScreen extends StatefulWidget {
  const SikerHomeScreen({Key? key}) : super(key: key);

  @override
  State<SikerHomeScreen> createState() => _SikerHomeScreenState();
}

class _SikerHomeScreenState extends State<SikerHomeScreen> {
  OutgoinRequestController controller = Get.put(OutgoinRequestController());
  IncomingRequestController Incontroller = Get.put(IncomingRequestController());
  final ViewSikerProfileDetailsControllernstance =
      Get.put(ViewSikerProfileDetailsController());
  RecentSeekerMatchesController recentSeekerMatchesController =
      Get.put(RecentSeekerMatchesController());
  String? Getcurrentuser;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getcurrentuser();

    controller.seekerListApi();
    Incontroller.iseekerListApi();
    recentSeekerMatchesController.isrecentSeekermatchesApi();

    ViewSikerProfileDetailsControllernstance.ViewSikerProfileDetailsApiHit();
  }

  getcurrentuser() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    Getcurrentuser = sp.getString("Tokernid");
    print("$Getcurrentuser======currentuser");
  }

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
        body: Obx(() {
          final incomingrequeststatus = Incontroller.rxRequestStatus.value;
          final outgoingrequeststatus = controller.rxRequestStatus.value;
          final recentmachesstatus = recentSeekerMatchesController.rxRequestStatus.value;
          if (recentmachesstatus == Status.ERROR ||
              incomingrequeststatus == Status.ERROR ||
              outgoingrequeststatus == Status.ERROR)
          {
            if (recentSeekerMatchesController.error.value == 'No internet' ||
                Incontroller.error.value == 'No internet' ||
                controller.error.value == 'No internet') {
              return InterNetExceptionWidget(
                onPress: () {
                  // questionsViewModal.refreshApi();
                  // myProfileView_vm.refreshApi();
                },
              );
            } else {
              if (recentSeekerMatchesController
                          .RecentSeekerMatchValue.value.status ==
                      'failed' &&
                  Incontroller.IncomingRequestvalue.value.status == 'failed' &&
                  controller.OutgoingRequestvalue.value.status == 'failed') {
                return Column(
                  children: [
                    Container(
                      child: Center(
                        child: Container(
                          child: Column(
                            children: [
                              SizedBox(
                                height: Get.height * 0.01,
                              ),
                              Align(
                                  alignment: Alignment.center,
                                  child: GestureDetector(
                                      onTap: () {
                                        Get.to(Chose_Role_Type());
                                      },
                                      child: Image.asset(
                                          'assets/images/match.png'))),
                              SizedBox(
                                height: Get.height * 0.1,
                              ),
                              Container(
                                height: Get.height * .3,
                                width: Get.width * .9,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            "assets/images/skikerhomeempty.png"))),
                              ),
                              SizedBox(
                                height: Get.height * 0.02,
                              ),
                              Text(
                                "Outgoing Request",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 18),
                              ),
                              SizedBox(
                                height: Get.height * 0.02,
                              ),
                              Text(
                                "Find your perfect match",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: Get.height * 0.02,
                              ),
                              MyButton(
                                  title: "Find Match",
                                  onTap: () {
                                    Get.to(Chose_Role_Type());
                                  })
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              }
              return HomeScreenWIdget();
            }
          }
          else if (recentmachesstatus == Status.LOADING ||
              incomingrequeststatus == Status.LOADING ||
              outgoingrequeststatus == Status.LOADING)
          {
            return Center(child: CircularProgressIndicator());
          }
          else {
            return
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: width * 0.05, vertical: height * 0.02),
                child: SingleChildScrollView(
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.start,

                      children: [

                        if(recentSeekerMatchesController.RecentSeekerMatchValue.value.message=='Data Not Found' &&
                            Incontroller.IncomingRequestvalue.value.message=='No request found' &&
                            controller.OutgoingRequestvalue.value.message=='No request found'
                        )
                        Column(
                          children: [

                            Align(
                                alignment: Alignment.center,
                                child: GestureDetector(
                                    onTap: () {
                                      Get.to(Chose_Role_Type());
                                    },
                                    child: Image.asset('assets/images/match.png'))),
                            SizedBox(height: Get.height*0.05,),
                            Center(
                              child: Image.asset('assets/images/homeempty.png'),
                            ),
                            SizedBox(height: Get.height*0.04,),
                            Text("Outgoing Request",style: Get.theme.textTheme.bodySmall,),
                            SizedBox(height: Get.height*0.01,),
                            Text("Find your perfect match",style: Get.theme.textTheme.labelMedium!.copyWith(
                              fontWeight: FontWeight.w600,color: AppColors.black
                            ),),
                            SizedBox(height: Get.height*0.04,),
                            MyButton(title: 'Find Match', onTap: (){})
                          ],
                        ),
                        if(recentSeekerMatchesController.RecentSeekerMatchValue.value.message!='Data Not Found' ||
                            Incontroller.IncomingRequestvalue.value.message!='No request found' ||
                            controller.OutgoingRequestvalue.value.message!='No request found'
                        )
                          Container(
                            child: Column(
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
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyLarge)
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
                                SizedBox(
                                  height: height * .02,
                                ),

                                // Obx(() {
                                //   switch (
                                //       recentSeekerMatchesController.rxRequestStatus.value) {
                                //     case Status.LOADING:
                                //       return const Center(child: CircularProgressIndicator());
                                //     case Status.ERROR:
                                //       if (Incontroller.error.value == 'No internet') {
                                //         return InterNetExceptionWidget(
                                //           onPress: () {},
                                //         );
                                //       } else {
                                //         return GeneralExceptionWidget(onPress: () {});
                                //       }
                                //     case Status.COMPLETED:
                                //       return
                                if(recentSeekerMatchesController.RecentSeekerMatchValue.value.data!.isEmpty)
                                  Column(
                                    children: [
                                      Image.asset('assets/images/recentmatchempt.png',width: Get.width*0.83,),
                                      Text("Reference site about Lorem Ipsum, giving information on its origins",style:
                                      Get.theme.textTheme.bodySmall,textAlign: TextAlign.center,)
                                    ],
                                  ),
                                if(recentSeekerMatchesController.RecentSeekerMatchValue.value.data!.isNotEmpty)
                                  Container(
                                  width: width,
                                  height: height * .45,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    physics: AlwaysScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: 2,
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
                                                        color:
                                                        AppColors.ratingcodeColor,
                                                        borderRadius:
                                                        BorderRadius.circular(
                                                            18)),
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
                                                            image: recentSeekerMatchesController
                                                                .RecentSeekerMatchValue
                                                                .value
                                                                .data![index]
                                                                .getanotherseeker!
                                                                .id
                                                                .toString() !=
                                                                Getcurrentuser
                                                                    .toString()
                                                                ? CachedNetworkImageProvider(
                                                                recentSeekerMatchesController
                                                                    .RecentSeekerMatchValue
                                                                    .value
                                                                    .data![index]
                                                                    .getseeker!
                                                                    .imgPath
                                                                    .toString())
                                                                : CachedNetworkImageProvider(
                                                                recentSeekerMatchesController
                                                                    .RecentSeekerMatchValue
                                                                    .value
                                                                    .data![index]
                                                                    .getanotherseeker!
                                                                    .imgPath
                                                                    .toString()),
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
                                                            image: recentSeekerMatchesController
                                                                .RecentSeekerMatchValue
                                                                .value
                                                                .data![index]
                                                                .getanotherseeker!
                                                                .id
                                                                .toString() ==
                                                                Getcurrentuser
                                                                    .toString()
                                                                ? CachedNetworkImageProvider(
                                                                recentSeekerMatchesController
                                                                    .RecentSeekerMatchValue
                                                                    .value
                                                                    .data![index]
                                                                    .getseeker!
                                                                    .imgPath
                                                                    .toString())
                                                                : CachedNetworkImageProvider(
                                                                recentSeekerMatchesController
                                                                    .RecentSeekerMatchValue
                                                                    .value
                                                                    .data![index]
                                                                    .getanotherseeker!
                                                                    .imgPath
                                                                    .toString()),
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
                                                        backgroundColor:
                                                        AppColors.white,
                                                        child:
                                                        Icon(Icons.heart_broken),
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
                                                        backgroundColor:
                                                        AppColors.white,
                                                        child:
                                                        Icon(Icons.heart_broken),
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
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .labelSmall,
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),


                                SizedBox(
                                  height: height * 0.02,
                                ),
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


                                //********************* recent conversations *********

                                Column(
                                  children: [
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

                                    Image.asset('assets/images/recentC.png',width: Get.width*0.83,),
                                    Text("Reference site about Lorem Ipsum, giving information on its origins",style:
                                    Get.theme.textTheme.bodySmall,textAlign: TextAlign.center,)
                                  ],
                                ),
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
                                //                 borderRadius:
                                //                 BorderRadius.circular(15)),
                                //             width: width * .65,
                                //             // height: 50,
                                //             child: ListTile(
                                //               leading: Container(
                                //                 width: width * .08,
                                //                 height: height * 0.05,
                                //                 child: ListView.builder(
                                //                   scrollDirection: Axis.horizontal,
                                //                   itemCount: images.length >= 3
                                //                       ? 3
                                //                       : images.length,
                                //                   shrinkWrap: true,
                                //                   reverse: true,
                                //                   itemBuilder: (context, index) {
                                //                     return Align(
                                //                       alignment: Alignment.centerRight,
                                //                       widthFactor: 0.3,
                                //                       child: CircleAvatar(
                                //                         radius: 18,
                                //                         backgroundColor:
                                //                         AppColors.white,
                                //                         child: CircleAvatar(
                                //                           radius: 16,
                                //                           backgroundImage: NetworkImage(
                                //                               images[index]),
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
                                //                     fontSize: 10,
                                //                     color: AppColors.black),
                                //               ),
                                //               trailing: GestureDetector(
                                //                 // onTap: () => Get.to(() => ChatScreen()),
                                //                   child: Image.asset(
                                //                     "assets/maker/Group 221.png",
                                //                     width: width * 0.09,
                                //                   )),
                                //             )),
                                //       );
                                //     },
                                //   ),
                                // ),




                                SizedBox(height: Get.height*0.03,),

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Incoming Requests",
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
                                if(Incontroller.IncomingRequestvalue.value.requests!.isEmpty)
                                  Column(
                                    children: [
                                      Image.asset('assets/images/incomingr.png',width: Get.width*0.83,),
                                      Text("Reference site about Lorem Ipsum, giving information on its origins",style:
                                      Get.theme.textTheme.bodySmall,textAlign: TextAlign.center,)
                                    ],
                                  ),

                                if(Incontroller.IncomingRequestvalue.value.requests!.isNotEmpty)   Container(
                                    width: width,
                                    height: height * .18,
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      physics: AlwaysScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemCount: Incontroller.IncomingRequestvalue.value
                                          .requests!.length >
                                          2
                                          ? 2
                                          : 1,
                                      itemBuilder: (context, index) {
                                        return InkWell(
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Container(
                                                decoration: BoxDecoration(
                                                    color: AppColors.ratingcodeColor,
                                                    borderRadius:
                                                    BorderRadius.circular(15)),
                                                width: width * .65,
                                                child: Incontroller
                                                    .IncomingRequestvalue
                                                    .value
                                                    .requests![index]
                                                    .getMaker ==
                                                    null
                                                    ? InkWell(
                                                  child: Container(
                                                      child: Column(
                                                        children: [
                                                          Row(
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                const EdgeInsets
                                                                    .only(
                                                                    left: 20,
                                                                    top: 10,
                                                                    bottom: 10),
                                                                child: Text(
                                                                  "Seeker ",
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .pink),
                                                                ),
                                                              ),
                                                              Text(
                                                                " Requested",
                                                                style: TextStyle(
                                                                    color:
                                                                    Colors.black),
                                                              )
                                                            ],
                                                          ),
                                                          Row(
                                                            crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                            mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                const EdgeInsets
                                                                    .all(8.0),
                                                                child: Container(
                                                                  // width: width * .29,
                                                                  child: Stack(
                                                                    children: [
                                                                      CircleAvatar(
                                                                          radius: 30,
                                                                          backgroundColor:
                                                                          AppColors
                                                                              .white,
                                                                          backgroundImage: CachedNetworkImageProvider(Incontroller
                                                                              .IncomingRequestvalue
                                                                              .value
                                                                              .requests![
                                                                          index]
                                                                              .getSeeker!
                                                                              .imgPath
                                                                              .toString())),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                width:
                                                                Get.width * 0.08,
                                                              ),
                                                              Column(
                                                                children: [
                                                                  SizedBox(
                                                                    height:
                                                                    Get.height *
                                                                        0.02,
                                                                  ),
                                                                  Text(
                                                                    Incontroller
                                                                        .IncomingRequestvalue
                                                                        .value
                                                                        .requests![
                                                                    index]
                                                                        .getSeeker!
                                                                        .name
                                                                        .toString(),
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .pink,
                                                                        fontSize: 20,
                                                                        fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                                  ),
                                                                  SizedBox(
                                                                    height:
                                                                    Get.height *
                                                                        0.01,
                                                                  ),
                                                                  Text(
                                                                    Incontroller
                                                                        .IncomingRequestvalue
                                                                        .value
                                                                        .requests![
                                                                    index]
                                                                        .getSeeker!
                                                                        .dob
                                                                        .toString(),
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .black),
                                                                  )
                                                                ],
                                                              )
                                                            ],
                                                          )
                                                        ],
                                                      )),
                                                  //  onTap: (){
                                                  //      userIdsiker=Incontroller.IncomingRequestvalue.value.requests![index].getSeeker!.id.toString();

                                                  //     print(userIdsiker);
                                                  //     Get.to(ShortProfileSeeker());
                                                  // },
                                                )
                                                    : Container(
                                                    child: Column(
                                                      children: [
                                                        Row(
                                                          children: [
                                                            SizedBox(
                                                              height:
                                                              Get.height * 0.04,
                                                            ),
                                                            Padding(
                                                              padding:
                                                              const EdgeInsets
                                                                  .only(
                                                                left: 20,
                                                              ),
                                                              child: Text(
                                                                "Seeker &",
                                                                style: TextStyle(
                                                                    color:
                                                                    Colors.black),
                                                              ),
                                                            ),
                                                            Text(
                                                              "Maker",
                                                              style: TextStyle(
                                                                  color: Colors.pink),
                                                            ),
                                                            Text(
                                                              " Requested",
                                                              style: TextStyle(
                                                                  color:
                                                                  Colors.black),
                                                            )
                                                          ],
                                                        ),
                                                        Row(
                                                          crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                          mainAxisAlignment:
                                                          MainAxisAlignment.start,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                              child: Container(
                                                                width: width * .29,
                                                                child: Stack(
                                                                  children: [
                                                                    Positioned(
                                                                      right: 30,
                                                                      child:
                                                                      CircleAvatar(
                                                                        radius: 30.0,
                                                                        backgroundImage: CachedNetworkImageProvider(Incontroller
                                                                            .IncomingRequestvalue
                                                                            .value
                                                                            .requests![
                                                                        index]
                                                                            .getSeeker!
                                                                            .imgPath
                                                                            .toString()),
                                                                        backgroundColor:
                                                                        Colors
                                                                            .transparent,
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      decoration:
                                                                      BoxDecoration(
                                                                        shape: BoxShape
                                                                            .circle,
                                                                        border: Border.all(
                                                                            color: Colors
                                                                                .white,
                                                                            width: 2),
                                                                      ),
                                                                      child:
                                                                      CircleAvatar(
                                                                        radius: 30.0,
                                                                        backgroundImage: CachedNetworkImageProvider(Incontroller
                                                                            .IncomingRequestvalue
                                                                            .value
                                                                            .requests![
                                                                        index]
                                                                            .getMaker!
                                                                            .imgPath
                                                                            .toString()),
                                                                        backgroundColor:
                                                                        Colors
                                                                            .transparent,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                            Column(
                                                              children: [
                                                                SizedBox(
                                                                  height: Get.height *
                                                                      0.02,
                                                                ),
                                                                Text(
                                                                  Incontroller
                                                                      .IncomingRequestvalue
                                                                      .value
                                                                      .requests![
                                                                  index]
                                                                      .getSeeker!
                                                                      .name
                                                                      .toString(),
                                                                  style: TextStyle(
                                                                      color:
                                                                      Colors.pink,
                                                                      fontSize: 20,
                                                                      fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                                ),
                                                                SizedBox(
                                                                  height: Get.height *
                                                                      0.01,
                                                                ),
                                                                Text(
                                                                  Incontroller
                                                                      .IncomingRequestvalue
                                                                      .value
                                                                      .requests![
                                                                  index]
                                                                      .getSeeker!
                                                                      .dob
                                                                      .toString(),
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .black),
                                                                )
                                                              ],
                                                            )
                                                          ],
                                                        )
                                                      ],
                                                    ))),
                                          ),
                                          onTap: () {
                                            setState(() {
                                              requestype = "1";
                                            });
                                            requestid = Incontroller
                                                .IncomingRequestvalue
                                                .value
                                                .requests![index]
                                                .id
                                                .toString();

                                            if (requestid != null) {
                                              print(requestid);
                                              Get.to(ChatPage());
                                            }
                                          },
                                        );
                                      },
                                    ),
                                  ),



                                SizedBox(
                                  height: height * 0.02,
                                ),

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Outgoing Requests",
                                      style: Theme.of(context).textTheme.titleLarge,
                                    ),
                                    TextButton(
                                        onPressed: () {
                                          WidgetsBinding.instance!
                                              .addPostFrameCallback((_) {
                                            // This code will run after the build is complete
                                            Get.to(OutGoingRequest());
                                          });
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
                                if(controller.OutgoingRequestvalue.value.requests!.isEmpty)
                                Column(
                                  children: [
                                    Image.asset('assets/images/outgoinc.png',width: Get.width*0.83,),
                                    Text("Reference site about Lorem Ipsum, giving information on its origins",style:
                                    Get.theme.textTheme.bodySmall,textAlign: TextAlign.center,)
                                  ],
                                ),
                                if(controller.OutgoingRequestvalue.value.requests!.isNotEmpty)    Container(
                                  width: width,
                                  height: height * .18,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    physics: AlwaysScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: controller.OutgoingRequestvalue.value
                                        .requests!.length >=
                                        2
                                        ? 2
                                        : 1,
                                    itemBuilder: (context, index) {
                                      return InkWell(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                              decoration: BoxDecoration(
                                                  color: AppColors.ratingcodeColor,
                                                  borderRadius:
                                                  BorderRadius.circular(15)),
                                              width: width * .65,
                                              // height: Get.height*0.5,

                                              child: controller
                                                  .OutgoingRequestvalue
                                                  .value
                                                  .requests![index]
                                                  .getMaker ==
                                                  null
                                                  ? InkWell(
                                                child: Container(
                                                    child: Column(
                                                      children: [
                                                        Row(
                                                          children: [
                                                            SizedBox(
                                                              height:
                                                              Get.height * 0.04,
                                                            ),
                                                            Padding(
                                                              padding:
                                                              const EdgeInsets
                                                                  .only(
                                                                  left: 20),
                                                              child: Text(
                                                                "Seeker ",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .pink),
                                                              ),
                                                            ),
                                                            Text(
                                                              " Requested",
                                                              style: TextStyle(
                                                                  color:
                                                                  Colors.black),
                                                            )
                                                          ],
                                                        ),
                                                        Row(
                                                          crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                          mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                              child: Container(
                                                                // width: width * .29,
                                                                child: Stack(
                                                                  children: [
                                                                    CircleAvatar(
                                                                        radius: 30,
                                                                        backgroundColor:
                                                                        AppColors
                                                                            .white,
                                                                        backgroundImage: CachedNetworkImageProvider(controller
                                                                            .OutgoingRequestvalue
                                                                            .value
                                                                            .requests![
                                                                        index]
                                                                            .outgoing_req_getseeker!
                                                                            .imgPath
                                                                            .toString())),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width:
                                                              Get.width * 0.08,
                                                            ),
                                                            Column(
                                                              children: [
                                                                SizedBox(
                                                                  height:
                                                                  Get.height *
                                                                      0.02,
                                                                ),
                                                                Text(
                                                                  controller
                                                                      .OutgoingRequestvalue
                                                                      .value
                                                                      .requests![
                                                                  index]
                                                                      .outgoing_req_getseeker!
                                                                      .name
                                                                      .toString(),
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .pink,
                                                                      fontSize: 20,
                                                                      fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                                ),
                                                                SizedBox(
                                                                  height:
                                                                  Get.height *
                                                                      0.01,
                                                                ),
                                                                Text(
                                                                  controller
                                                                      .OutgoingRequestvalue
                                                                      .value
                                                                      .requests![
                                                                  index]
                                                                      .outgoing_req_getseeker!
                                                                      .dob
                                                                      .toString(),
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .black),
                                                                )
                                                              ],
                                                            )
                                                          ],
                                                        )
                                                      ],
                                                    )),
                                                // onTap: (){
                                                //      userIdsiker=controller.OutgoingRequestvalue.value.requests![index].getSeeker!.id.toString();

                                                //     print(userIdsiker);
                                                //     Get.to(ShortProfileSeeker());
                                                // },
                                              )
                                                  : Container(
                                                  child: Column(
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Padding(
                                                            padding:
                                                            const EdgeInsets
                                                                .only(
                                                                left: 20,
                                                                top: 10),
                                                            child: Text(
                                                              "Seeker &",
                                                              style: TextStyle(
                                                                  color:
                                                                  Colors.black),
                                                            ),
                                                          ),
                                                          Text(
                                                            "Maker",
                                                            style: TextStyle(
                                                                color: Colors.pink),
                                                          ),
                                                          Text(
                                                            " Requested",
                                                            style: TextStyle(
                                                                color:
                                                                Colors.black),
                                                          )
                                                        ],
                                                      ),
                                                      Row(
                                                        crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                        mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                            child: Container(
                                                              width: width * .29,
                                                              child: Stack(
                                                                children: [
                                                                  Positioned(
                                                                    right: 30,
                                                                    child:
                                                                    CircleAvatar(
                                                                      radius: 30.0,
                                                                      backgroundImage: CachedNetworkImageProvider(controller
                                                                          .OutgoingRequestvalue
                                                                          .value
                                                                          .requests![
                                                                      index]
                                                                          .getMaker!
                                                                          .imgPath
                                                                          .toString()),
                                                                      backgroundColor:
                                                                      Colors
                                                                          .transparent,
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    decoration:
                                                                    BoxDecoration(
                                                                      shape: BoxShape
                                                                          .circle,
                                                                      border: Border.all(
                                                                          color: Colors
                                                                              .white,
                                                                          width: 2),
                                                                    ),
                                                                    child:
                                                                    CircleAvatar(
                                                                      radius: 30.0,
                                                                      backgroundImage: CachedNetworkImageProvider(controller
                                                                          .OutgoingRequestvalue
                                                                          .value
                                                                          .requests![
                                                                      index]
                                                                          .getMaker!
                                                                          .imgPath
                                                                          .toString()),
                                                                      backgroundColor:
                                                                      Colors
                                                                          .transparent,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          Column(
                                                            children: [
                                                              SizedBox(
                                                                height: Get.height *
                                                                    0.02,
                                                              ),
                                                              Text(
                                                                controller
                                                                    .OutgoingRequestvalue
                                                                    .value
                                                                    .requests![
                                                                index]
                                                                    .outgoing_req_getseeker!
                                                                    .name
                                                                    .toString(),
                                                                style: TextStyle(
                                                                    color:
                                                                    Colors.pink,
                                                                    fontSize: 20,
                                                                    fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                              ),
                                                              SizedBox(
                                                                height: Get.height *
                                                                    0.01,
                                                              ),
                                                              Text(
                                                                controller
                                                                    .OutgoingRequestvalue
                                                                    .value
                                                                    .requests![
                                                                index]
                                                                    .outgoing_req_getseeker!
                                                                    .dob
                                                                    .toString(),
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .black),
                                                              )
                                                            ],
                                                          )
                                                        ],
                                                      )
                                                    ],
                                                  ))),
                                        ),
                                        onTap: () {
                                          setState(() {
                                            requestype = "2";
                                          });
                                          requestid = controller.OutgoingRequestvalue
                                              .value.requests![index].id
                                              .toString();

                                          if (requestid != null) {
                                            print(requestid);
                                            Get.to(ChatPage());
                                          }
                                        },
                                      );
                                    },
                                  ),
                                )


                              ],
                            ),
                          )
                      ]),
                ));
          }
        }
        )
    );
  }

  List images = [
    "https://images.unsplash.com/photo-1575936123452-b67c3203c357?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aW1hZ2V8ZW58MHx8MHx8fDA%3D&w=1000&q=80",
    "https://www.seiu1000.org/sites/main/files/main-images/camera_lense_0.jpeg"
  ];
}
