import 'dart:async';
import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cupid_match/GlobalVariable/GlobalVariable.dart';
import 'package:cupid_match/controllers/controller/SeekerToSeekerRequestController/SeekerToSeekerRequestController.dart';
import 'package:cupid_match/controllers/controller/StaticLiverPoolController/StaticLiverPoolController.dart';
import 'package:cupid_match/data/response/status.dart';
import 'package:cupid_match/match_seeker/SeeAllMaker/SeAllMaker.dart';
import 'package:cupid_match/res/components/internet_exceptions_widget.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';



class LiverPooledWidget extends StatefulWidget {
  @override
  _LiverPooledWidgetState createState() => _LiverPooledWidgetState();
}

class _LiverPooledWidgetState extends State<LiverPooledWidget> {
  final staticLiverpullController = Get.put(StaticLiverPullController());

  bool pulled = false;
  //********************* for timer functions here ok ! *********
  bool shouldShowSpinButton = true;

  bool isVisible = true;
  bool isNotVisible = false;

  final SeekerToSeekerRequestControllerinstance =
      Get.put(SeekerToSeekerRequestController());

  late Timer _spinTimer;

  ///*************************** new method for timer ***********************\

  DateTime? endTime;
  DateTime? startTime;

  @override
  void initState() {
    // TODO: implement initState
        staticLiverpullController.staticLiverPullmethod();
    staticLiverpullController.startTimer();
    super.initState();
   
  }

  @override
  void dispose() {
    _spinTimer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Obx(() {
            switch (staticLiverpullController.rxRequestStatus.value) {
              case Status.LOADING:
                return const Center(child: CircularProgressIndicator());
              case Status.ERROR:
                if (staticLiverpullController.error.value == 'No internet') {
                  return InterNetExceptionWidget(
                    onPress: () {},
                  );
                } else {
                  return SingleChildScrollView();
                }

              case Status.COMPLETED:
                return Container(
                  child: Column(
                    children: [
                      SizedBox(
                        height: Get.height * .06,
                      ),
                      Stack(children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _buildReel(0),
                            _buildReel(1),
                            _buildReel(2),
                          ],
                        ),
                        Positioned(
                            top: pulled == false
                                ? Get.height * 0.04
                                : Get.height * 0.08,
                            right: -Get.width * 0.01,
                            child: pulled == false
                                ? GestureDetector(
                                    child: Container(
                                      height: Get.height * 0.08,
                                      width: Get.width * 0.1,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  "assets/images/liverup.PNG"))),
                                    ),
                                    onTap: () {
                                      // if (pulled == false) {
                                      //   _startSpinning();
                                      // }
                                      // if (pulled == true)
                                      //   Timer(Duration(seconds: 2), () {
                                      //     _stopSpinning();
                                      //   });
                                    },
                                  )
                                : Container(
                                    height: Get.height * 0.08,
                                    width: Get.width * 0.1,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                "assets/images/liverdown.PNG"))),
                                  ))
                      ]),
                      SizedBox(
                        height: Get.height * .03,
                      ),
                      //******************** for timer of next polling

                      Column(
                        children: [
                          Text(
                            "Next Spin",
                            style: Get.theme.textTheme.headlineSmall!.copyWith(
                              color: Color(0xff000CAA),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: height * 0.02),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              //&************ for hours
                              Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(15),
                                      decoration: BoxDecoration(
                                        color: Colors.blue[50],
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Text(
                                        "${staticLiverpullController.remainingHours.toString()}",
                                        style: Get
                                            .theme.textTheme.headlineSmall!
                                            .copyWith(
                                          color: Color(0xff000CAA),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: Get.height * 0.0105),
                                    Text(
                                      "Hour",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .copyWith(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, bottom: 25),
                                child: Text(
                                  ":",
                                  style: Get.theme.textTheme.headlineSmall!
                                      .copyWith(
                                    color: Color(0xff000CAA),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              SizedBox(width: Get.width * 0.025),

                              //&************ for minutes
                              Container(
                                child: Column(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(15),
                                      decoration: BoxDecoration(
                                        color: Colors.blue[50],
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Text(
                                        "${staticLiverpullController.remainingMinutes.toString()}",
                                        style: Get
                                            .theme.textTheme.headlineSmall!
                                            .copyWith(
                                          color: Color(0xff000CAA),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: Get.height * 0.0105),
                                    Text(
                                      "Minute",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .copyWith(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, bottom: 25),
                                child: Text(
                                  ":",
                                  style: Get.theme.textTheme.headlineSmall!
                                      .copyWith(
                                    color: Color(0xff000CAA),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),

                              SizedBox(width: Get.width * 0.025),
                              //&************ for second
                              Container(
                                child: Column(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(15),
                                      decoration: BoxDecoration(
                                        color: Colors.blue[50],
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Text(
                                        "${staticLiverpullController.remainingSeconds.toString()}",
                                        style: Get
                                            .theme.textTheme.headlineSmall!
                                            .copyWith(
                                          color: Color(0xff000CAA),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: Get.height * 0.0105),
                                    Text(
                                      "Second",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .copyWith(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),

                      //******************** for timer of next polling

                      SizedBox(
                        height: Get.height * 0.02,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Request to be matched",
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                            // Text(
                            //   "See all",
                            //   style: Theme.of(context)
                            //       .textTheme
                            //       .labelLarge!
                            //       .copyWith(color: Color(0xff000CAA)),
                            // ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: height * .02,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 20),
                        child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: 3, // Use the shuffled item count
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            print("The lenght of this static data from API");
                            print(staticLiverpullController
                                .staticLiverPullvalue.value.data!.length);
                            final dataofStaticPull = staticLiverpullController
                                .staticLiverPullvalue.value.data![0];
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    height: Get.height * 0.1,
                                    width: Get.width * 0.2,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(100)),
                                      color: Colors.green,
                                      image: DecorationImage(
                                        image: CachedNetworkImageProvider(
                                            dataofStaticPull
                                                .spinLeverpoolRequestedData!
                                                .spinRequestData![index]
                                                .seekerData!
                                                .imgPath
                                                .toString()),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: width * .03),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        dataofStaticPull
                                            .spinLeverpoolRequestedData!
                                            .spinRequestData![index]
                                            .seekerData!
                                            .name
                                            .toString(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall,
                                      ),
                                      SizedBox(height: height * .01),
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
                                  //***************** this is request b
                                  GestureDetector(
                                    onTap: () {
                                      selectedseekerid =
                                          dataofStaticPull.id!.toInt();
                                      if (selectedseekerid != null) {
                                        showdilog(index, selectedseekerid!);
                                      }
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
                      ),
                    ],
                  ),
                );
            }
          });
      
  }

  Widget _buildReel(int index) {
    final dataofStaticPull =
        staticLiverpullController.staticLiverPullvalue.value.data![0];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2.0),
      child: Container(
        width: Get.width * 0.28,
        height: Get.height * 0.25,
        decoration: BoxDecoration(
          border: Border.all(width: 2, color: Color(0xffDC9F3C)),
          borderRadius: BorderRadius.all(Radius.circular(10)),
          gradient: LinearGradient(
            colors: [Color(0xffFE0091), Color(0xff000CAA)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            Container(
              width: Get.width * 0.22,
              height: Get.height * 0.17,
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
                color: Color(0xffDC9F3C),
                image: DecorationImage(
                  image: CachedNetworkImageProvider(
                    dataofStaticPull.spinLeverpoolRequestedData!
                        .spinRequestData![index].seekerData!.imgPath
                        .toString(),
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Text(
                dataofStaticPull.spinLeverpoolRequestedData!
                    .spinRequestData![index].seekerData!.name
                    .toString(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _startSpinning() {
    setState(() {
      pulled = true;

      staticLiverpullController.staticLiverPullvalue.value.data!.shuffle();
      isVisible = !isVisible;
      isNotVisible = !isNotVisible;
      shouldShowSpinButton = false;
    });

    _spinTimer = Timer.periodic(Duration(milliseconds: 100), (timer) {
      setState(() {
        staticLiverpullController.staticLiverPullvalue.value.data!.shuffle();
      });
    });
  }

  void _stopSpinning() {
    _spinTimer.cancel();
    setState(() {
      pulled = false;
    });
    _checkResult();
  }

  void _checkResult() {
    // Add your logic here to determine the outcome
  }

  showdilog(int index, int id) {
    final dataofStaticPull =
        staticLiverpullController.staticLiverPullvalue.value.data![0];

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(32.0))),
          insetPadding: EdgeInsets.all(0),
          title: Column(
            children: [
              Align(
                  alignment: Alignment.bottomRight,
                  child: GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Image.asset("assets/icons/cancel.png"),
                  )),
              Stack(
                children: <Widget>[
                  Center(
                    child: Container(
                      height: Get.height * 0.14,
                      width: Get.width * 0.3,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(100)),
                        color: Colors.green,
                        image: DecorationImage(
                          image: CachedNetworkImageProvider(dataofStaticPull
                              .spinLeverpoolRequestedData!
                              .spinRequestData![index]
                              .seekerData!
                              .imgPath
                              .toString()),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                      top: 80,
                      left: 55,
                      right: 0,
                      child: Image.asset("assets/icons/locked 1.png"))
                ],
              ),
              Text(
                dataofStaticPull.spinLeverpoolRequestedData!
                    .spinRequestData![index].seekerData!.questions
                    .toString(),
                style: Theme.of(context).textTheme.titleSmall,
              ),
              SizedBox(
                height: height * .01,
              ),
              Obx(
                () => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Select an Answer",
                            style: TextStyle(
                              fontSize: 15,
                            )),
                      ],
                    ),
                    RadioListTile<String>(
                      title: Text(dataofStaticPull
                          .spinLeverpoolRequestedData!
                          .spinRequestData![index]
                          .seekerData!
                          .questions!
                          .firstAnswer
                          .toString()),
                      value: dataofStaticPull
                          .spinLeverpoolRequestedData!
                          .spinRequestData![index]
                          .seekerData!
                          .questions!
                          .firstAnswer
                          .toString(),
                      groupValue: staticLiverpullController.selectedAnswer.value
                          .toString(),
                      onChanged: (value) {
                        staticLiverpullController.selectedAnswer.value = value!;

                        staticLiverpullController.selectedAnswer.value
                            .toString();
                        print(staticLiverpullController.selectedAnswer.value
                            .toString());
                      },
                    ),
                    RadioListTile<String>(
                      title: Text(dataofStaticPull
                          .spinLeverpoolRequestedData!
                          .spinRequestData![index]
                          .seekerData!
                          .questions!
                          .secondAnswer
                          .toString()),
                      value: dataofStaticPull
                          .spinLeverpoolRequestedData!
                          .spinRequestData![index]
                          .seekerData!
                          .questions!
                          .secondAnswer
                          .toString(),
                      groupValue: staticLiverpullController.selectedAnswer.value
                          .toString(),
                      onChanged: (value) {
                        staticLiverpullController.selectedAnswer.value = value!;

                        staticLiverpullController.selectedAnswer.value
                            .toString();
                        print(staticLiverpullController.selectedAnswer.value
                            .toString());
                      },
                    ),
                    RadioListTile<String>(
                      title: Text(dataofStaticPull
                          .spinLeverpoolRequestedData!
                          .spinRequestData![index]
                          .seekerData!
                          .questions!
                          .secondAnswer
                          .toString()),
                      value: dataofStaticPull
                          .spinLeverpoolRequestedData!
                          .spinRequestData![index]
                          .seekerData!
                          .questions!
                          .secondAnswer
                          .toString(),
                      groupValue: staticLiverpullController.selectedAnswer.value
                          .toString(),
                      onChanged: (value) {
                        staticLiverpullController.selectedAnswer.value = value!;

                        staticLiverpullController.selectedAnswer.value
                            .toString();
                        print(staticLiverpullController.selectedAnswer.value
                            .toString());
                      },
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  Get.back();
                  if (dataofStaticPull
                          .spinLeverpoolRequestedData!
                          .spinRequestData![index]
                          .seekerData!
                          .questions!
                          .correctAnswer ==
                      staticLiverpullController.selectedAnswer.value
                          .toString()) {
                    showdiog2(index);
                  }
                  if (dataofStaticPull
                          .spinLeverpoolRequestedData!
                          .spinRequestData![index]
                          .seekerData!
                          .questions!
                          .correctAnswer !=
                      staticLiverpullController.selectedAnswer.value
                          .toString()) {
                    showdiologwronganswer(index);
                  }
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
                      "Submit",
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: Colors.white),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .02,
              ),
            ],
          ),
        );
      },
    );
  }

  showdiog2(int index) {
    final dataofStaticPull =
        staticLiverpullController.staticLiverPullvalue.value.data![0];
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(32.0))),
          insetPadding: EdgeInsets.all(0),
          title: Column(
            children: [
              Align(
                  alignment: Alignment.bottomRight,
                  child: GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Image.asset("assets/icons/cancel.png"),
                  )),
              Stack(
                children: <Widget>[
                  Center(
                    child: Container(
                      height: height * .3,
                      width: width * .3,
                      child: CircleAvatar(
                        radius: 30.0,
                        backgroundImage:
                            NetworkImage(dataofStaticPull.imgPath.toString()),
                        backgroundColor: Colors.transparent,
                      ),
                    ),
                  ),
                  Positioned(
                      top: 80,
                      left: 55,
                      right: 0,
                      child: Image.asset("assets/icons/unlocked 1.png"))
                ],
              ),
              Text(
                "Profile Unlocked",
                style: Theme.of(context).textTheme.titleSmall,
              ),
              SizedBox(
                height: height * .01,
              ),
              Text(
                "Your answer is correct.",
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: Colors.grey),
              ),
              SizedBox(
                height: height * .02,
              ),
              GestureDetector(
                onTap: () {
                  match_withid = dataofStaticPull.id.toString();
                  print(match_withid);
                  SeekerToSeekerRequestControllerinstance
                      .SikerTOSikerRequestApiHit();
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
                      "Message",
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: Colors.white),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .02,
              ),
            ],
          ),
        );
      },
    );
  }

  showdiologwronganswer(int index) {
    final dataofStaticPull =
        staticLiverpullController.staticLiverPullvalue.value.data![0];
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(32.0))),
          insetPadding: EdgeInsets.all(0),
          title: Column(
            children: [
              Align(
                  alignment: Alignment.bottomRight,
                  child: GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Image.asset("assets/icons/cancel.png"),
                  )),
              Stack(
                children: <Widget>[
                  Center(
                    child: Container(
                      height: height * .3,
                      width: width * .3,
                      child: CircleAvatar(
                        radius: 30.0,
                        backgroundImage:
                            NetworkImage(dataofStaticPull.imgPath.toString()),
                        backgroundColor: Colors.transparent,
                      ),
                    ),
                  ),
                  Positioned(
                      top: 80,
                      left: 50,
                      right: 0,
                      child: Image.asset("assets/icons/locked 1.png"))
                ],
              ),
              Text(
                "Profile locked",
                style: Theme.of(context).textTheme.titleSmall,
              ),
              SizedBox(
                height: height * .01,
              ),
              Text(
                "Better Luck Next Time!",
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: Colors.grey),
              ),
              SizedBox(
                height: height * .02,
              ),
              GestureDetector(
                onTap: () {
                  Get.back();
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
                      "Back",
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: Colors.white),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .02,
              ),
              InkWell(
                child: Container(
                  height: height * .04,
                  width: width * .4,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Color(0xffFE0091))),
                  child: Center(
                    child: Text("Request To Maker",
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              color: Color(0xffFE0091),
                            )),
                  ),
                ),
                onTap: () {
                  Get.back();
                  Timer(Duration(microseconds: 2), () {
                    Get.to(SeeAllMaker());
                  });
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
