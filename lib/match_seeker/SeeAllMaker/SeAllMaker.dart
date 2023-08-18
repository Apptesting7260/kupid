import 'package:cupid_match/GlobalVariable/GlobalVariable.dart';
import 'package:cupid_match/controllers/controller/GetAllMakerContrioller/GetAllMakerController.dart';
import 'package:cupid_match/controllers/controller/MagicProfileController/MagicProfileConrtroller.dart';
import 'package:cupid_match/match_seeker/viewMakerProfileinseeker/ViewMakerProfile.dart';
import 'package:cupid_match/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SeeAllMaker extends StatefulWidget {
  const SeeAllMaker({super.key});

  @override
  State<SeeAllMaker> createState() => _SeeAllMakerState();
}

class _SeeAllMakerState extends State<SeeAllMaker> {
final _scaffoldKey = GlobalKey<ScaffoldState>();
       final ListAllMakerControllerinstance=Get.put(ListAllMakerController());
  @override
  Widget build(BuildContext context) {
     final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(child: Scaffold(
      
       endDrawer: MyDrawer(),
      appBar: AppBar(title: Text(
                  "List Maker",
                  style: Theme.of(context).textTheme.titleSmall,
                ),actions: [ GestureDetector(
                    onTap: () {
                      _scaffoldKey.currentState!.openEndDrawer();
                    },
                    child: Image.asset("assets/icons/menu.png"))],),
      body:     SingleChildScrollView(
      child: Container(
                            
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          itemCount:  ListAllMakerControllerinstance.userList.value.allmakers!.length,
                          // itemExtent: 80,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            
                            return  Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child:  Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                  InkWell(
                                    child: CircleAvatar(
                                      radius: 30.0,
                                      backgroundImage: NetworkImage(
                                        ListAllMakerControllerinstance.userList.value.allmakers![index].imgPath.toString() ) ,
                                      backgroundColor: Colors.transparent,
                                    ),
                                    onTap: (){
                                      Makerid= ListAllMakerControllerinstance.userList.value.allmakers![index].id.toString();
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
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                       ListAllMakerControllerinstance.userList.value.allmakers![index].name.toString(),
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
                                  SizedBox(width: width * .12),
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
                              )
                            );
                          },
                        ),
                      ),
                    ),),
    ),));
  }
}