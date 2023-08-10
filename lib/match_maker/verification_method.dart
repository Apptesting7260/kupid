
import 'package:http/http.dart' as http;
import 'package:cupid_match/GlobalVariable/GlobalVariable.dart';
import 'package:cupid_match/match_maker/photo_access.dart';
import 'package:cupid_match/models/CountryModel/country_model.dart';
import 'package:cupid_match/widgets/my_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/country_controller.dart';
import '../country_name_with_flag_widget.dart';
import '../utils/app_colors.dart';

enum SelectProfile {National,Passport,Driver}

class VerificationMethod extends StatefulWidget {
  const VerificationMethod({Key? key}) : super(key: key);

  @override
  State<VerificationMethod> createState() => _VerificationMethodState();
}

class _VerificationMethodState extends State<VerificationMethod> {
  CountryController countryController = Get.put(CountryController());
  //*********************** country code method fake ***********************
  void showCountryDropdown(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        List<String> countryNames = countryController.userList.value.countries!
            .map((country) => country.name.toString())
            .toList();

        return AlertDialog(
          content:
          DropdownButton<String>(
            icon: Icon(Icons.keyboard_arrow_down_outlined,color: Colors.pink,size: 20,),
            isExpanded:true,
            underline: Container(), // Hide the default underline
            style: TextStyle(
              fontSize: 18,
              color: Colors.black,
            ),
            selectedItemBuilder: (BuildContext context) {
              return countryNames.map((String value) {
                return Text(
                  value,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.pink,
                  ),
                );
              }).toList();
            },
            items: countryNames.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value,style: TextStyle(color: Colors.black,fontWeight: FontWeight.w700),),
              );
            }).toList(),
            onChanged: (String? newValue) {
              // Handle dropdown selection here
              print(newValue);
            },
          ),
        );
      },
    );
  }

  final seachcountry =TextEditingController();
  List<Countries> searchCountryList = [];


  SelectProfile selectProfile = SelectProfile.National;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    countryController.userListApi();
  }
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {
          Get.back();
        },
            icon: Icon(Icons.arrow_back,color: Color(0xff5A5A5A), size: 27,)),
        title: Text(
          "Payment",
          style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          SizedBox(height: height * 0.03,),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: width * 0.04,),
            child: Text(
              "Proof of Residency",
              style: Theme.of(context).textTheme.displayLarge?.copyWith(fontWeight: FontWeight.w600),
            ),
          ),
          SizedBox(height: height * 0.05,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.04),
            child: Text(
              "Nationality",
              style: Theme.of(context).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600,fontSize: 14),
            ),
          ),
          SizedBox(height: height * 0.022,),
          ///********************** working on country code *(******************************
          Container(
              height: Get.height*0.134,
              child: CustomCountryNameFlag()),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.04),
            child: Text(
              "Verification Method",
              style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600,fontSize: 14),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width  *0.04,vertical: height * .02),
            child: Container(
              height: height * .07,
              decoration: BoxDecoration(
                color: Color(0xffF9FAFB),
                borderRadius: BorderRadius.circular(35),
                border: Border.all(color:selectProfile == SelectProfile.National? Color(0xffFE008F) : Colors.grey),
              ),
              child: Center(
                child: RadioListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: width*.02),
                  visualDensity: VisualDensity(horizontal: -4),
                  title: Text("National identity card",  style: Theme.of(context).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600,fontSize: 14),),
                  value: SelectProfile.National,
                  groupValue: selectProfile,
                  activeColor: Color(0xffFE0091),
                  onChanged: (value){
                    setState(() {
                      selectProfile = value!;
                      verification_method="Votor";

                      print(verification_method);
                    });
                  },
                ),
              ),
              // child: Row(
              //   children: [
              //     Expanded(
              //         child: ListTile(
              //           title: Row(
              //             children: [
              //               Radio(
              //                   value: SelectProfile.National,
              //                   groupValue: selectProfile,
              //                   activeColor: Color(0xffFE008F),
              //                   onChanged: (value) {
              //                     setState(() {
              //                      selectProfile = value!;
              //                     });
              //                   },
              //               ),
              //               Text(
              //                   "National identity card",
              //               style: Theme.of(context).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600,fontSize: 14),
              //               )
              //             ],
              //           ),
              //         )),
              //   ],
              // ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width  *0.04,vertical: height * .02),
            child: Container(
              height: height * .07,
              decoration: BoxDecoration(
                color: Color(0xffF9FAFB),
                borderRadius: BorderRadius.circular(35),
                border: Border.all(color:selectProfile == SelectProfile.Passport? Color(0xffFE008F) : Colors.grey),
              ),
              child: Center(
                child: RadioListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: width*.02),
                  visualDensity: VisualDensity(horizontal: -4),
                  title: Text("Passport",  style: Theme.of(context).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600,fontSize: 14),),
                  value: SelectProfile.Passport,
                  groupValue: selectProfile,
                  activeColor: Color(0xffFE0091),
                  onChanged: (value){
                    setState(() {
                      selectProfile = value!;
                      verification_method="Passport";
                      print(verification_method);
                    });
                  },
                ),
              ),

            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.04,vertical: height * .02),
            child: Container(
              height: height * .07,
              decoration: BoxDecoration(
                color: Color(0xffF9FAFB),
                borderRadius: BorderRadius.circular(35),
                border: Border.all(color: selectProfile == SelectProfile.Driver? Color(0xffFE008F) : Colors.grey),
              ),
              child: Center(
                child: RadioListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: width*.02),
                  visualDensity: VisualDensity(horizontal: -4),
                  title: Text("Driver License",  style: Theme.of(context).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600,fontSize: 14),),
                  value: SelectProfile.Driver,
                  groupValue: selectProfile,
                  activeColor: Color(0xffFE0091),
                  onChanged: (value){
                    setState(() {
                      selectProfile = value!;
                      verification_method="Driver License";

                      print(verification_method);
                    });
                  },
                ),
              ),

            ),
          ),
          SizedBox(height: height * .02,),
          Align(
            alignment: Alignment.center,
            child: MyButton(
                width: width*0.8,
                title: "Continue", onTap: (){
              Get.to(GalleryAccess());
            }),
          ),
          SizedBox(height: height*.1,),
        ],
      ),
    );
  }
}
