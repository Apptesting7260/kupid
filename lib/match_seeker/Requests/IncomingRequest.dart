import 'package:cached_network_image/cached_network_image.dart';
import 'package:cupid_match/GlobalVariable/GlobalVariable.dart';
import 'package:cupid_match/controllers/controller/GetAllOcupationsController/GetAllOcupations.dart';
import 'package:cupid_match/controllers/controller/IncomingRequestController/IncomingRequestController.dart';
import 'package:cupid_match/controllers/controller/ViewSikerDetailsController/ViewSikerDetaolsController.dart';
import 'package:cupid_match/controllers/sikerProfileController/sikershortprofilecontrller.dart';
import 'package:cupid_match/data/response/status.dart';
import 'package:cupid_match/match_maker/chat_screen.dart';
import 'package:cupid_match/match_seeker/chat_screen.dart';
import 'package:cupid_match/models/IncomingRequestModel/IncomingRequestModel.dart';
import 'package:cupid_match/res/components/general_exception.dart';
import 'package:cupid_match/res/components/internet_exceptions_widget.dart';
import 'package:cupid_match/utils/app_colors.dart';
import 'package:cupid_match/widgets/my_button.dart';
import 'package:cupid_match/widgets/seekershortprofile.dart';
import 'package:cupid_match/widgets/shortprofilemaker.dart';
import 'package:cupid_match/widgets/shortprofilepopup.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:dropdown_button2/dropdown_button2.dart';


class IncomingRequests extends StatefulWidget {
  const IncomingRequests({Key? key}) : super(key: key);

  @override
  State<IncomingRequests> createState() => _IncomingRequestsState();
}

class _IncomingRequestsState extends State<IncomingRequests> {

  IncomingRequestController Incontroller = Get.put(IncomingRequestController());

@override
  void initState() {
    requestid=null;
    // TODO: implement initState
    super.initState();
  }

  String? selectCityItems;
  var CityItems = ["Jaipur", "Sikar"];

  String? selectLocation;
  var LocationItems = [
    "Rajsthan",
    "Haryana",
  ];

  String? selectRadius;
  var radiusItems = [
    "5Km",
    "10Km",
    "15Km",
    "20Km",
  ];

  String? selectSearch;
  var searchItems = [
    "Rajasthan",
    "Haryana",
  ];

  String? selectLike;
  var likesItems = [
    "100 Like",
    "200 Like",
  ];

  String? confirmMatches;
  var confirmItems = [
    "10 Matches",
    "20 Matches",
  ];

  var _formKey = GlobalKey<FormState>();
  var isLoading = false;

  void _submit() {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    _formKey.currentState!.save();
  }

  //Filter show dialog box
  Future<void> _showDialog(BuildContext context) async {
    await showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        final height = MediaQuery.of(context).size.height;
        final width = MediaQuery.of(context).size.width;
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          // title: Center(child: Text('Sort By')),
          content: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                      alignment: Alignment.topRight,
                      child: InkWell(
                        child: Image.asset(
                          "assets/images/remove.png",
                          height: height * .03,
                        ),
                        onTap: () {
                          Get.back();
                        },
                      )),
                  Center(
                      child: Text(
                    'Sort By',
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall
                        ?.copyWith(fontSize: 17, fontWeight: FontWeight.w600),
                  )),
                  SizedBox(
                    height: height * .05,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                          child: Column(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Select City",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(fontWeight: FontWeight.w600),
                            ),
                          ),
                          SizedBox(
                            height: height * .01,
                          ),
                          DropdownButtonFormField(
                              value: selectCityItems,
                              icon: const Icon(
                                Icons.keyboard_arrow_down,
                                color: Color(0xff000000),
                                size: 22,
                              ),
                              style: Theme.of(context).textTheme.bodyLarge,
                              items: CityItems.map((String items) {
                                return DropdownMenuItem(
                                  value: items,
                                  child: Text(items),
                                );
                              }).toList(),
                              validator: (value) {
                                if (value == null) return "Select your city";
                                return null;
                              },
                              onChanged: (String? newValue) {
                                setState(() {
                                  selectCityItems = newValue!;
                                });
                              },
                              // itemHeight: 20,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: height * .01,
                                    horizontal: width * .04),
                                hintText: "Select",
                                hintStyle: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(
                                        color: AppColors.subtitletextcolor,
                                        fontSize: 12),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide:
                                      BorderSide(color: Colors.pinkAccent),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide:
                                      BorderSide(color: Color(0xffBABABA)),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(35.0)),
                                  borderSide: BorderSide(color: Colors.red),
                                ),
                                disabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(35.0)),
                                  borderSide:
                                      BorderSide(color: Color(0xffBABABA)),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(35.0)),
                                  borderSide: BorderSide(color: Colors.pink),
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide:
                                        BorderSide(color: Color(0xffBABABA))),
                              )),
                        ],
                      )),
                      SizedBox(
                        width: width * .02,
                      ),
                      Flexible(
                          child: Column(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Select State",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(fontWeight: FontWeight.w600),
                            ),
                          ),
                          SizedBox(
                            height: height * .01,
                          ),
                          DropdownButtonFormField(
                              value: selectLocation,
                              icon: const Icon(
                                Icons.keyboard_arrow_down,
                                color: Color(0xff000000),
                                size: 22,
                              ),
                              style: Theme.of(context).textTheme.bodyLarge,
                              items: LocationItems.map((String items) {
                                return DropdownMenuItem(
                                  value: items,
                                  child: Text(items),
                                );
                              }).toList(),
                              validator: (value) {
                                if (value == null) return "Select your state";
                                return null;
                              },
                              onChanged: (String? newValue) {
                                setState(() {
                                  selectLocation = newValue!;
                                });
                              },
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: height * .01,
                                    horizontal: width * .04),
                                hintText: "Select",
                                hintStyle: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(
                                        color: AppColors.subtitletextcolor,
                                        fontSize: 12),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide:
                                      BorderSide(color: Colors.pinkAccent),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide:
                                      BorderSide(color: Color(0xffBABABA)),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(35.0)),
                                  borderSide: BorderSide(color: Colors.red),
                                ),
                                disabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(35.0)),
                                  borderSide:
                                      BorderSide(color: Color(0xffBABABA)),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(35.0)),
                                  borderSide: BorderSide(color: Colors.pink),
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide:
                                        BorderSide(color: Color(0xffBABABA))),
                              )),
                        ],
                      ))
                    ],
                  ),
                  SizedBox(
                    height: height * .03,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                          child: Column(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Radius",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(fontWeight: FontWeight.w600),
                            ),
                          ),
                          SizedBox(
                            height: height * .01,
                          ),
                          DropdownButtonFormField(
                              value: selectRadius,
                              icon: const Icon(
                                Icons.keyboard_arrow_down,
                                color: Color(0xff000000),
                                size: 22,
                              ),
                              style: Theme.of(context).textTheme.bodyLarge,
                              items: radiusItems.map((String items) {
                                return DropdownMenuItem(
                                  value: items,
                                  child: Text(items),
                                );
                              }).toList(),
                              validator: (value) {
                                if (value == null) return "Select your radius";
                                return null;
                              },
                              onChanged: (String? newValue) {
                                setState(() {
                                  selectRadius = newValue!;
                                });
                              },
                              // itemHeight: 20,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: height * .01,
                                    horizontal: width * .04),
                                hintText: "Select",
                                hintStyle: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(
                                        color: AppColors.subtitletextcolor,
                                        fontSize: 12),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide:
                                      BorderSide(color: Colors.pinkAccent),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide:
                                      BorderSide(color: Color(0xffBABABA)),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(35.0)),
                                  borderSide: BorderSide(color: Colors.red),
                                ),
                                disabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(35.0)),
                                  borderSide:
                                      BorderSide(color: Color(0xffBABABA)),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(35.0)),
                                  borderSide: BorderSide(color: Colors.pink),
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide:
                                        BorderSide(color: Color(0xffBABABA))),
                              )),
                        ],
                      )),
                      SizedBox(
                        width: width * .02,
                      ),
                      Flexible(
                          child: Column(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Add Search Metrics",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(fontWeight: FontWeight.w600),
                            ),
                          ),
                          SizedBox(
                            height: height * .01,
                          ),
                          DropdownButtonFormField(
                              value: selectLocation,
                              icon: const Icon(
                                Icons.keyboard_arrow_down,
                                color: Color(0xff000000),
                                size: 22,
                              ),
                              style: Theme.of(context).textTheme.bodyLarge,
                              items: LocationItems.map((String items) {
                                return DropdownMenuItem(
                                  value: items,
                                  child: Text(items),
                                );
                              }).toList(),
                              validator: (value) {
                                if (value == null)
                                  return "Select your add search Metrics";
                                return null;
                              },
                              onChanged: (String? newValue) {
                                setState(() {
                                  selectLocation = newValue!;
                                });
                              },
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: height * .01,
                                    horizontal: width * .04),
                                hintText: "Select",
                                hintStyle: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(
                                        color: AppColors.subtitletextcolor,
                                        fontSize: 12),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide:
                                      BorderSide(color: Colors.pinkAccent),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide:
                                      BorderSide(color: Color(0xffBABABA)),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(35.0)),
                                  borderSide: BorderSide(color: Colors.red),
                                ),
                                disabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(35.0)),
                                  borderSide:
                                      BorderSide(color: Color(0xffBABABA)),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(35.0)),
                                  borderSide: BorderSide(color: Colors.pink),
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide:
                                        BorderSide(color: Color(0xffBABABA))),
                              )),
                        ],
                      ))
                    ],
                  ),
                  SizedBox(
                    height: height * .03,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                          child: Column(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Sort by most",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(fontWeight: FontWeight.w600),
                            ),
                          ),
                          SizedBox(
                            height: height * .01,
                          ),
                          DropdownButtonFormField(
                              value: selectRadius,
                              icon: const Icon(
                                Icons.keyboard_arrow_down,
                                color: Color(0xff000000),
                                size: 22,
                              ),
                              style: Theme.of(context).textTheme.bodyLarge,
                              items: radiusItems.map((String items) {
                                return DropdownMenuItem(
                                  value: items,
                                  child: Text(items),
                                );
                              }).toList(),
                              validator: (value) {
                                if (value == null)
                                  return "select your sort by matches";
                                return null;
                              },
                              onChanged: (String? newValue) {
                                setState(() {
                                  selectRadius = newValue!;
                                });
                              },
                              // itemHeight: 20,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: height * .01,
                                    horizontal: width * .04),
                                hintText: "Select",
                                hintStyle: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(
                                        color: AppColors.subtitletextcolor,
                                        fontSize: 12),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide:
                                      BorderSide(color: Colors.pinkAccent),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide:
                                      BorderSide(color: Color(0xffBABABA)),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(35.0)),
                                  borderSide: BorderSide(color: Colors.red),
                                ),
                                disabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(35.0)),
                                  borderSide:
                                      BorderSide(color: Color(0xffBABABA)),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(35.0)),
                                  borderSide: BorderSide(color: Colors.pink),
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide:
                                        BorderSide(color: Color(0xffBABABA))),
                              )),
                        ],
                      )),
                      SizedBox(
                        width: width * .02,
                      ),
                      Flexible(
                          child: Column(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Most like profile",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(fontWeight: FontWeight.w600),
                            ),
                          ),
                          SizedBox(
                            height: height * .01,
                          ),
                          DropdownButtonFormField(
                              value: selectLike,
                              icon: const Icon(
                                Icons.keyboard_arrow_down,
                                color: Color(0xff000000),
                                size: 22,
                              ),
                              style: Theme.of(context).textTheme.bodyLarge,
                              items: likesItems.map((String items) {
                                return DropdownMenuItem(
                                  value: items,
                                  child: Text(items),
                                );
                              }).toList(),
                              validator: (value) {
                                if (value == null)
                                  return "Select your likes profile";
                                return null;
                              },
                              onChanged: (String? newValue) {
                                setState(() {
                                  selectLike = newValue!;
                                });
                              },
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: height * .01,
                                    horizontal: width * .04),
                                hintText: "Select",
                                hintStyle: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(
                                        color: AppColors.subtitletextcolor,
                                        fontSize: 12),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide:
                                      BorderSide(color: Colors.pinkAccent),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide:
                                      BorderSide(color: Color(0xffBABABA)),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(35.0)),
                                  borderSide: BorderSide(color: Colors.red),
                                ),
                                disabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(35.0)),
                                  borderSide:
                                      BorderSide(color: Color(0xffBABABA)),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(35.0)),
                                  borderSide: BorderSide(color: Colors.pink),
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide:
                                        BorderSide(color: Color(0xffBABABA))),
                              )),
                        ],
                      ))
                    ],
                  ),
                  SizedBox(
                    height: height * .03,
                  ),
                  Container(
                    width: width * .37,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                            child: Column(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Confirmed Matches",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(fontWeight: FontWeight.w600),
                              ),
                            ),
                            SizedBox(
                              height: height * .01,
                            ),
                            DropdownButtonFormField(
                                value: confirmMatches,
                                icon: const Icon(
                                  Icons.keyboard_arrow_down,
                                  color: Color(0xff000000),
                                  size: 22,
                                ),
                                style: Theme.of(context).textTheme.bodyLarge,
                                items: confirmItems.map((String items) {
                                  return DropdownMenuItem(
                                    value: items,
                                    child: Text(items),
                                  );
                                }).toList(),
                                validator: (value) {
                                  if (value == null)
                                    return "Select your confirm matches";
                                  return null;
                                },
                                onChanged: (String? newValue) {
                                  setState(() {
                                    confirmMatches = newValue!;
                                  });
                                },
                                // itemHeight: 20,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: height * .01,
                                      horizontal: width * .04),
                                  hintText: "Select",
                                  hintStyle: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(
                                          color: AppColors.subtitletextcolor,
                                          fontSize: 12),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide:
                                        BorderSide(color: Colors.pinkAccent),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide:
                                        BorderSide(color: Color(0xffBABABA)),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(35.0)),
                                    borderSide: BorderSide(color: Colors.red),
                                  ),
                                  disabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(35.0)),
                                    borderSide:
                                        BorderSide(color: Color(0xffBABABA)),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(35.0)),
                                    borderSide: BorderSide(color: Colors.pink),
                                  ),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      borderSide:
                                          BorderSide(color: Color(0xffBABABA))),
                                )),
                          ],
                        )),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: height * .04,
                  ),
                  Center(
                    child: MyButton(
                      width: width * .4,
                      title: "Apply",
                      onTap: () {
                        _submit();
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                        }
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  // MakerProfile show dialog box
  Future<void> showmaker(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          final height = MediaQuery.of(context).size.height;
          final width = MediaQuery.of(context).size.width;
          return  ShortProfileMaker();
        });
  }


///seeker

  // MakerProfile show dialog box
  Future<void> showseeker(BuildContext context) {

    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          final height = MediaQuery.of(context).size.height;
          final width = MediaQuery.of(context).size.width;
          return shortprofilepopup();
          
          }
  );
        }
  
  

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          child: Icon(
            Icons.arrow_back,
            size: 27,
            color: Color(0xff5A5A5A),
          ),
          onTap: () {
            Get.back();
          },
        ),
        title: Text(
          "Incoming Requests",
          style: Theme.of(context)
              .textTheme
              .titleMedium
              ?.copyWith(fontSize: 18, fontWeight: FontWeight.w600),
        ),
      ),
      body: Obx(() {
        return
          SingleChildScrollView(
          child: Column(
            children: [
           if(Incontroller.IncomingRequestvalue.value.status=="success" )   Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: width * .05, vertical: height * .03),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Search by Filter",
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall
                          ?.copyWith(fontWeight: FontWeight.w600),
                    ),
                    InkWell(
                      child: Image.asset(
                        "assets/images/filter.png",
                        height: height * .05,
                      ),
                      onTap: () {
                        _showDialog(context);
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: height * .02,
              ),



        Incontroller.IncomingRequestvalue.value.status=="success"   ?  
              ListView.builder(
                shrinkWrap: true,
                itemCount: Incontroller.IncomingRequestvalue.value.requests!.length,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: height * .01),
                    child: Stack(
                      children: [
                        Container(
        
                          height: height * 0.11,
                          decoration: BoxDecoration(color: Color(0xffFE0091)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Flexible(
                                child: ListTile(
                                  leading: InkWell(
                                    child: CircleAvatar(
                                      radius: 24,
                                      backgroundColor: AppColors.white,
                                      child: CircleAvatar(
                                          radius: 22,
                                          backgroundImage: CachedNetworkImageProvider(Incontroller
                                              .IncomingRequestvalue
                                              .value
                                              .requests![index]
                                              .getSeeker!
                                              .imgPath
                                              .toString())),
                                    ),
                                    onTap: (){
        
        
        
        
                                      userIdsiker=Incontroller.IncomingRequestvalue.value.requests![index].getSeeker!.id.toString();
        
        
                                      print(userIdsiker);
                                      if(userIdsiker!=null){
                                        showseeker(context);
                                      }
                                      // Get.to(ShortProfileSeeker());
                                    },
                                  ),
                                  horizontalTitleGap: 10,
                                  title: Text(
                                    Incontroller.IncomingRequestvalue.value
                                        .requests![index].getSeeker!.name
                                        .toString(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall
                                        ?.copyWith(
                                            fontWeight: FontWeight.w600,
                                            color: AppColors.white),
                                  ),
                                  subtitle: Text(
                                    "Match Seeker",
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelSmall
                                        ?.copyWith(
                                            fontWeight: FontWeight.w300,
                                            color: AppColors.white),
                                  ),
                                ),
                              ),
                              if (Incontroller.IncomingRequestvalue.value
                                      .requests![index].getMaker ==
                                  null)
                                InkWell(
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 18.0),
                                    child: Text(
                                      "View",
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelSmall
                                          ?.copyWith(
                                              fontSize: 9,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.white,
                                              decoration:
                                                  TextDecoration.underline),
                                    ),
                                  ),
                                  onTap: () {
                             requestid=Incontroller.IncomingRequestvalue.value
                                      .requests![index].id.toString();
        setState(() {
          requestype="1";
          requestid;
          print(Incontroller.IncomingRequestvalue.value
                                      .requests![index].id.toString());
        });
               
                                      if(requestid!=null){
                                        print(requestid);
            Get.to(ChatPage());
                                      }
                            
                                  },
                                ),
                              if (Incontroller.IncomingRequestvalue.value
                                      .requests![index].getMaker !=
                                  null)
                                Flexible(
                                  child: Container(
                                    height: height * 0.10,
                                    decoration: BoxDecoration(
                                        color: AppColors.white,
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(11),
                                          bottomLeft: Radius.circular(11),
                                        )),
                                    child: ListTile(
                                      leading: CircleAvatar(
                                        radius: 22,
                                        child: InkWell(
                                          child: CircleAvatar(
                                              radius: 26,
                                              backgroundImage: CachedNetworkImageProvider(
                                                  Incontroller
                                                      .IncomingRequestvalue
                                                      .value
                                                      .requests![index]
                                                      .getMaker!
                                                      .imgPath
                                                      .toString())),
                                                      onTap: (){
        
                                                        Makerid=Incontroller.IncomingRequestvalue.value.requests![index].getMaker!.id.toString();
                                                      showmaker(context);
                                                      },
                                        ),
                                      ),
                                      horizontalTitleGap: 10,
                                      title: Text(
                                        Incontroller
                                            .IncomingRequestvalue
                                            .value
                                            .requests![index].getMaker!.name.toString(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall
                                            ?.copyWith(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 9),
                                      ),
                                      subtitle: Text(
                                        "Match Maker",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall
                                            ?.copyWith(
                                                fontSize: 8,
                                                fontWeight: FontWeight.w300,
                                                color: Color(0xff777777)),
                                      ),
                                      trailing: InkWell(
                                        child: Text(
                                          "View",
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelSmall
                                              ?.copyWith(
                                                  fontSize: 9,
                                                  fontWeight: FontWeight.w500,
                                                  color: Color(0xffFE0091),
                                                  decoration:
                                                      TextDecoration.underline),
                                        ),
                                       onTap: () {
                             requestid=Incontroller.IncomingRequestvalue.value
                                      .requests![index].id.toString();
        setState(() {
          requestype="1";
          requestid;
          print(Incontroller.IncomingRequestvalue.value
                                      .requests![index].id.toString());
        });
               
                                      if(requestid!=null){
                                        print(requestid);
            Get.to(ChatPage());
                                      }}
                                      ),
                                    ),
                                  ),
                                )
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ): Column(

                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(height:Get.height*0.15,),
                                  Container(
                                          
                                          height: Get.height*0.2,
                                          width: Get.width*0.8,
                                          decoration:BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/recentConversationempty.png"))),),

                                          SizedBox(height: Get.height*0.01,),
                                          Center(child: Text("Reference site about Lorem Ipsum\n   giving information on its origins",style: TextStyle(color: Colors.black),))
                                ],
                              ),
            ],
          ),
        );
      }),
    );
  }




  Future<void> showdilogapproved(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          final height = MediaQuery.of(context).size.height;
          final width = MediaQuery.of(context).size.width;
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            content: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Image.asset(
                          'assets/images/remove.png',
                          height: height * .03,
                        ),
                      ),
                    ),
                  ),
                 
                  SizedBox(
                    height: height * 0.04,
                  ),
                  CircleAvatar(
                    radius: 52,
                    // backgroundColor: Colors.,
                   child: Icon(Icons.check,size:70,weight:8.0,opticalSize: 30,),
                  ),
                  SizedBox(height: height * 0.04),
                Text("Congratulation!",style: TextStyle(color:Colors.black,fontWeight:FontWeight.bold,fontSize: 30,)),
                  SizedBox(height: height * 0.04),
                  Text("Your Request has been Acceped"),
                  SizedBox(height: height * 0.01),

                  Text("Successfully"),
                  SizedBox(height: height * 0.04),

                  MyButton(
                    width: width * .5,
                    title: "Back",
                    onTap: () {},
                  )
                ],
              ),
            ),
          );
        });
  }
}
