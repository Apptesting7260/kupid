import 'dart:async';

import 'package:cupid_match/match_maker/addbio_maker.dart';
import 'package:cupid_match/match_seeker/home_screen.dart';
import 'package:cupid_match/match_seeker/lever/lever_pull.dart';
import 'package:cupid_match/match_seeker/lever/new_liver.dart';
import 'package:cupid_match/match_seeker/message_screen.dart';
import 'package:cupid_match/match_seeker/profile/filter.dart';
import 'package:cupid_match/match_seeker/profile/profile_details.dart';
import 'package:cupid_match/match_seeker/tab_screen.dart';
import 'package:cupid_match/widgets/my_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Chose_Role_Type extends StatefulWidget {
  const Chose_Role_Type({Key? key}) : super(key: key);

  @override
  State<Chose_Role_Type> createState() => _Chose_Role_TypeState();
}

class _Chose_Role_TypeState extends State<Chose_Role_Type> {

int ?rolevalue=1;
int ?selectedrole;
bool isloadding=false;
ChoseRole()async{
  final SharedPreferences prefs = await SharedPreferences.getInstance();

   await prefs.setInt('roll',rolevalue!);
selectedrole=prefs.getInt("roll");
 print(prefs.getInt("roll"));
}



@override
  void initState() {


    // TODO: implement initState


    super.initState();
  }
  int _value = 1;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Choose one",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            SizedBox(
              height: height * .02,
            ),
            Container(
              height: height * .075,
              width: width * 1,
              decoration: BoxDecoration(
                  border: _value != 1
                      ? Border.all(color: Colors.grey)
                      : Border.all(color: Color(0xffFE0091)),
                  borderRadius: BorderRadius.circular(35)),
              child: RadioListTile(
                  title: Text(
                    "Spin Wheel",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: Colors.black),
                  ),
                  value: 1,
                  groupValue: _value,
                  onChanged: (val) {
                    setState(() {
                      _value = val!;
                       rolevalue=val;
                    });
                  },
                  activeColor: Color(0xffFE0091)),
            ),
            SizedBox(
              height: height * .02,
            ),
            Container(
              height: height * .075,
              width: width * 1,
              decoration: BoxDecoration(
                  border: _value != 2
                      ? Border.all(color: Colors.grey)
                      : Border.all(color: Color(0xffFE0091)),
                  borderRadius: BorderRadius.circular(35)),
              child: RadioListTile(
                  title: GestureDetector(
                    onTap: () {},
                    child: Text(
                      "Lever Pull",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: Colors.black),
                    ),
                  ),
                  value: 2,
                  groupValue: _value,
                  onChanged: (val) {
                    setState(() {
                      _value = val!;
                      rolevalue=val;
                    });
                  },
                  activeColor: Color(0xffFE0091)),
            ),
            SizedBox(
              height: height * .02,
            ),
            Center(
              child: MyButton(
                loading: isloadding,
                title: "Next",
                onTap: () {


                  setState(() {
                          isloadding=true;
                  });
     
 ChoseRole();
 Timer(Duration(seconds: 2), () {       if(selectedrole!=null){
  isloadding=false;
Get.off(
                  
                   
                     TabScreen(index: 0)
                     );
              }});
        
                   
                  
                  //    ;
                
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
