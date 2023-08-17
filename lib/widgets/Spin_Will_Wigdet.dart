import 'package:cached_network_image/cached_network_image.dart';
import 'package:cupid_match/controllers/controller/MagicProfileController/MagicProfileConrtroller.dart';
import 'package:cupid_match/match_seeker/choose_one.dart';
import 'package:cupid_match/match_seeker/home_screen.dart';
import 'package:cupid_match/match_seeker/siker_Home_Screen.dart';
import 'package:cupid_match/widgets/my_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:rxdart/subjects.dart';
import 'package:shared_preferences/shared_preferences.dart';


class SpinWillWidget extends StatefulWidget {
  const SpinWillWidget({super.key});

  @override
  State<SpinWillWidget> createState() => _SpinWillWidgetState();
}

class _SpinWillWidgetState extends State<SpinWillWidget> {
    final MagicProfileControllerinstance = Get.put(MagicProfileController());

  List<int> items = [100, 200, 300, 400, ];
  List<Color> colorstwo = [
    Color(0xffFF1616),
    Color(0xffFF914D),
    Color(0xffFFDE59),
    Color(0xff7ED957),

  ];

  final selected = BehaviorSubject<int>();





    bool isVisible = true;
  bool isNotVisible = false;



  int rewards = 0;
  int selectedRadioTile = 0;





  @override
  void initState() {
    print("object");
    MagicProfileControllerinstance.MagicProfileApiHit();
    // TODO: implement initState
    super.initState();
    selectedRadioTile = 0;
  }

  setSelectedRadioTile(int value) {
    setState(() {
      selectedRadioTile = value;
    });
  }

  @override
  void dispose() {
    selected.close();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    MagicProfileControllerinstance.MagicProfileApiHit();
        final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      child: Column(
            children: [
              
              
              SizedBox(
                height: height * .05,
              ),
              Center(
                child: (isVisible = !isNotVisible)
                    ? Text(
                        "Find Your Matches",
                        style: Theme.of(context).textTheme.titleLarge,
                      )
                    : Text(
                        "Select Your 2 Matches",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
              ),
              SizedBox(
                height: height * .03,
              ),

              CircleAvatar(radius: 150,backgroundImage: AssetImage("assets/images/spinner2.PNG"),child: Center(child: CircleAvatar(radius: 130, child:
              Obx(() {
                return  FortuneWheel(
                  indicators: <FortuneIndicator>[
                    FortuneIndicator(
                        alignment: Alignment
                            .center, // <-- changing the position of the indicator
                        child: Stack(
                          children: [
                            Container(
                              height: Get.height*0.1,
                              child: Image.asset("assets/images/pin.PNG"),),

                              Positioned(
                                top: 29,
                                left: 11,
                                child: CircleAvatar(radius: 21,))
                            // TriangleIndicator()
                          ],
                        )

                      
                        ),
                  ],
                  physics: NoPanPhysics(),

                  // duration: Duration(seconds: 200),
                  // rotationCount: 1000000,
                  // onFling: ,
                  // styleStrategy: StyleStrategy
                  selected: selected.stream,
                  animateFirst: true,
                  onAnimationEnd: () {
                    setState(() {
                      rewards = items[selected.value];
                      print(selected.value);
                    });
                    print(rewards);
                  },
                  items: [
                  
                    for (int i = 0; i < 4; i++) ...<FortuneItem>{
FortuneItem(
  style: FortuneItemStyle(borderColor: Colors.amber,color:colorstwo[i]),
  child:Row(
    children: [

      SizedBox(width:Get.width*0.15,),
       
      CircleAvatar(radius: 30,backgroundImage: NetworkImage(MagicProfileControllerinstance. slotImages[i]),),
     
    ],
  )
   



),


       
                    }
                  ]);
              })
              ,),),),
     
              SizedBox(
                height: height * .03,
              ),
              Visibility(
                visible: isVisible,
                child: Center(
                  child: MyButton(
                    title: "Spin Now",
                    onTap: () {
                      setState(() {
                        selected.add(Fortune.randomInt(0, items.length));
                        isVisible = !isVisible;
                        isNotVisible = !isNotVisible;
                      });
                    },
                  ),
                ),
              ),
              SizedBox(
                height: height * .02,
              ),
              Visibility(
                visible: isNotVisible,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Request to be matched",
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    Text(
                      "See all",
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge!
                          .copyWith(color: Color(0xff000CAA)),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: height * .02,
              ),
              Visibility(
                visible: isNotVisible,
                child: Container(
                  width: width * 1,
                  height: height * .2,
                  child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 2,
                    itemExtent: 80,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: 30.0,
                            backgroundImage: NetworkImage(
                                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR2av8pAdOHJdgpwkYC5go5OE07n8-tZzTgwg&usqp=CAU"),
                            backgroundColor: Colors.transparent,
                          ),
                          SizedBox(
                            width: width * .03,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "John Deo",
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
                          SizedBox(width: width * .17),
                          GestureDetector(
                            onTap: () {
                              showDialog(
                                barrierDismissible: false,
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(32.0))),
                                    insetPadding: EdgeInsets.all(0),
                                    title: Column(
                                      children: [
                                        Align(
                                            alignment: Alignment.bottomRight,
                                            child: GestureDetector(
                                              onTap: () {
                                                Get.back();
                                              },
                                              child: Image.asset(
                                                  "assets/icons/cancel.png"),
                                            )),
                                        Stack(
                                          children: <Widget>[
                                            Center(
                                              child: Container(
                                                height: height * .3,
                                                width: width * .3,
                                                child: CircleAvatar(
                                                  radius: 30.0,
                                                  backgroundImage: NetworkImage(
                                                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR2av8pAdOHJdgpwkYC5go5OE07n8-tZzTgwg&usqp=CAU"),
                                                  backgroundColor:
                                                      Colors.transparent,
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                                top: 80,
                                                left: 55,
                                                right: 0,
                                                child: Image.asset(
                                                    "assets/icons/locked 1.png"))
                                          ],
                                        ),
    
                                        Text(
                                          "How old do you think i am",
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall,
                                        ),
                                        // Column(
                                        //   children: [
                                        //     RadioListTile(
                                        //       activeColor: Color(0xffFE0091),
                                        //       value: 1,
                                        //       groupValue: selectedRadioTile,
                                        //       title: Text("20"),
                                        //       onChanged: (value) {
                                        //         print("Radio Tile pressed $value");
                                        //         setSelectedRadioTile(value!);
                                        //       },
                                        //     ),
                                        //     RadioListTile(
                                        //       activeColor: Color(0xffFE0091),
                                        //       value: 2,
                                        //       groupValue: selectedRadioTile,
                                        //       title: Text("30"),
                                        //       onChanged: (value) {
                                        //         print("Radio Tile pressed $value");
                                        //         setSelectedRadioTile(value!);
                                        //       },
                                        //     ),
                                        //     RadioListTile(
                                        //       activeColor: Color(0xffFE0091),
                                        //       value: 3,
                                        //       groupValue: selectedRadioTile,
                                        //       title: Text("40"),
                                        //       onChanged: (value) {
                                        //         print("Radio Tile pressed $value");
                                        //         setSelectedRadioTile(value!);
                                        //       },
                                        //     ),
                                        //   ],
                                        // ),
                                        SizedBox(
                                          height: height * .01,
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            showDialog(
                                              barrierDismissible: false,
                                              context: context,
                                              builder: (context) {
                                                return AlertDialog(
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  32.0))),
                                                  insetPadding: EdgeInsets.all(0),
                                                  title: Column(
                                                    children: [
                                                      Align(
                                                          alignment: Alignment
                                                              .bottomRight,
                                                          child: GestureDetector(
                                                            onTap: () {
                                                              Get.back();
                                                            },
                                                            child: Image.asset(
                                                                "assets/icons/cancel.png"),
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
                                                                    NetworkImage(
                                                                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR2av8pAdOHJdgpwkYC5go5OE07n8-tZzTgwg&usqp=CAU"),
                                                                backgroundColor:
                                                                    Colors
                                                                        .transparent,
                                                              ),
                                                            ),
                                                          ),
                                                          Positioned(
                                                              top: 80,
                                                              left: 55,
                                                              right: 0,
                                                              child: Image.asset(
                                                                  "assets/icons/unlocked 1.png"))
                                                        ],
                                                      ),
                                                      Text(
                                                        "Profile Unlocked",
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .titleSmall,
                                                      ),
                                                      SizedBox(
                                                        height: height * .01,
                                                      ),
                                                      Text(
                                                        "Your answer is correct.",
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .bodySmall!
                                                            .copyWith(
                                                                color:
                                                                    Colors.grey),
                                                      ),
                                                      SizedBox(
                                                        height: height * .02,
                                                      ),
                                                      GestureDetector(
                                                        onTap: () {
                                                          showDialog(
                                                            barrierDismissible:
                                                                false,
                                                            context: context,
                                                            builder: (context) {
                                                              return AlertDialog(
                                                                shape: RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.all(
                                                                            Radius.circular(
                                                                                32.0))),
                                                                insetPadding:
                                                                    EdgeInsets
                                                                        .all(0),
                                                                title: Column(
                                                                  children: [
                                                                    Align(
                                                                        alignment:
                                                                            Alignment
                                                                                .bottomRight,
                                                                        child:
                                                                            GestureDetector(
                                                                          onTap:
                                                                              () {
                                                                            Get.back();
                                                                          },
                                                                          child: Image.asset(
                                                                              "assets/icons/cancel.png"),
                                                                        )),
                                                                    Stack(
                                                                      children: <Widget>[
                                                                        Center(
                                                                          child:
                                                                              Container(
                                                                            height:
                                                                                height * .3,
                                                                            width:
                                                                                width * .3,
                                                                            child:
                                                                                CircleAvatar(
                                                                              radius:
                                                                                  30.0,
                                                                              backgroundImage:
                                                                                  NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR2av8pAdOHJdgpwkYC5go5OE07n8-tZzTgwg&usqp=CAU"),
                                                                              backgroundColor:
                                                                                  Colors.transparent,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Positioned(
                                                                            top:
                                                                                80,
                                                                            left:
                                                                                50,
                                                                            right:
                                                                                0,
                                                                            child:
                                                                                Image.asset("assets/icons/locked 1.png"))
                                                                      ],
                                                                    ),
                                                                    Text(
                                                                      "Profile locked",
                                                                      style: Theme.of(
                                                                              context)
                                                                          .textTheme
                                                                          .titleSmall,
                                                                    ),
                                                                    SizedBox(
                                                                      height:
                                                                          height *
                                                                              .01,
                                                                    ),
                                                                    Text(
                                                                      "Better Luck Next Time!",
                                                                      style: Theme.of(
                                                                              context)
                                                                          .textTheme
                                                                          .bodySmall!
                                                                          .copyWith(
                                                                              color:
                                                                                  Colors.grey),
                                                                    ),
                                                                    SizedBox(
                                                                      height:
                                                                          height *
                                                                              .02,
                                                                    ),
                                                                    GestureDetector(
                                                                      onTap: () {
                                                                        Get.to(() =>
                                                                            SikerHomeScreen());
                                                                      },
                                                                      child:
                                                                          Container(
                                                                        height:
                                                                            height *
                                                                                .04,
                                                                        width:
                                                                            width *
                                                                                .3,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color: Color(
                                                                              0xffFE0091),
                                                                          borderRadius:
                                                                              BorderRadius.circular(15),
                                                                        ),
                                                                        child:
                                                                            Center(
                                                                          child:
                                                                              Text(
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
                                                                      height: MediaQuery.of(context)
                                                                              .size
                                                                              .height *
                                                                          .02,
                                                                    ),
                                                                  ],
                                                                ),
                                                              );
                                                            },
                                                          );
                                                        },
                                                        child: Container(
                                                          height: height * .04,
                                                          width: width * .3,
                                                          decoration:
                                                              BoxDecoration(
                                                            color:
                                                                Color(0xffFE0091),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(15),
                                                          ),
                                                          child: Center(
                                                            child: Text(
                                                              "Message",
                                                              style: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .bodySmall!
                                                                  .copyWith(
                                                                      color: Colors
                                                                          .white),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height:
                                                            MediaQuery.of(context)
                                                                    .size
                                                                    .height *
                                                                .02,
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                          child: Container(
                                            height: height * .04,
                                            width: width * .3,
                                            decoration: BoxDecoration(
                                              color: Color(0xffFE0091),
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            ),
                                            child: Center(
                                              child: Text(
                                                "Submit",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodySmall!
                                                    .copyWith(
                                                        color: Colors.white),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height:
                                              MediaQuery.of(context).size.height *
                                                  .02,
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
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
                      );
                    },
                  ),
                ),
              ),
              SizedBox(
                height: height * .02,
              ),
              Visibility(
                visible: isNotVisible,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Request to be matched",
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    Text(
                      "See all",
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge!
                          .copyWith(color: Color(0xff000CAA)),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: height * .02,
              ),
              Visibility(
                visible: isNotVisible,
                child: Container(
                  width: width * 1,
                  height: height * .2,
                  child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 2,
                    itemExtent: 80,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          CircleAvatar(
                            radius: 30.0,
                            backgroundImage: NetworkImage(
                                "https://img.freepik.com/free-photo/smiley-businesswoman-posing-outdoors-with-arms-crossed-copy-space_23-2148767055.jpg"),
                            backgroundColor: Colors.transparent,
                          ),
                          SizedBox(
                            width: width * .05,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Valentina, 20",
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                              SizedBox(
                                height: height * .01,
                              ),
                              Text(
                                "America",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(color: Colors.grey),
                              ),
                            ],
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
    );
  }
}