import 'package:cached_network_image/cached_network_image.dart';
import 'package:cupid_match/GlobalVariable/GlobalVariable.dart';
import 'package:cupid_match/controllers/controller/DoMatchesController/DoMachesController.dart';
import 'package:cupid_match/controllers/controller/ProfileScrollController.dart/ProfileScrollController.dart';
import 'package:cupid_match/data/response/status.dart';
import 'package:cupid_match/match_maker/chat_screen.dart';
import 'package:cupid_match/res/components/general_exception.dart';
import 'package:cupid_match/res/components/internet_exceptions_widget.dart';
import 'package:cupid_match/utils/app_colors.dart';
import 'package:cupid_match/widgets/my_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MatchScreen extends StatefulWidget {
  @override
  _MatchScreenState createState() => _MatchScreenState();
}

class _MatchScreenState extends State<MatchScreen> {
  

final DoMatchesControllerinstance=Get.put(DoMatchesController());
  final ProfileScrollControllerinstance=Get.put(ProfileScrollController());
  PageController _controller1 = PageController(viewportFraction: 0.6);
  PageController _controller2 = PageController(viewportFraction: 0.6);
  int _topItem1 = 0;
  int _topItem2 = 0;

  @override
  void initState() {
    ProfileScrollControllerinstance.ProfileScrollApiHit();
    super.initState();
  }

  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    double topPosition = MediaQuery.of(context).size.height * 0.18;

    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
    
          leading: InkWell(child: Icon(Icons.arrow_back),onTap: (){
            Get.back();
          },),
          title: Text(
            "Create Match",
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
        
        body:Obx(() {
          switch (ProfileScrollControllerinstance.rxRequestStatus.value) {
            case Status.LOADING:
              return const Center(child: CircularProgressIndicator());
            case Status.ERROR:
              if (ProfileScrollControllerinstance.error.value == 'No internet') {
                return InterNetExceptionWidget(
                  onPress: () {},
                );
              } else {
                return GeneralExceptionWidget(onPress: () {});
              }
            case Status.COMPLETED:
              return Stack(
          children: [
            Container(
              color: Colors.white,
              child: Row(
                children: <Widget>[
                  buildPageView2(_controller1, _topItem1, 0, (value) {
                    setState(() {
                      _topItem1 = value;
                    });
                  }),
                  buildPageView(_controller2, _topItem2, 1, (value) {
                    setState(() {
                      _topItem2 = value;
                    });
                  }),
                ],
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              height: topPosition,
              child: Container(
                height: topPosition,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(
                  left: 10,
                  right: 10,
                  top: 10,
                ),
                alignment: Alignment.center,
                child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    height: topPosition,
                    width: MediaQuery.of(context).size.width - 20,
                    // padding: EdgeInsets.all(20),
                    alignment: Alignment.center,
                    child: Image.asset(
                      'assets/images/banner.png',
                      fit: BoxFit.cover,
                    )),
                color: Colors.white,
              ),
            ),
            Positioned(
              top: topPosition + MediaQuery.of(context).size.height * 0.07,
              left: 0,
              right: 0,
              child: Center(
                child: Container(
                  decoration: BoxDecoration(),
                  height: MediaQuery.of(context).size.width * 0.29,
                  width: MediaQuery.of(context).size.width * 0.29,
                  child: FloatingActionButton(
                    onPressed: () {

                      print('item 1st ->  ' + '$_topItem1');
                      match_fromid=ProfileScrollControllerinstance.ProfileScrollList.value.allseekers!.maleList![_topItem1].id.toString();
                      print(ProfileScrollControllerinstance.ProfileScrollList.value.allseekers!.maleList![_topItem1].name.toString());

          match_withid=ProfileScrollControllerinstance.ProfileScrollList.value.allseekers!.femaleList![_topItem2].id.toString();
                      print('item 2nd ->  ' + '$_topItem2');
                      print(ProfileScrollControllerinstance.ProfileScrollList.value.allseekers!.femaleList![_topItem2].name.toString());
if(match_fromid!=null&&match_withid!=null){
  DoMatchesControllerinstance.DoMatchesApiHit();
  if(DoMatchesControllerinstance.DoMatches.value.msg=="Match request sent Successfully") {
    ShowDialog(context);}
}
                    },
                    child: Container(
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("assets/images/Mask2.png", height: 30),
                          Image.asset("assets/images/Mask1.png", height: 30),
                        ],
                      ),
                    ),
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        MediaQuery.of(context).size.width * 0.3,
                      ),
                      side: BorderSide(
                        color: Colors.pink.shade400,
                        width: 4,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
  }}))
    );
  }

  Expanded buildPageView(PageController controller, int currentPage, int idx,
      Function(int) updateState) {
    return Expanded(
      child: NotificationListener<ScrollNotification>(
        onNotification: (scrollNotification) {
          if (scrollNotification is ScrollEndNotification) {
            updateState(controller.page!.round());
          }
          return true;
        },
        child: PageView.builder(
          scrollDirection: Axis.vertical,
          physics: BouncingScrollPhysics(),
          controller: controller,
          itemCount: ProfileScrollControllerinstance.ProfileScrollList.value.allseekers!.femaleList!.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(13),
                border: Border.all(
                  color:
                      index == currentPage ? Colors.pink.shade400 : Colors.grey,
                  width: index == currentPage ? 1.5 : .6,
                ),
              ),
              height: MediaQuery.of(context).size.height * 0.5,
              child: Stack(
                children: [
            Container(
    padding: EdgeInsets.all(15),
    child: Column(
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 10),
          // decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              height: Get.height*0.25,
              width: Get.width*0.3,
              child: CachedNetworkImage(
  imageUrl: ProfileScrollControllerinstance.ProfileScrollList.value.allseekers!.femaleList![index].imgPath.toString(),
  fit: BoxFit.cover,
  placeholder: (context, url) => Center(child: CircularProgressIndicator()), // Placeholder widget while loading
  errorWidget: (context, url, error) => Icon(Icons.error), // Error widget if loading fails
),
              
          //     Image.network(
          //  ProfileScrollControllerinstance.ProfileScrollList.value.allseekers!.femaleList![index].imgPath.toString(),
          //       fit: BoxFit.cover,
          //     ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
               ProfileScrollControllerinstance.ProfileScrollList.value.allseekers!.femaleList![index].name.toString(),
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19,color:Colors.black),
              ),
              SizedBox(
                 height: Get.height*0.001,
              ),
              Text(
                ProfileScrollControllerinstance.ProfileScrollList.value.allseekers!.femaleList![index].occupation.toString(),
                style: TextStyle(fontWeight: FontWeight.w300, fontSize: 12,color:Colors.black),
              ),
              SizedBox(
                height: Get.height*0.001,
              ),
              Text(
                ProfileScrollControllerinstance.ProfileScrollList.value.allseekers!.femaleList![index].address.toString(),
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 10),
              ),
              SizedBox(
                  height: Get.height*0.001,
              ),
              Text(
                "Interest",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13,color:Colors.black),
              ),
              SizedBox(
               height: Get.height*0.001,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Travelling",
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 10,color:Colors.black),
                  ),
                  SizedBox(
                    width: Get.width*0.01,
                  ),
                  Text(
                    "Books",
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 10,color:Colors.black),
                  ),
                ],
              ),
              SizedBox(
                 height: Get.height*0.001,
              ),
              Wrap(
                direction: Axis.horizontal,
                children: [
                 iconText('assets/images/religion_icon.png', ProfileScrollControllerinstance.ProfileScrollList.value.allseekers!.femaleList![index].religion.toString(),),
                  iconText('assets/images/height_icon.png', ProfileScrollControllerinstance.ProfileScrollList.value.allseekers!.femaleList![index].height.toString(),),
                  iconText('assets/images/salary_icon.png', ProfileScrollControllerinstance.ProfileScrollList.value.allseekers!.femaleList![index].salary.toString(),),
                ],
              ),
            ],
          ),
        ),
      ],
    ),),

                  Positioned(
                    bottom: 10,
                    right: 10,
                    child: GestureDetector(
                        onTap: () {},
                        child: Container(
                          padding: EdgeInsets.all(3),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                  color: Colors.pink.shade400, width: 1)),
                          child: Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: 12,
                            color: Colors.pink.shade400,
                          ),
                        )),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Expanded buildPageView2(PageController controller, int currentPage, int idx,
      Function(int) updateState) {
    return Expanded(
      child: NotificationListener<ScrollNotification>(
        onNotification: (scrollNotification) {
          if (scrollNotification is ScrollEndNotification) {
            updateState(controller.page!.round());
          }
          return true;
        },
        child: PageView.builder(
          scrollDirection: Axis.vertical,
          physics: BouncingScrollPhysics(),
          controller: controller,
            itemCount: ProfileScrollControllerinstance.ProfileScrollList.value.allseekers!.maleList!.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(13),
                border: Border.all(
                  color:
                      index == currentPage ? Colors.pink.shade400 : Colors.grey,
                  width: index == currentPage ? 1.5 : .6,
                ),
              ),
              height: MediaQuery.of(context).size.height * 0.5,
              child: Stack(
                children: [
                 Container(
    padding: EdgeInsets.all(15),
    child: Column(
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 10),
          // decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              height: Get.height*0.25,
              width: Get.width*0.3,
              child: 
              
              
              CachedNetworkImage(
  imageUrl: ProfileScrollControllerinstance.ProfileScrollList.value.allseekers!.maleList![index].imgPath.toString(),
  fit: BoxFit.cover,
  placeholder: (context, url) => Center(child: CircularProgressIndicator()), // Placeholder widget while loading
  errorWidget: (context, url, error) => Icon(Icons.error), // Error widget if loading fails
),
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                ProfileScrollControllerinstance.ProfileScrollList.value.allseekers!.maleList![index].name.toString(),
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19,color:Colors.black),
              ),
              SizedBox(
                 height: Get.height*0.001,
              ),
              Text(
                "Fashion Designer",
                style: TextStyle(fontWeight: FontWeight.w300, fontSize: 12,color:Colors.black),
              ),
              SizedBox(
                height: Get.height*0.001,
              ),
              Text(
              ProfileScrollControllerinstance.ProfileScrollList.value.allseekers!.maleList![index].address.toString(),
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 10,color:Colors.black),
              ),
              SizedBox(
                  height: Get.height*0.001,
              ),
              Text(
                "Interest",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13,color:Colors.black),
              ),
              SizedBox(
               height: Get.height*0.001,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Travelling",
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 10,color:Colors.black),
                  ),
                  SizedBox(
                    width: Get.width*0.01,
                  ),
                  Text(
                    "Books",
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 10,color:Colors.black),
                  ),
                ],
              ),
              SizedBox(
                 height: Get.height*0.001,
              ),
              Wrap(
                direction: Axis.horizontal,
                children: [
                  iconText('assets/images/religion_icon.png', ProfileScrollControllerinstance.ProfileScrollList.value.allseekers!.maleList![index].religion.toString(),),
                  iconText('assets/images/height_icon.png', ProfileScrollControllerinstance.ProfileScrollList.value.allseekers!.maleList![index].height.toString(),),
                  iconText('assets/images/salary_icon.png', ProfileScrollControllerinstance.ProfileScrollList.value.allseekers!.maleList![index].salary.toString(),),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  ),
                  Positioned(
                    bottom: 10,
                    right: 10,
                    child: GestureDetector(
                        onTap: () {},
                        child: Container(
                          padding: EdgeInsets.all(3),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                  color: Colors.pink.shade400, width: 1)),
                          child: Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: 12,
                            color: Colors.pink.shade400,
                          ),
                        )),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}



ShowDialog(BuildContext context) {
    List images = [
    "https://images.unsplash.com/photo-1687076613219-fb4b3d94e75a?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxMDh8fHxlbnwwfHx8fHw%3D&auto=format&fit=crop&w=500&q=60",
    "https://images.unsplash.com/photo-1687076613219-fb4b3d94e75a?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxMDl8fHxlbnwwfHx8fHw%3D&auto=format&fit=crop&w=500&q=60",
  ];
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Color(0xffFFFFFF),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Image.asset(
                        "assets/icons/cancel.png",
                        height: MediaQuery.of(context).size.height * .03,
                      )),
                ),
                Image.asset(
                  'assets/maker/heart.png',
                  height: MediaQuery.of(context).size.height * .1,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .02,
                ),
                Text(
                  "Congratulations it's a",
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .01,
                ),
                Text(
                  "Match!",
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall
                      ?.copyWith(color: Color(0xffFE0091)),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * .08,
                  child: ListView.builder(
                    // scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 1,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.all(8),
                        child: ListTile(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.25),
                          leading: Container(
                            width: MediaQuery.of(context).size.width * .09,
                            height: MediaQuery.of(context).size.height * .07,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              reverse: true,
                              itemCount: images.length >= 3 ? 3 : images.length,
                              itemBuilder: (context, index) {
                                return Align(
                                  alignment: Alignment.center,
                                  widthFactor: 0.4,
                                  child: CircleAvatar(
                                    radius: 16,
                                    backgroundColor: AppColors.white,
                                    child: CircleAvatar(
                                      radius: 14,
                                      backgroundImage:
                                          NetworkImage(images[index]),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .01,
                ),
                Text(
                  "Name and Name, 22",
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: Color(0xff000CAA),
                      ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .04,
                ),
                MyButton(
                  height: MediaQuery.of(context).size.height * .05,
                  width: MediaQuery.of(context).size.width * .63,
                  title: 'Leave a note for both',
                  onTap: () {
                   Get.to(ChatScreen());
                  },
                )
              ],
            ),
          );
        });
  }
// Widget profileCard(int index) {
//   return Container(
//     padding: EdgeInsets.all(15),
//     child: Column(
//       children: [
//         Container(
//           margin: EdgeInsets.only(bottom: 10),
//           // decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
//           child: ClipRRect(
//             borderRadius: BorderRadius.circular(20),
//             child: Container(
//               height: Get.height*0.25,
//               width: Get.width*0.3,
//               child: Image.asset(
//                 index == 0 ? 'assets/images/guy.png' : 'assets/images/girl.png',
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//         ),
//         Align(
//           alignment: Alignment.centerLeft,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               Text(
//                 index == 0 ? 'Jake, 22' : 'Skyler, 20',
//                 style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19,color:Colors.black),
//               ),
//               SizedBox(
//                  height: Get.height*0.001,
//               ),
//               Text(
//                 "Fashion Designer",
//                 style: TextStyle(fontWeight: FontWeight.w300, fontSize: 12,color:Colors.black),
//               ),
//               SizedBox(
//                 height: Get.height*0.001,
//               ),
//               Text(
//                 "Jaipur, India",
//                 style: TextStyle(fontWeight: FontWeight.w400, fontSize: 10),
//               ),
//               SizedBox(
//                   height: Get.height*0.001,
//               ),
//               Text(
//                 "Interest",
//                 style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13,color:Colors.black),
//               ),
//               SizedBox(
//                height: Get.height*0.001,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   Text(
//                     "Travelling",
//                     style: TextStyle(fontWeight: FontWeight.w400, fontSize: 10,color:Colors.black),
//                   ),
//                   SizedBox(
//                     width: Get.width*0.01,
//                   ),
//                   Text(
//                     "Books",
//                     style: TextStyle(fontWeight: FontWeight.w400, fontSize: 10,color:Colors.black),
//                   ),
//                 ],
//               ),
//               SizedBox(
//                  height: Get.height*0.001,
//               ),
//               Wrap(
//                 direction: Axis.horizontal,
//                 children: [
//                   iconText('assets/images/religion_icon.png', "Hindu"),
//                   iconText('assets/images/height_icon.png', "6 Feet, 2.8"),
//                   iconText('assets/images/salary_icon.png', "25k Monthly"),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ],
//     ),
//   );
// }

Widget iconText(String img, String text) {
  return Container(
    // margin: EdgeInsets.all(5),
    padding: EdgeInsets.all(5),
    height:Get.height*0.03,
    decoration: BoxDecoration(
      border: Border.all(
        color: Colors.black,
        width: .5,
      ),
      borderRadius: BorderRadius.circular(50),
    ),
    // padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
    child: Row(
      mainAxisSize:
          MainAxisSize.min, // makes the row width to be according to children
      children: [
        Image.asset(img),
        SizedBox(width: 5.0), // space between image and text
        Text(
          text,
          style: TextStyle(fontSize: 10,color:Colors.black),
        ), // text
      ],
    ),
  );
}
