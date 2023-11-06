import 'package:cupid_match/match_seeker/list_matches.dart';
import 'package:cupid_match/match_seeker/profile.dart';
import 'package:cupid_match/match_seeker/profile/filter.dart';
import 'package:cupid_match/utils/app_colors.dart';
import 'package:cupid_match/widgets/my_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RequestMakers extends StatefulWidget {
  const RequestMakers({Key? key}) : super(key: key);

  @override
  State<RequestMakers> createState() => _RequestMakersState();
}

class _RequestMakersState extends State<RequestMakers> {
  var _formKey = GlobalKey<FormState>();
  void _submit() {
    final isValid = _formKey.currentState!.validate();
    if (isValid) {
      return;
    }
    _formKey.currentState!.save();
  }

  String? cityValues;
  var cityItems = [
    "Jaipur",
    "Udaipur",
    "Ajmer",
    "Kota",
  ];

  String? stateValues;
  var stateItems = [
    "Rajasthan",
    "Haryana",
    "Bhihar",
    "Mizoram",
  ];

  String? radiusValues;
  var radiusItems = [
    "5 Km",
    "10 Km",
    "15 Km",
    "20 Km",
  ];

  String? addValues;
  var addItems = [
    "Rajasthan",
    "Haryana",
    "Bhihar",
    "Mizoram",
  ];

  String? sortbyValues;
  var sortbyItems = [
    "5 Km",
    "10 Km",
    "15 Km",
    "20 Km",
  ];

  String? mostlikeValues;
  var mostlikeItems = [
    "100 Likes",
    "200 Likes",
    "300 Likes",
    "400 Likes",
    "500 Likes",
  ];

  String? matchesValues;
  var matchesItems = [
    "50 Matches",
    "100 Matches",
    "200 Matches",
    "300 Matches",
  ];
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return RefreshIndicator(
       onRefresh: () async{

       },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Request to be Makers",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Search by Filter",
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  GestureDetector(
                      onTap: () {
                        showDialog(
                            barrierDismissible: false,
                            context: context,
                            builder: (context) {
                              return Form(
                                key: _formKey,
                                child: AlertDialog(
                                  backgroundColor: Color(0xffFFFFFF),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Align(
                                          alignment: Alignment.topRight,
                                          child: GestureDetector(
                                              onTap: () {
                                                Get.back();
                                              },
                                              child: Image.asset(
                                                'assets/icons/cancel.png',
                                                height: height * .02,
                                              ))),
                                      SizedBox(
                                        height: height * .01,
                                      ),
                                      Center(
                                          child: Text(
                                        "Sort By",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge
                                            ?.copyWith(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 17),
                                      )),
                                      SizedBox(
                                        height: height * .03,
                                      ),
                                      Row(
                                        children: [
                                          Flexible(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Select City",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .titleLarge
                                                      ?.copyWith(
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                ),
                                                SizedBox(
                                                  height: height * 0.01,
                                                ),
                                                DropdownButtonFormField(
                                                    value: cityValues,
                                                    icon: const Icon(
                                                        Icons.keyboard_arrow_down,
                                                        color: Color(0xff000000)),
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyLarge,
                                                    items: cityItems
                                                        .map((String items) {
                                                      return DropdownMenuItem(
                                                        value: items,
                                                        child: Text(items),
                                                      );
                                                    }).toList(),
                                                    validator: (value) {
                                                      if (value == null)
                                                        return "Required";
                                                      return null;
                                                    },
                                                    onChanged:
                                                        (String? newValue) {
                                                      setState(() {
                                                        cityValues = newValue!;
                                                      });
                                                    },
                                                    decoration: InputDecoration(
                                                      contentPadding:
                                                          EdgeInsets.symmetric(
                                                              vertical:
                                                                  height * .02,
                                                              horizontal:
                                                                  width * .03),
                                                      hintText: "Select",
                                                      hintStyle: Theme.of(context)
                                                          .textTheme
                                                          .bodySmall
                                                          ?.copyWith(
                                                              color: AppColors
                                                                  .subtitletextcolor,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400),
                                                      border: OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(30),
                                                          borderSide: BorderSide(
                                                              color: Color(
                                                                  0xff777777))),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          30),
                                                              borderSide: BorderSide(
                                                                  color: Color(
                                                                      0xff777777))),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          30),
                                                              borderSide: BorderSide(
                                                                  color: Color(
                                                                      0xff777777))),
                                                    )),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            width: width * .02,
                                          ),
                                          Flexible(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Select State",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .titleLarge
                                                      ?.copyWith(
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                ),
                                                SizedBox(
                                                  height: height * 0.01,
                                                ),
                                                DropdownButtonFormField(
                                                    value: stateValues,
                                                    icon: const Icon(
                                                        Icons.keyboard_arrow_down,
                                                        color: Color(0xff000000)),
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyLarge,
                                                    items: stateItems
                                                        .map((String items) {
                                                      return DropdownMenuItem(
                                                        value: items,
                                                        child: Text(items),
                                                      );
                                                    }).toList(),
                                                    validator: (value) {
                                                      if (value == null)
                                                        return "Required";
                                                      return null;
                                                    },
                                                    onChanged:
                                                        (String? newValue) {
                                                      setState(() {
                                                        stateValues = newValue!;
                                                      });
                                                    },
                                                    decoration: InputDecoration(
                                                      contentPadding:
                                                          EdgeInsets.symmetric(
                                                              vertical:
                                                                  height * .02,
                                                              horizontal:
                                                                  width * .03),
                                                      hintText: "Select",
                                                      hintStyle: Theme.of(context)
                                                          .textTheme
                                                          .bodySmall
                                                          ?.copyWith(
                                                              color: AppColors
                                                                  .subtitletextcolor,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400),
                                                      border: OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(30),
                                                          borderSide: BorderSide(
                                                              color: Color(
                                                                  0xff777777))),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          30),
                                                              borderSide: BorderSide(
                                                                  color: Color(
                                                                      0xff777777))),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          30),
                                                              borderSide: BorderSide(
                                                                  color: Color(
                                                                      0xff777777))),
                                                    )),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: height * .02,
                                      ),
                                      Row(
                                        children: [
                                          Flexible(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Radius",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .titleLarge
                                                      ?.copyWith(
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                ),
                                                SizedBox(
                                                  height: height * 0.01,
                                                ),
                                                DropdownButtonFormField(
                                                    value: radiusValues,
                                                    icon: const Icon(
                                                        Icons.keyboard_arrow_down,
                                                        color: Color(0xff000000)),
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyLarge,
                                                    items: radiusItems
                                                        .map((String items) {
                                                      return DropdownMenuItem(
                                                        value: items,
                                                        child: Text(items),
                                                      );
                                                    }).toList(),
                                                    validator: (value) {
                                                      if (value == null)
                                                        return "Required";
                                                      return null;
                                                    },
                                                    onChanged:
                                                        (String? newValue) {
                                                      setState(() {
                                                        radiusValues = newValue!;
                                                      });
                                                    },
                                                    decoration: InputDecoration(
                                                      contentPadding:
                                                          EdgeInsets.symmetric(
                                                              vertical:
                                                                  height * .02,
                                                              horizontal:
                                                                  width * .03),
                                                      hintText: "Select",
                                                      hintStyle: Theme.of(context)
                                                          .textTheme
                                                          .bodySmall
                                                          ?.copyWith(
                                                              color: AppColors
                                                                  .subtitletextcolor,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400),
                                                      border: OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(30),
                                                          borderSide: BorderSide(
                                                              color: Color(
                                                                  0xff777777))),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          30),
                                                              borderSide: BorderSide(
                                                                  color: Color(
                                                                      0xff777777))),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          30),
                                                              borderSide: BorderSide(
                                                                  color: Color(
                                                                      0xff777777))),
                                                    )),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            width: width * .02,
                                          ),
                                          Flexible(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Add Search Metrics",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .titleLarge
                                                      ?.copyWith(
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                ),
                                                SizedBox(
                                                  height: height * 0.01,
                                                ),
                                                DropdownButtonFormField(
                                                    value: addValues,
                                                    icon: const Icon(
                                                        Icons.keyboard_arrow_down,
                                                        color: Color(0xff000000)),
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyLarge,
                                                    items: addItems
                                                        .map((String items) {
                                                      return DropdownMenuItem(
                                                        value: items,
                                                        child: Text(items),
                                                      );
                                                    }).toList(),
                                                    validator: (value) {
                                                      if (value == null)
                                                        return "Required";
                                                      return null;
                                                    },
                                                    onChanged:
                                                        (String? newValue) {
                                                      setState(() {
                                                        addValues = newValue!;
                                                      });
                                                    },
                                                    decoration: InputDecoration(
                                                      contentPadding:
                                                          EdgeInsets.symmetric(
                                                              vertical:
                                                                  height * .02,
                                                              horizontal:
                                                                  width * .03),
                                                      hintText: "Select",
                                                      hintStyle: Theme.of(context)
                                                          .textTheme
                                                          .bodySmall
                                                          ?.copyWith(
                                                              color: AppColors
                                                                  .subtitletextcolor,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400),
                                                      border: OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(30),
                                                          borderSide: BorderSide(
                                                              color: Color(
                                                                  0xff777777))),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          30),
                                                              borderSide: BorderSide(
                                                                  color: Color(
                                                                      0xff777777))),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          30),
                                                              borderSide: BorderSide(
                                                                  color: Color(
                                                                      0xff777777))),
                                                    )),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: height * .02,
                                      ),
                                      Row(
                                        children: [
                                          Flexible(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Sort by most Matches",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .titleLarge
                                                      ?.copyWith(
                                                          fontSize: 11,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                ),
                                                SizedBox(
                                                  height: height * 0.01,
                                                ),
                                                DropdownButtonFormField(
                                                    value: sortbyValues,
                                                    icon: const Icon(
                                                        Icons.keyboard_arrow_down,
                                                        color: Color(0xff000000)),
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyLarge,
                                                    items: sortbyItems
                                                        .map((String items) {
                                                      return DropdownMenuItem(
                                                        value: items,
                                                        child: Text(items),
                                                      );
                                                    }).toList(),
                                                    validator: (value) {
                                                      if (value == null)
                                                        return "Required";
                                                      return null;
                                                    },
                                                    onChanged:
                                                        (String? newValue) {
                                                      setState(() {
                                                        sortbyValues = newValue!;
                                                      });
                                                    },
                                                    decoration: InputDecoration(
                                                      contentPadding:
                                                          EdgeInsets.symmetric(
                                                              vertical:
                                                                  height * .02,
                                                              horizontal:
                                                                  width * .03),
                                                      hintText: "Select",
                                                      hintStyle: Theme.of(context)
                                                          .textTheme
                                                          .bodySmall
                                                          ?.copyWith(
                                                              color: AppColors
                                                                  .subtitletextcolor,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400),
                                                      border: OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(30),
                                                          borderSide: BorderSide(
                                                              color: Color(
                                                                  0xff777777))),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          30),
                                                              borderSide: BorderSide(
                                                                  color: Color(
                                                                      0xff777777))),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          30),
                                                              borderSide: BorderSide(
                                                                  color: Color(
                                                                      0xff777777))),
                                                    )),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            width: width * .02,
                                          ),
                                          Flexible(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Most like profile",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .titleLarge
                                                      ?.copyWith(
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                ),
                                                SizedBox(
                                                  height: height * 0.01,
                                                ),
                                                DropdownButtonFormField(
                                                    value: mostlikeValues,
                                                    icon: const Icon(
                                                        Icons.keyboard_arrow_down,
                                                        color: Color(0xff000000)),
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyLarge,
                                                    items: mostlikeItems
                                                        .map((String items) {
                                                      return DropdownMenuItem(
                                                        value: items,
                                                        child: Text(items),
                                                      );
                                                    }).toList(),
                                                    validator: (value) {
                                                      if (value == null)
                                                        return "Required";
                                                      return null;
                                                    },
                                                    onChanged:
                                                        (String? newValue) {
                                                      setState(() {
                                                        mostlikeValues =
                                                            newValue!;
                                                      });
                                                    },
                                                    decoration: InputDecoration(
                                                      contentPadding:
                                                          EdgeInsets.symmetric(
                                                              vertical:
                                                                  height * .02,
                                                              horizontal:
                                                                  width * .03),
                                                      hintText: "Select",
                                                      hintStyle: Theme.of(context)
                                                          .textTheme
                                                          .bodySmall
                                                          ?.copyWith(
                                                              color: AppColors
                                                                  .subtitletextcolor,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400),
                                                      border: OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(30),
                                                          borderSide: BorderSide(
                                                              color: Color(
                                                                  0xff777777))),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          30),
                                                              borderSide: BorderSide(
                                                                  color: Color(
                                                                      0xff777777))),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          30),
                                                              borderSide: BorderSide(
                                                                  color: Color(
                                                                      0xff777777))),
                                                    )),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: height * .02,
                                      ),
                                      Row(
                                        children: [
                                          Flexible(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Confirmed Matches",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .titleLarge
                                                      ?.copyWith(
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                ),
                                                SizedBox(
                                                  height: height * 0.01,
                                                ),
                                                DropdownButtonFormField(
                                                    padding: EdgeInsets.only(
                                                        right:
                                                            MediaQuery.of(context)
                                                                    .size
                                                                    .width *
                                                                .3),
                                                    value: matchesValues,
                                                    icon: const Icon(
                                                        Icons.keyboard_arrow_down,
                                                        color: Color(0xff000000)),
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyLarge,
                                                    items: matchesItems
                                                        .map((String items) {
                                                      return DropdownMenuItem(
                                                        value: items,
                                                        child: Text(items),
                                                      );
                                                    }).toList(),
                                                    validator: (value) {
                                                      if (value == null)
                                                        return "Required";
                                                      return null;
                                                    },
                                                    onChanged:
                                                        (String? newValue) {
                                                      setState(() {
                                                        matchesValues = newValue!;
                                                      });
                                                    },
                                                    decoration: InputDecoration(
                                                      contentPadding:
                                                          EdgeInsets.symmetric(
                                                              vertical:
                                                                  height * .02,
                                                              horizontal:
                                                                  width * .03),
                                                      hintText: "Select",
                                                      hintStyle: Theme.of(context)
                                                          .textTheme
                                                          .bodySmall
                                                          ?.copyWith(
                                                              color: AppColors
                                                                  .subtitletextcolor,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400),
                                                      border: OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(30),
                                                          borderSide: BorderSide(
                                                              color: Color(
                                                                  0xff777777))),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          30),
                                                              borderSide: BorderSide(
                                                                  color: Color(
                                                                      0xff777777))),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          30),
                                                              borderSide: BorderSide(
                                                                  color: Color(
                                                                      0xff777777))),
                                                    )),
                                              ],
                                            ),
                                          ),
                                          // Flexible(child:  Column(
                                          //   crossAxisAlignment: CrossAxisAlignment.start,
                                          //   children: [
                                          //     Text(
                                          //       "Most like profile",
                                          //       style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 12, fontWeight: FontWeight.w600),
                                          //     ),
                                          //     SizedBox(height: height * 0.01,),
                                          //     DropdownButtonFormField(value: mostlikeValues,
                                          //         icon: const Icon(Icons.keyboard_arrow_down,color: Color(0xff000000)),
                                          //         style: Theme.of(context).textTheme.bodyLarge,
                                          //         items: mostlikeItems.map((String items) {
                                          //           return DropdownMenuItem(
                                          //             value: items,
                                          //             child: Text(items),
                                          //           );
                                          //         }).toList(),
                                          //         validator: (value) {
                                          //           if(value == null)
                                          //             return "Required";
                                          //           return null;
                                          //         },
                                          //         onChanged: (String? newValue) {
                                          //           setState(() {
                                          //             mostlikeValues = newValue!;
                                          //           });
                                          //         },
                                          //         decoration: InputDecoration(
                                          //           contentPadding: EdgeInsets.symmetric(vertical: height*.02,horizontal: width*.03),
                                          //           hintText: "Select",
                                          //           hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppColors.subtitletextcolor),
                                          //           border: OutlineInputBorder(
                                          //               borderRadius: BorderRadius.circular(30),
                                          //               borderSide: BorderSide(color: Color(0xff777777))),
                                          //           enabledBorder:  OutlineInputBorder(
                                          //               borderRadius: BorderRadius.circular(30),
                                          //               borderSide: BorderSide(color:Color(0xff777777))),
                                          //           focusedBorder:  OutlineInputBorder(
                                          //               borderRadius: BorderRadius.circular(30),
                                          //               borderSide: BorderSide(color:Color(0xff777777))),
                                          //         )
                                          //     ),
                                          //   ],
                                          // ),
                                          // )
                                        ],
                                      ),
                                      SizedBox(
                                        height: height * .03,
                                      ),
                                      Center(
                                        child: MyButton(
                                          width: width * .5,
                                          title: 'Apply',
                                          onTap: () {
                                            if (_formKey.currentState!
                                                .validate()) {
                                              _formKey.currentState!.save();
                                              _submit();
                                            }
                                          },
                                        ),
                                      ),
                                      SizedBox(
                                        height: height * .03,
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            });
                      },
                      child: Image.asset("assets/icons/filter.png"))
                ],
              ),
              Expanded(
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 6,
                  itemExtent: 80,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        CircleAvatar(
                          radius: 30.0,
                          backgroundImage: NetworkImage(
                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR2av8pAdOHJdgpwkYC5go5OE07n8-tZzTgwg&usqp=CAU"),
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
                            // Get.to(()=>ListMatches());
                          },
                          child: MyButton(
                              height: height * .04,
                              width: width * .3,
                              title: "Request",
                              onTap: () {}),
                        )
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
