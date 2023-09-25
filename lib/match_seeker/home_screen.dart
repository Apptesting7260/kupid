import 'package:cupid_match/GlobalVariable/GlobalVariable.dart';
import 'package:cupid_match/controllers/SeekerMyProfileDetailsController/SeekerMyProfileController.dart';
import 'package:cupid_match/controllers/controller/GetAllMakerContrioller/GetAllMakerController.dart';
import 'package:cupid_match/controllers/controller/MagicProfileController/MagicProfileConrtroller.dart';
import 'package:cupid_match/data/response/status.dart';
import 'package:cupid_match/match_seeker/SeeAllMaker/SeAllMaker.dart';
import 'package:cupid_match/match_seeker/choose_one.dart';
import 'package:cupid_match/match_seeker/lever/StaticLiverPool.dart';
import 'package:cupid_match/match_seeker/lever/new_liver.dart';
import 'package:cupid_match/match_seeker/Siker_TabView.dart';
import 'package:cupid_match/match_seeker/viewMakerProfileinseeker/ViewMakerProfile.dart';
import 'package:cupid_match/res/components/general_exception.dart';
import 'package:cupid_match/res/components/internet_exceptions_widget.dart';
import 'package:cupid_match/widgets/Spin_Will_Wigdet.dart';
import 'package:cupid_match/widgets/Spined_Spin_Will_Screen.dart';
import 'package:cupid_match/widgets/drawer.dart';
import 'package:cupid_match/widgets/my_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:get/get.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../controllers/controller/SeekerToSeekerRequestController/SeekerToSeekerRequestController.dart';
import '../controllers/controller/liver_Pooled_Request_Controller/Liver_Pooled_Request_controller.dart';

class DomatchscreenSiker extends StatefulWidget {
  const DomatchscreenSiker({Key? key}) : super(key: key);

  @override
  State<DomatchscreenSiker> createState() => _DomatchscreenSikerState();
}

class _DomatchscreenSikerState extends State<DomatchscreenSiker> {
  int? selectedrole;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final ListAllMakerControllerinstance = Get.put(ListAllMakerController());

  final MagicProfileControllerinstance = Get.put(MagicProfileController());
  ChoseRole() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    selectedrole = prefs.getInt("roll");
    print("$selectedrole======");

    setState(() {});
  }

  @override
  void initState() {
    ListAllMakerControllerinstance.ListAllMakerApi();
    ChoseRole();
    MagicProfileControllerinstance.MagicProfileApiHit();
    // TODO: implement initState
    super.initState();
  }

  final seekerMyProfileDetailsController =
      Get.put(SeekerMyProfileDetailsController());
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        key: _scaffoldKey,
        endDrawer: MyDrawer(),
        appBar: AppBar(
          title: Text(
            "Home",
            style: Theme.of(context).textTheme.titleSmall,
          ),
          actions: [
            GestureDetector(
                onTap: () {
                  _scaffoldKey.currentState!.openEndDrawer();
                },
                child: Image.asset("assets/icons/menu.png"))
          ],
        ),
        body: Obx(() {
          final ListAllMakerControllerstatus =
              ListAllMakerControllerinstance.rxRequestStatus.value;
          final MagicProfileControllerstatus =
              MagicProfileControllerinstance.rxRequestStatus.value;

          if (ListAllMakerControllerstatus == Status.ERROR ||
              MagicProfileControllerstatus == Status.ERROR) {
            return Text("Error ");
          } else if (ListAllMakerControllerstatus == Status.LOADING ||
              MagicProfileControllerstatus == Status.LOADING) {
            return Center(child: CircularProgressIndicator());
          } else {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Center(child: Image.asset("assets/images/match.png")),

                  if (selectedrole == 1 &&
                      seekerMyProfileDetailsController
                              .SeekerMyProfileDetail
                              .value
                              .ProfileDetails!
                              .spinLeverRequestedData![0]
                              .spinLiverRequestedStatus ==
                          false)
                    SpinWillWidget(),

                  if (selectedrole == 1 &&
                      seekerMyProfileDetailsController
                              .SeekerMyProfileDetail
                              .value
                              .ProfileDetails!
                              .spinLeverRequestedData![0]
                              .spinLiverRequestedStatus ==
                          true)
                    Spined_Spin_Wheel_Widget(),

                  if (selectedrole == 2 &&
                      seekerMyProfileDetailsController
                              .SeekerMyProfileDetail
                              .value
                              .ProfileDetails!
                              .spinLeverRequestedData![1]
                              .spinLiverRequestedStatus ==
                          false)
                    SlotMachine(),

                  if (selectedrole == 1 &&
                      seekerMyProfileDetailsController
                              .SeekerMyProfileDetail
                              .value
                              .ProfileDetails!
                              .spinLeverRequestedData![1]
                              .spinLiverRequestedStatus ==
                          true)
                    LiverPooledWidget(),

                  // if (selectedrole == 2 && islivierpooled == false)
                  //   SlotMachine(),
                  // if (selectedrole == 2 && islivierpooled == true)
                  //   LiverPooledWidget(),

                  SizedBox(
                    height: Get.height * 0.02,
                  ),
//sdfhsdjfsdhfjdshfjdshfjdshfjdshfdsjhfjdshfjdshf
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Request to Maker",
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        InkWell(
                          child: Text(
                            "See all",
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge!
                                .copyWith(color: Color(0xff000CAA)),
                          ),
                          onTap: () {
                            Get.to(SeeAllMaker());
                          },
                        ),
                      ],
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(left: 20),
                    child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: 3,
                      // itemExtent: 80,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              InkWell(
                                child: CircleAvatar(
                                  radius: 45.0,
                                  backgroundImage: NetworkImage(
                                      ListAllMakerControllerinstance.userList
                                          .value.allmakers![index].imgPath
                                          .toString()),
                                  backgroundColor: Colors.transparent,
                                ),
                                onTap: () {
                                  Makerid = ListAllMakerControllerinstance
                                      .userList.value.allmakers![index].id
                                      .toString();
                                  Get.to(ViewMakerProfileInSeeker());
                                },
                              ),
                              SizedBox(
                                width: width * .03,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    ListAllMakerControllerinstance
                                        .userList.value.allmakers![index].name
                                        .toString(),
                                    style:
                                        Theme.of(context).textTheme.titleSmall,
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
                              SizedBox(width: width * .15),
                              GestureDetector(
                                onTap: () {
                                  // showdilog();

                                  // String selectedseekerid= MagicProfileControllerinstance.MagicProfileList.value.requests![index].id.toString();
                                  // print(selectedseekerid);
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
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ); // Default case, return a Widget
          }
        }));
  }
}
//       Obx(() {
//          final ListAllMakerControllerstatus = ListAllMakerControllerinstance.rxRequestStatus.value;
//          final SpeendReqestControllerstatus = SpeendReqestControllerinstance.rxRequestStatus.value;
//          final SeekerToSeekerRequestControllerstatus = SeekerToSeekerRequestControllerinstance.rxRequestStatus.value;
//          final MagicProfileControllerstatus = SeekerToSeekerRequestControllerinstance.rxRequestStatus.value;
//          switch (ListAllMakerControllerinstance.rxRequestStatus.value ) {
//             case Status.LOADING:
//               return const Center(child: CircularProgressIndicator());
//             case Status.ERROR:
//               if (ListAllMakerControllerinstance.error.value == 'No internet') {
//                 return InterNetExceptionWidget(
//                   onPress: () {},
//                 );
//               } else {
//                 return GeneralExceptionWidget(onPress: () {});
//               }
//             case Status.COMPLETED:
//               return
//                 SingleChildScrollView(
//                 child: Column(children: [
//
//                       Center(child: Image.asset("assets/images/match.png")),
//                         if(selectedrole==1&&isspinedwill==false)  SpinWillWidget(),
//                         if(selectedrole==1&&isspinedwill==true)  Spined_Spin_Wheel_Widget(),
//                        if(selectedrole==2&&islivierpooled==false) SlotMachine(),
//                        if(selectedrole==2&&islivierpooled==true) LiverPooledWidget(),
//
//                        SizedBox(height:Get.height*0.02,),
// //sdfhsdjfsdhfjdshfjdshfjdshfjdshfdsjhfjdshfjdshf
//                         Padding(
//                           padding: const EdgeInsets.all(16.0),
//                           child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text(
//                               "Request to Maker",
//                               style: Theme.of(context).textTheme.titleSmall,
//                             ),
//                             InkWell(
//                               child: Text(
//                                 "See all",
//                                 style: Theme.of(context)
//                                     .textTheme
//                                     .labelLarge!
//                                     .copyWith(color: Color(0xff000CAA)),
//                               ),
//                               onTap: (){
//                                 Get.to(SeeAllMaker());
//                               },
//                             ),
//                           ],
//                                               ),
//                         ),
//
//                   Container(
//                     margin: EdgeInsets.only(left: 20),
//                     child: ListView.builder(
//                       physics: NeverScrollableScrollPhysics(),
//                       itemCount:  3,
//                       // itemExtent: 80,
//                       shrinkWrap: true,
//                       itemBuilder: (context, index) {
//
//                         return  Padding(
//                           padding: const EdgeInsets.symmetric(vertical: 10.0),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             children: [
//                               InkWell(
//                                 child: CircleAvatar(
//                                   radius: 45.0,
//                                   backgroundImage: NetworkImage(
//                                       ListAllMakerControllerinstance.userList.value.allmakers![index].imgPath.toString() ) ,
//                                   backgroundColor: Colors.transparent,
//                                 ),
//                                 onTap: (){
//
//                                   Makerid=ListAllMakerControllerinstance.userList.value.allmakers![index].id.toString();
//                                   Get.to(ViewMakerProfileInSeeker());
//                                 },
//                               ),
//                               SizedBox(
//                                 width: width * .03,
//                               ),
//                               Column(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     ListAllMakerControllerinstance.userList.value.allmakers![index].name.toString(),
//                                     style: Theme.of(context).textTheme.titleSmall,
//                                   ),
//                                   SizedBox(
//                                     height: height * .01,
//                                   ),
//                                   Text(
//                                     "Match Maker",
//                                     style: Theme.of(context)
//                                         .textTheme
//                                         .bodySmall!
//                                         .copyWith(color: Colors.grey),
//                                   ),
//                                 ],
//                               ),
//                               SizedBox(width: width * .15),
//                               GestureDetector(
//                                 onTap: () {
//                                   // showdilog();
//
//
//                                   // String selectedseekerid= MagicProfileControllerinstance.MagicProfileList.value.requests![index].id.toString();
//                                   // print(selectedseekerid);
//                                 },
//                                 child: Container(
//                                   height: height * .04,
//                                   width: width * .3,
//                                   decoration: BoxDecoration(
//                                     color: Color(0xffFE0091),
//                                     borderRadius: BorderRadius.circular(15),
//                                   ),
//                                   child: Center(
//                                     child: Text(
//                                       "Request",
//                                       style: Theme.of(context)
//                                           .textTheme
//                                           .bodySmall!
//                                           .copyWith(color: Colors.white),
//                                     ),
//                                   ),
//                                 ),
//                               )
//                             ],
//                           ),
//                         );
//                       },
//                     ),)
//                 ],),
//               );
//     }
//       }
//       )

