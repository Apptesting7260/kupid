

import 'dart:async';
import 'dart:ui';
import 'package:cupid_match/controllers/controller/MagicProfileController/MagicProfileConrtroller.dart';
import 'package:cupid_match/data/response/status.dart';
import 'package:cupid_match/match_seeker/lever/request_makers.dart';
import 'package:cupid_match/res/components/internet_exceptions_widget.dart';
import 'package:cupid_match/widgets/my_button.dart';
import 'package:flutter/material.dart';
import 'dart:math';

import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class SlotMachine extends StatefulWidget {
  @override
  _SlotMachineState createState() => _SlotMachineState();
}

class _SlotMachineState extends State<SlotMachine> {
  final MagicProfileControllerinstance = Get.put(MagicProfileController());
  bool pulled = false;

  bool isVisible = true;
  bool isNotVisible = false;


  
  final Random _random = Random();
   List<String> _slotImages = [
    'https://imgd.aeplcdn.com/1280x720/n/cw/ec/44686/activa-6g-right-front-three-quarter.jpeg?q=80', // Replace with actual image URLs
    'https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=765&q=80',
    'https://media.istockphoto.com/id/1464605251/photo/portrait-of-a-senior-black-man-on-the-tennis-court.jpg?s=1024x1024&w=is&k=20&c=cVNPufS_pFVAmzf59WjT-dsCYs4kXdu2420khMjSFlA=',
    "https://media.istockphoto.com/id/1416048929/photo/woman-working-on-laptop-online-checking-emails-and-planning-on-the-internet-while-sitting-in.jpg?s=1024x1024&w=is&k=20&c=rsMEfrDiYh3Y2CbJ8OQYRfJZ2kOGBneREKETBn0vyjU=",
    "https://media.istockphoto.com/id/1461077577/photo/spring-portrait-of-excited-young-woman.jpg?s=2048x2048&w=is&k=20&c=4Itt6GMqwqgkotQPvcuasyrrKhmecrDjweCmFHWnx4Q=",
    "https://media.istockphoto.com/id/1443305526/photo/young-smiling-man-in-headphones-typing-on-laptop-keyboard.jpg?s=2048x2048&w=is&k=20&c=YbyIE-QkVeacJODEhS5_LQzJahwiTmZTnism-xUwCLA=",
    "https://media.istockphoto.com/id/1460124878/photo/social-media-connection-and-woman-typing-on-a-phone-for-communication-app-and-chat-web-search.jpg?s=1024x1024&w=is&k=20&c=OEumglh0LddR8e2IG7FWSK-lG76tUhjhQGksCY64ubM=",
"https://media.istockphoto.com/id/1435220822/photo/african-american-software-developer.jpg?s=1024x1024&w=is&k=20&c=htyLzgrvGN1McCRuSkQIrG1BuBmNLJUR-nBBKxb86ko=",
"https://images.unsplash.com/photo-1546019170-f1f6e46039f5?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=764&q=80",
"https://images.unsplash.com/photo-1461800919507-79b16743b257?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=687&q=80",
"https://images.unsplash.com/photo-1536378482916-d6371707105a?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=687&q=80"  ];
  List<String> _slotname = [
    'a', // Replace with actual image URLs
    'b',
    'c',
    "d",
    "e",
    "f",
    "g",
"h",
"i",
"j",
"k"  ];
  List<int> _initialIndices = [0, 1, 2]; // Unique initial indices for each box
  List<int> _currentIndices = [0, 1, 2];
  List<int> _finalIndices = [0, 1, 2];
  bool _isSpinning = false;
  late Timer _spinTimer;
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    MagicProfileControllerinstance.MagicProfileApiHit();
    // TODO: implement initState
    super.initState();
  }
  @override
  void dispose() {
    _spinTimer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
           switch (MagicProfileControllerinstance.rxRequestStatus.value) {
            case Status.LOADING:
              return const Center(child: CircularProgressIndicator());
            case Status.ERROR:
              if (MagicProfileControllerinstance.error.value == 'No internet') {
                return InterNetExceptionWidget(
                  onPress: () {},
                );
              } else {
                return  SingleChildScrollView(
                
                );
              }
              
            case Status.COMPLETED:
              return  Container(
        child: Column(
          children: [
          
         
            SizedBox(
              height: Get.height * .06,
            ),
        Stack(
              children:[ Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildReel(0),
                  _buildReel(1),
                  _buildReel(2),
                ],
              ),
               Positioned(
              top:pulled==false?Get.height*0.04:Get.height*0.08,
              right: Get.width*0.02,
              child: pulled==false?GestureDetector(child: Container(height: Get.height*0.08,width:Get.width*0.1,decoration:BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/liverup.PNG"))),),onTap: () {
                
                
                if(pulled==false){
                      _startSpinning();
                }
               if(pulled==true) Timer(Duration(seconds: 2), () { _stopSpinning();});
            
                }
             ,):Container(height: Get.height*0.08,width:Get.width*0.1,decoration:BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/liverdown.PNG"))),))
          ]),
         
          

             SizedBox(
              height: Get.height * .03,
            ),
              
              Visibility(
                visible: isVisible,
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Please Pull the Lever",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
              ),
              SizedBox(
                height: Get.height * .03,
              ),
              Visibility(
                visible: isNotVisible,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Request to be Makers",
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => RequestMakers());
                      },
                      child: Text(
                        "See all",
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge!
                            .copyWith(color: Color(0xff000CAA)),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: Get.height * .02,
              ),
              Visibility(
                visible: isNotVisible,
                child: Container(
                  width: Get.width * 1,
                  height: Get.height * .2,
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
                            width:Get. width * .03,
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
                                height: Get.height * .01,
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
                          SizedBox(width: Get.width * .17),
                          GestureDetector(
                            onTap: () {},
                            child: MyButton(
                                height: Get.height * .04,
                                width:Get.width * .3,
                                title: "Request",
                                onTap: () {}),
                          )
                        ],
                      );
                    },
                  ),
                ),
              ),  
          ],
        ),
      );}});
  }

  Widget _buildReel(int index) {
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
      
         width: Get.width*0.2,
              // height: Get.height*0.15,
        decoration: BoxDecoration(border: Border.all(width: 2,color: Color(0xffDC9F3C)),borderRadius: BorderRadius.all(Radius.circular(10)
        
        ),  gradient:LinearGradient(
              colors: [Color(0xffFE0091), Color(0xff000CAA)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              // You can customize other properties here as well
              // like stops, tileMode, etc.
            ),),
        
        child: Column(
          children: [
          Container(
             
              width: Get.width*0.15,
              height: Get.height*0.1,
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(border: Border.all(color:Colors.white),   color: Color(0xffDC9F3C),image:DecorationImage(image: NetworkImage(MagicProfileControllerinstance.slotImages[_currentIndices[index]] ),fit: BoxFit.cover)),

              
              
            ), 
            Padding(
              padding: const EdgeInsets.only(bottom:10),
              child: Text(MagicProfileControllerinstance.slotname[_currentIndices[index]],),
            ),
            
           
          ],
        ),
      ),
    );
  }

  void _startSpinning() {
    setState(() {
       isVisible = !isVisible;
                          isNotVisible = !isNotVisible;
      pulled=true;
      _isSpinning = true;
      _currentIndices = _initialIndices.toList();
      _finalIndices = _currentIndices.toList();
    });

    _spinTimer = Timer.periodic(Duration(milliseconds: 100), (timer) {
      setState(() {
     
        _currentIndices = List.generate(
          3,
          (index) => _random.nextInt(_slotImages.length),
        );
      });
    });
  }

  void _stopSpinning() {
    _spinTimer.cancel();
    setState(() {
         pulled=false;
      _isSpinning = false;
      _finalIndices = _currentIndices.toList();
    });
    _checkResult();
  }

  void _checkResult() {
    // Add your logic here to determine the outcome
  }
}

