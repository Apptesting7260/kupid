import 'package:cupid_match/GlobalVariable/GlobalVariable.dart';
import 'package:cupid_match/controllers/controller/GetAllMakerContrioller/GetAllMakerController.dart';
import 'package:cupid_match/controllers/controller/MagicProfileController/MagicProfileConrtroller.dart';
import 'package:cupid_match/match_seeker/viewMakerProfileinseeker/ViewMakerProfile.dart';
import 'package:cupid_match/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/SeekerToMakerController/SeekerToMakerController.dart';

class SeeAllMaker extends StatefulWidget {
  const SeeAllMaker({super.key});

  @override
  State<SeeAllMaker> createState() => _SeeAllMakerState();
}

class _SeeAllMakerState extends State<SeeAllMaker> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final ListAllMakerControllerinstance = Get.put(ListAllMakerController());
  SeekerToMakerRequestController SeekerToMakerRequestControllerinstance=Get.put(SeekerToMakerRequestController());

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
      endDrawer: MyDrawer(),
      appBar: AppBar(
        title: Text(
          "List Maker",
          style: Theme.of(context).textTheme.titleSmall,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(left: 28.0),
            child: GestureDetector(
                onTap: () {
                  _scaffoldKey.currentState!.openEndDrawer();
                },
                child: Image.asset("assets/icons/menu.png")),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListAllMakerControllerinstance
                .userList.value.allmakers!.length!=0 ?Container(
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: ListAllMakerControllerinstance
                    .userList.value.allmakers!.length,
                // itemExtent: 80,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          //width: Get.width*0.35,
                          //height: Get.height*0.2,
                          Row(
                            children: [
                              InkWell(
                                child: CircleAvatar(
                                  radius: 25.0,
                                  backgroundImage: NetworkImage(
                                      ListAllMakerControllerinstance
                                          .userList.value.allmakers![index].imgPath
                                          .toString()),
                                  backgroundColor: Colors.transparent,
                                ),
                                onTap: () {
                                  Makerid = ListAllMakerControllerinstance
                                      .userList.value.allmakers![index].id
                                      .toString();
                                  setState(() {
                                    Makerid;
                                    print(Makerid);
                                  });
                                  Get.to(ViewMakerProfileInSeeker());
                                },
                              ),
                              SizedBox(
                                width: width * .03,
                              ),
                              Container(
                                width: Get.width*0.25,
                                height: Get.height*0.1,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [

                                    Text(
                                      ListAllMakerControllerinstance
                                          .userList.value.allmakers![index].name
                                          .toString(),
                                      style: Theme.of(context).textTheme.titleSmall,
                                      overflow: TextOverflow.ellipsis,
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
                              ),
                              SizedBox(width: width * .08),
                            ],
                          ),
                          GestureDetector(
                            onTap: () {

                              Makerid=ListAllMakerControllerinstance
                                  .userList.value.allmakers![index].id.toString();

                              SeekerToMakerRequestControllerinstance.SeekerToMakerRequestApiHit(context);
                            },
                            child: Container(
                              height: height * .04,
                              width: width * .35,
                              decoration: BoxDecoration(
                                color: Color(0xffFE0091),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Center(
                                child: Text(
                                  "Request To Maker",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(color: Colors.white),
                                ),
                              ),
                            ),
                          )
                          // GestureDetector(
                          //   onTap: () {
                          //     // showdilog();
                          //
                          //     // String selectedseekerid= MagicProfileControllerinstance.MagicProfileList.value.requests![index].id.toString();
                          //     // print(selectedseekerid);
                          //   },
                          //   child: Container(
                          //     height: height * .04,
                          //     width: width * .25,
                          //     decoration: BoxDecoration(
                          //       color: Color(0xffFE0091),
                          //       borderRadius: BorderRadius.circular(15),
                          //     ),
                          //     child: Center(
                          //       child: Text(
                          //         "Request",
                          //         style: Theme.of(context)
                          //             .textTheme
                          //             .bodySmall!
                          //             .copyWith(color: Colors.white),
                          //       ),
                          //     ),
                          //   ),
                          // )
                        ],
                      ));
                },
              ),
            ): Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: height *0.4,
              ),


              Center(child: Text("Data is Empty",style: TextStyle(color: Colors.black)),)
            ],
          ),
          ),
        ),
      ),
    ));
  }
}
