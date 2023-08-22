import 'package:cached_network_image/cached_network_image.dart';
import 'package:cupid_match/controllers/controller/OutgoingRequestController/OutgoingRequestController.dart';
import 'package:cupid_match/utils/app_colors.dart';
import 'package:cupid_match/widgets/my_button.dart';
import 'package:cupid_match/widgets/seekershortprofile.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

import '../../data/response/status.dart';
import '../../res/components/internet_exceptions_widget.dart';

class OutGoingRequest extends StatefulWidget {
  const OutGoingRequest({Key? key}) : super(key: key);

  @override
  State<OutGoingRequest> createState() => _OutGoingRequestState();
}

class _OutGoingRequestState extends State<OutGoingRequest> {
  OutgoinRequestController controller = Get.put(OutgoinRequestController());


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
  Future<void> showOptionsDialog(BuildContext context) {
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
                  Text(
                    "Profile",
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall
                        ?.copyWith(fontSize: 17, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: height * 0.04,
                  ),
                  CircleAvatar(
                    radius: 52,
                    backgroundImage: NetworkImage(
                        "https://images.unsplash.com/flagged/photo-1553642618-de0381320ff3?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OXx8cHJvZmVzc2lvbmFsJTIwbWFufGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60"),
                  ),
                  SizedBox(height: height * 0.04),
                  Text(
                    "John Deo,22",
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: height * 0.01),
                  Text(
                    "Jaipur, Indian",
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        fontWeight: FontWeight.w400, color: Color(0xff777777)),
                  ),
                  SizedBox(
                    height: height * 0.03,
                  ),
                  RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: "Sex",
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(fontWeight: FontWeight.w600)),
                    TextSpan(
                        text: " Male",
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            fontWeight: FontWeight.w400,
                            color: Color(0xff777777)))
                  ])),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: "Experience:",
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(fontWeight: FontWeight.w600)),
                    TextSpan(
                        text: " 5 Years",
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            fontWeight: FontWeight.w400,
                            color: Color(0xff777777)))
                  ])),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: "Matches completed:",
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(fontWeight: FontWeight.w600)),
                    TextSpan(
                        text: " 50 Matches",
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            fontWeight: FontWeight.w400,
                            color: Color(0xff777777)))
                  ])),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: "Successful Matches:",
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(fontWeight: FontWeight.w600)),
                    TextSpan(
                        text: " 40 Matches",
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            fontWeight: FontWeight.w400,
                            color: Color(0xff777777)))
                  ])),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: "Liked Profile:",
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(fontWeight: FontWeight.w600)),
                    TextSpan(
                        text: " 30 likes",
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            fontWeight: FontWeight.w400,
                            color: Color(0xff777777)))
                  ])),
                  SizedBox(height: height * 0.04),
                  MyButton(
                    width: width * .5,
                    title: "Request",
                    onTap: () {},
                  )
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back,
              size: 27,
              color: Color(0xff5A5A5A),
            )),
        title: Text(
          "Outgoing Requests",
          style: Theme.of(context)
              .textTheme
              .titleMedium
              ?.copyWith(fontSize: 18, fontWeight: FontWeight.w600),
        ),
      ),
      body:
      Obx(() {
       return Column(
              children: [
                Padding(
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

                ListView.builder(
                  shrinkWrap: true,
                  itemCount: controller
                      .OutgoingRequestvalue.value.requests!.length,
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
                                          backgroundImage: CachedNetworkImageProvider(
                                              controller
                                                  .OutgoingRequestvalue.value.requests![index].getSeeker!.imgPath
                                                  .toString()                                      )),
                                      ),

                                      onTap: (){
                                        Get.to(ShortProfileSeeker());
                                      },
                                    ),
                                    horizontalTitleGap: 10,
                                    title:
                                        Text(
                                            controller
                                              .OutgoingRequestvalue.value.requests![0].getSeeker!.name

                                              .toString(),
                                          style: Theme
                                              .of(context)
                                              .textTheme
                                              .bodySmall
                                              ?.copyWith(fontWeight: FontWeight.w600,
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
                                if(controller.OutgoingRequestvalue.value.requests![index].getMaker == null)
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
                                      showOptionsDialog(context);
                                    },
                                  ),
                                if(controller.OutgoingRequestvalue.value.requests![index].getMaker != null)
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
                                          child: CircleAvatar(
                                            radius: 26,
                                            backgroundImage:
                                            NetworkImage(
                                                "https://images.unsplash.com/flagged/photo-1553642618-de0381320ff3?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OXx8cHJvZmVzc2lvbmFsJTIwbWFufGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60"),
                                          ),
                                        ),
                                        horizontalTitleGap: 10,
                                        title: Text(
                                          "Elelyn",
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
                                        trailing:
                                        InkWell(
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
                                            showOptionsDialog(context);
                                          },
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
                ),

              ],
            );
        }
      ),
    );
  }
}
