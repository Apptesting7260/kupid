import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/FindMatchesControlller/FindMatchesController.dart';
import '../../../controllers/controller/ViewSikerDetailsController/ViewSikerDetaolsController.dart';
import '../../../data/response/status.dart';
import '../../../res/components/general_exception.dart';
import '../../../res/components/internet_exceptions_widget.dart';


class CreateNewMatches extends StatefulWidget {
  const CreateNewMatches({super.key});

  @override
  State<CreateNewMatches> createState() => _CreateNewMatchesState();
}

class _CreateNewMatchesState extends State<CreateNewMatches> {
  final CreateNewMatchesController createNewMatchesController =
  Get.put(CreateNewMatchesController());

  final ViewSikerProfileDetailsController seekerViewMyProfileController =
  Get.put(ViewSikerProfileDetailsController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    createNewMatchesController.CreateNewMatchesApi();
    seekerViewMyProfileController.ViewSikerProfileDetailsApiHit();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          bottomOpacity: 0.0,
          elevation: 0.0,
          title: Padding(
            padding: const EdgeInsets.only(top: 30, left: 55.0),
            child: Text(
              "Create New Matches",
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.w600),
            ),
          ),
          backgroundColor: Colors.white,
          leading: Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: IconButton(onPressed: () => Get.back(), icon: Icon(
              Icons.arrow_back,
              color: Color.fromRGBO(90, 90, 90, 1),
            ),)
          ),
        ),
        body: Obx(() {
          switch (createNewMatchesController.rxRequestStatus.value) {
            case Status.LOADING:
              return const Center(child: CircularProgressIndicator());
            case Status.ERROR:
              if (createNewMatchesController.error.value == 'No internet') {
                return InterNetExceptionWidget(
                  onPress: () {
                    createNewMatchesController.refreshApi();
                  },
                );
              } else {
                return GeneralExceptionWidget(onPress: () {
                  createNewMatchesController.refreshApi();
                });
              }
            case Status.COMPLETED:
              return Column(
                children: [
                  Stack(
                    children: [
                      Column(children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: Get.width * 0.03,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 165),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Color.fromRGBO(244, 244, 244, 1),
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        width: 1,
                                        color: Color.fromRGBO(254, 0, 145, 1))),
                                height: Get.height * 0.5,
                                width: Get.width * 0.45,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: Get.height * 0.015,
                                    ),
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: Get.width * 0.02,
                                        ),


                                        Container(
                                          height: Get.height * 0.25,
                                          width: Get.width * 0.4,
                                          child: CachedNetworkImage(
                                            imageUrl:
                                            seekerViewMyProfileController
                                                .ViewProfileDetail
                                                .value
                                                .profileDetails![0].imgPath.toString() ,
                                            imageBuilder: (context,
                                                imageProvider) =>
                                                Container(
                                                  height: Get.height * 0.25,
                                                  width: Get.width * 0.4,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                    BorderRadius
                                                        .circular(20),
                                                    image: DecorationImage(
                                                        image:
                                                        imageProvider,
                                                        fit: BoxFit.fill),
                                                  ),
                                                ),
                                            placeholder:
                                                (context, url) =>
                                                Center(
                                                  child:
                                                  CircularProgressIndicator(
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                            errorWidget:
                                                (context, url, error) =>
                                                Icon(Icons.error),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: Get.height * 0.03,
                                    ),
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: Get.width * 0.04,
                                        ),
                                        Text(
                                          seekerViewMyProfileController
                                              .ViewProfileDetail
                                              .value
                                              .profileDetails![0].name.toString(),
                                          style: TextStyle(
                                            color: Colors.black,

                                              fontSize: 12,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: Get.height * 0.005,
                                    ),
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: Get.width * 0.04,
                                        ),
                                        Text(
                                          seekerViewMyProfileController
                                              .ViewProfileDetail
                                              .value
                                              .profileDetails![0].occupationName.toString(),
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 8,
                                              fontWeight: FontWeight.w400),
                                          softWrap: true,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: Get.height * 0.005,
                                    ),
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: Get.width * 0.04,
                                        ),
                                      Container(
                                          width:Get.width * .3  ,
                                        child:   Text(
                                          seekerViewMyProfileController
                                              .ViewProfileDetail
                                              .value
                                              .profileDetails![0].address.toString(),
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 6,
                                              fontWeight: FontWeight.w400),
                                          softWrap: true,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      )
                                      ],
                                    ),
                                    SizedBox(
                                      height: Get.height * 0.015,
                                    ),
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: Get.width * 0.04,
                                        ),
                                        Text(
                                          'Interest',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 8,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: Get.height * 0.005,
                                    ),
                                    // Row(
                                    //   children: [
                                    //     SizedBox(
                                    //       width: Get.width * 0.04,
                                    //     ),
                                    //     ( seekerViewMyProfileController
                                    //         .ViewProfileDetail
                                    //         .value
                                    //         .profileDetails![0].details!.interestName![0].title!=null )? Row(children: [
                                    //       for (var i = 0;  seekerViewMyProfileController
                                    //           .ViewProfileDetail
                                    //           .value
                                    //           .profileDetails![0].details!.interestName!.length > i; i++)
                                    //         Text(
                                    //           seekerViewMyProfileController
                                    //               .ViewProfileDetail
                                    //               .value
                                    //               .profileDetails![0].details!.interestName![i].title.toString()+" ",
                                    //           style: TextStyle(
                                    //               fontSize: 6,
                                    //               color: Colors.black,
                                    //               fontWeight:
                                    //               FontWeight.w400),
                                    //         ),
                                    //
                                    //     ],):Container(),
                                    //
                                    //   ],
                                    // ),


                                    SizedBox(
                                      height: Get.height * 0.01,
                                    ),
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: Get.width * 0.02,
                                        ),
                                        ( seekerViewMyProfileController
                                            .ViewProfileDetail
                                            .value
                                            .profileDetails![0]. religion==null ||  seekerViewMyProfileController
                                            .ViewProfileDetail
                                            .value
                                            .profileDetails![0]. religion=='')?Container():Container(
                                            height: Get.height * 0.03,
                                            width: Get.width * 0.19,
                                            decoration: BoxDecoration(
                                              color: Color.fromRGBO(
                                                  244, 244, 244, 1),
                                              border: Border.all(width: 1),
                                              borderRadius:
                                              BorderRadius.circular(60),
                                            ),
                                            child: Row(
                                              children: [
                                                SizedBox(
                                                  width: Get.width * 0.005,
                                                ),
                                                Container(
                                                  height: Get.height * 0.015,
                                                  width: Get.width * 0.08,
                                                  child: Image.asset(
                                                    'assets/icons/religon.png',
                                                    fit: BoxFit.contain,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: Get.width * 0.0001,
                                                ),
                                                Text(
                                                  seekerViewMyProfileController
                                                      .ViewProfileDetail
                                                      .value
                                                      .profileDetails![0].religion.toString(),
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 6,
                                                      fontWeight:
                                                      FontWeight.w400),
                                                  softWrap: true,
                                                  overflow: TextOverflow.ellipsis,
                                                ),
                                              ],
                                            )),
                                        SizedBox(
                                          width: Get.width * 0.02,
                                        ),
                                        ( seekerViewMyProfileController
                                            .ViewProfileDetail
                                            .value
                                            .profileDetails![0]. height==null ||  seekerViewMyProfileController
                                            .ViewProfileDetail
                                            .value
                                            .profileDetails![0]. height=='')?Container():Container(
                                            height: Get.height * 0.03,
                                            width: Get.width * 0.19,
                                            decoration: BoxDecoration(
                                              color: Color.fromRGBO(
                                                  244, 244, 244, 1),
                                              border: Border.all(width: 1),
                                              borderRadius:
                                              BorderRadius.circular(60),
                                            ),
                                            child: Row(
                                              children: [
                                                SizedBox(
                                                  width: Get.width * 0.005,
                                                ),
                                                Container(
                                                  height: Get.height * 0.015,
                                                  width: Get.width * 0.08,
                                                  child: Image.asset(
                                                    'assets/icons/height.png',
                                                    fit: BoxFit.contain,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: Get.width * 0.0001,
                                                ),
                                                Text(
                                                  seekerViewMyProfileController
                                                      .ViewProfileDetail
                                                      .value
                                                      .profileDetails![0].height.toString(),
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 6,
                                                      fontWeight:
                                                      FontWeight.w400),
                                                  softWrap: true,
                                                  overflow: TextOverflow.ellipsis,
                                                ),
                                              ],
                                            )),
                                      ],
                                    ),
                                    SizedBox(
                                      height: Get.height * 0.01,
                                    ),
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: Get.width * 0.02,
                                        ),
                                        ( seekerViewMyProfileController
                                            .ViewProfileDetail
                                            .value
                                            .profileDetails![0]. salary==null ||  seekerViewMyProfileController
                                            .ViewProfileDetail
                                            .value
                                            .profileDetails![0]. salary=='')?Container(
                                          child: SizedBox(width: Get.width*0.18,),
                                        ): Container(
                                            height: Get.height * 0.03,
                                            width: Get.width * 0.19,
                                            decoration: BoxDecoration(
                                              color: Color.fromRGBO(
                                                  244, 244, 244, 1),
                                              border: Border.all(width: 1),
                                              borderRadius:
                                              BorderRadius.circular(60),
                                            ),
                                            child: Row(
                                              children: [
                                                // SizedBox(width: Get.width*0.005,),
                                                Container(
                                                  height: Get.height * 0.015,
                                                  width: Get.width * 0.08,
                                                  child: Image.asset(
                                                    'assets/icons/money.png',
                                                    fit: BoxFit.contain,
                                                  ),
                                                ),
                                                // SizedBox(width: Get.width*0.002,),
                                                Text(
                                                  seekerViewMyProfileController
                                                      .ViewProfileDetail
                                                      .value
                                                      .profileDetails![0].salary.toString()+' Monthly',
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 6,
                                                      fontWeight:
                                                      FontWeight.w400),
                                                  softWrap: true,
                                                  overflow: TextOverflow.ellipsis,
                                                ),
                                              ],
                                            )),
                                        SizedBox(
                                          width: Get.width * 0.15,
                                        ),
                                        Container(
                                          height: Get.height * 0.05,
                                          width: Get.width * 0.05,
                                          child: Image.asset(
                                            'assets/icons/next.png',
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: Get.width * 0.03,
                            ),

                            // ********************************* CarouselSlider *******************
                            Container(
                              height: Get.height * 0.89,
                              width: Get.width * 0.46,
                              // color: Colors.amber,
                              child: CarouselSlider.builder(
                                options: CarouselOptions(
                                    viewportFraction: 0.58,
                                    aspectRatio: 2,
                                    // enlargeCenterPage: true,
                                    scrollDirection: Axis.vertical,
                                    onPageChanged: (index, reason) {
                                      createNewMatchesController
                                          .setCurrentIndex(index);
                                    }),
                                itemCount: createNewMatchesController
                                    .createNewMatchesList
                                    .value
                                    .allseekers!
                                    .length,
                                itemBuilder: (BuildContext context,
                                    int itemIndex, int pageViewIndex) =>
                                    Obx(
                                          () => Card(
                                        child: GestureDetector(
                                          onTap: () {
                                            createNewMatchesController
                                                .setCurrentIndex(itemIndex + 1);

                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color: Color.fromRGBO(
                                                    244, 244, 244, 1),
                                                borderRadius: BorderRadius.circular(
                                                  10,
                                                ),
                                                border: Border.all(
                                                  width: 1,
                                                  color: createNewMatchesController
                                                      .currentIndex ==
                                                      itemIndex
                                                      ? Color.fromRGBO(
                                                      254, 0, 145, 1)
                                                      : Colors.transparent,
                                                )),
                                            height: Get.height * 0.5,
                                            width: Get.width * 0.45,
                                            child: Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  height: Get.height * 0.015,
                                                ),
                                                Row(
                                                  children: [
                                                    SizedBox(
                                                      width: Get.width * 0.02,
                                                    ),
                                                    // Container(
                                                    //   height: Get.height * 0.25,
                                                    //   width: Get.width * 0.4,
                                                    //   decoration: BoxDecoration(
                                                    //       borderRadius: BorderRadius.circular(20)),
                                                    //   child: ClipRRect(
                                                    //     borderRadius: BorderRadius.circular(20),
                                                    //     child: Image.network(
                                                    //       createNewMatchesController.createNewMatchesList.value.allseekers![itemIndex].imgPath.toString(),
                                                    //       fit: BoxFit.fill,
                                                    //     ),
                                                    //   ),
                                                    // ),

                                                    Container(
                                                      height: Get.height * 0.25,
                                                      width: Get.width * 0.4,
                                                      child: CachedNetworkImage(
                                                        imageUrl:
                                                        createNewMatchesController
                                                            .createNewMatchesList
                                                            .value
                                                            .allseekers![
                                                        itemIndex]
                                                            .imgPath
                                                            .toString(),
                                                        imageBuilder: (context,
                                                            imageProvider) =>
                                                            Container(
                                                              height: Get.height * 0.25,
                                                              width: Get.width * 0.4,
                                                              decoration: BoxDecoration(
                                                                borderRadius:
                                                                BorderRadius
                                                                    .circular(20),
                                                                image: DecorationImage(
                                                                    image:
                                                                    imageProvider,
                                                                    fit: BoxFit.fill),
                                                              ),
                                                            ),
                                                        placeholder:
                                                            (context, url) =>
                                                            Center(
                                                              child:
                                                              CircularProgressIndicator(
                                                                color: Colors.grey,
                                                              ),
                                                            ),
                                                        errorWidget:
                                                            (context, url, error) =>
                                                            Icon(Icons.error),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: Get.height * 0.03,
                                                ),
                                                Row(
                                                  children: [
                                                    SizedBox(
                                                      width: Get.width * 0.04,
                                                    ),
                                                    Text(
                                                      createNewMatchesController.createNewMatchesList.value.allseekers![itemIndex].name.toString(),
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 12,
                                                          fontWeight:
                                                          FontWeight.w600),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: Get.height * 0.005,
                                                ),
                                                Row(
                                                  children: [
                                                    SizedBox(
                                                      width: Get.width * 0.04,
                                                    ),
                                                    Text(
                                                      createNewMatchesController.createNewMatchesList.value.allseekers![itemIndex].occupationName.toString(),
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 8,
                                                          fontWeight:
                                                          FontWeight.w400),
                                                      softWrap: true,
                                                      overflow: TextOverflow.ellipsis,
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: Get.height * 0.005,
                                                ),
                                                Row(
                                                  children: [
                                                    SizedBox(
                                                      width: Get.width * 0.04,
                                                    ),
                                                   Container(
                                                     width: Get.width * .3,
                                                     child:  Text(
                                                       createNewMatchesController.createNewMatchesList.value.allseekers![itemIndex].address.toString(),
                                                       style: TextStyle(
                                                           color: Colors.black,
                                                           fontSize: 6,
                                                           fontWeight:
                                                           FontWeight.w400),
                                                       softWrap: true,
                                                       overflow: TextOverflow.ellipsis,
                                                     ),
                                                   )
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: Get.height * 0.015,
                                                ),
                                                Row(
                                                  children: [
                                                    SizedBox(
                                                      width: Get.width * 0.04,
                                                    ),
                                                    Text(
                                                      'Interest',
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 8,
                                                          fontWeight:
                                                          FontWeight.w600),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: Get.height * 0.005,
                                                ),
                                                Row(
                                                  children: [
                                                    SizedBox(
                                                      width: Get.width * 0.04,
                                                    ),
                                                    // Text(
                                                    //   'American',
                                                    //   style: TextStyle(
                                                    //       fontSize: 6,
                                                    //       fontWeight:
                                                    //           FontWeight.w400),
                                                    // ),
                                                    (createNewMatchesController.createNewMatchesList.value.allseekers![itemIndex].details!.interestName!=null)? Row(children: [
                                                      for (var i = 0;  createNewMatchesController.createNewMatchesList.value.allseekers![itemIndex].details!.interestName!.length > i; i++)
                                                        Text(
                                                          createNewMatchesController.createNewMatchesList.value.allseekers![itemIndex].details!.interestName![i].title.toString()+" ",
                                                          style: TextStyle(
                                                              fontSize: 6,
                                                              color: Colors.black,
                                                              fontWeight:
                                                              FontWeight.w400),
                                                          softWrap: true,
                                                          overflow: TextOverflow.ellipsis,
                                                        ),

                                                    ],):Container(),


                                                  ],
                                                ),
                                                SizedBox(
                                                  height: Get.height * 0.01,
                                                ),
                                                Row(
                                                  children: [
                                                    SizedBox(
                                                      width: Get.width * 0.02,
                                                    ),
                                                    (createNewMatchesController.createNewMatchesList.value.allseekers![itemIndex].religion==null || createNewMatchesController.createNewMatchesList.value.allseekers![itemIndex].religion=="")?Container(
                                                      // child: SizedBox(width: Get.width*0.18,),
                                                    ):Container(
                                                        height: Get.height * 0.03,
                                                        width: Get.width * 0.19,
                                                        decoration: BoxDecoration(
                                                          color: Color.fromRGBO(
                                                              244, 244, 244, 1),
                                                          border:
                                                          Border.all(width: 1),
                                                          borderRadius:
                                                          BorderRadius.circular(
                                                              60),
                                                        ),
                                                        child: Row(
                                                          children: [
                                                            SizedBox(
                                                              width:
                                                              Get.width * 0.005,
                                                            ),
                                                            Container(
                                                              height: Get.height *
                                                                  0.015,
                                                              width:
                                                              Get.width * 0.08,
                                                              child: Image.asset(
                                                                'assets/icons/religon.png',
                                                                fit: BoxFit.contain,
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width: Get.width *
                                                                  0.0001,
                                                            ),
                                                            Text(
                                                              createNewMatchesController.createNewMatchesList.value.allseekers![itemIndex].religion.toString() ,
                                                              style: TextStyle(
                                                                  color: Colors.black,
                                                                  fontSize: 6,
                                                                  fontWeight:
                                                                  FontWeight
                                                                      .w400),
                                                              softWrap: true,
                                                              overflow: TextOverflow.ellipsis,
                                                            ),
                                                          ],
                                                        )),
                                                    SizedBox(
                                                      width: Get.width * 0.02,
                                                    ),
                                                    (createNewMatchesController.createNewMatchesList.value.allseekers![itemIndex].height==null || createNewMatchesController.createNewMatchesList.value.allseekers![itemIndex].height=="")?Container(
                                                      // child: SizedBox(width: Get.width*0.18,),
                                                    ):Container(
                                                        height: Get.height * 0.03,
                                                        width: Get.width * 0.19,
                                                        decoration: BoxDecoration(
                                                          color: Color.fromRGBO(
                                                              244, 244, 244, 1),
                                                          border:
                                                          Border.all(width: 1),
                                                          borderRadius:
                                                          BorderRadius.circular(
                                                              60),
                                                        ),
                                                        child: Row(
                                                          children: [
                                                            SizedBox(
                                                              width:
                                                              Get.width * 0.005,
                                                            ),
                                                            Container(
                                                              height: Get.height *
                                                                  0.015,
                                                              width:
                                                              Get.width * 0.08,
                                                              child: Image.asset(
                                                                'assets/icons/height.png',
                                                                fit: BoxFit.contain,
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width: Get.width *
                                                                  0.0001,
                                                            ),
                                                            Text(
                                                              createNewMatchesController.createNewMatchesList.value.allseekers![itemIndex].height,
                                                              style: TextStyle(
                                                                  color: Colors.black,
                                                                  fontSize: 6,
                                                                  fontWeight:
                                                                  FontWeight
                                                                      .w400),
                                                              softWrap: true,
                                                              overflow: TextOverflow.ellipsis,
                                                            ),
                                                          ],
                                                        )),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: Get.height * 0.01,
                                                ),
                                                Row(
                                                  children: [
                                                    SizedBox(
                                                      width: Get.width * 0.02,
                                                    ),
                                                    (createNewMatchesController.createNewMatchesList.value.allseekers![itemIndex].salary==null || createNewMatchesController.createNewMatchesList.value.allseekers![itemIndex].salary=="")?Container(
                                                      child: SizedBox(width: Get.width*0.18,),
                                                    ):Container(
                                                        height: Get.height * 0.03,
                                                        width: Get.width * 0.19,
                                                        decoration: BoxDecoration(
                                                          color: Color.fromRGBO(
                                                              244, 244, 244, 1),
                                                          border:
                                                          Border.all(width: 1),
                                                          borderRadius:
                                                          BorderRadius.circular(
                                                              60),
                                                        ),
                                                        child: Row(
                                                          children: [
                                                            // SizedBox(width: Get.width*0.005,),
                                                            Container(
                                                              height: Get.height *
                                                                  0.015,
                                                              width:
                                                              Get.width * 0.06,
                                                              child: Image.asset(
                                                                'assets/icons/money.png',
                                                                fit: BoxFit.contain,
                                                              ),
                                                            ),
                                                            // SizedBox(width: Get.width*0.002,),
                                                            Text(
                                                              createNewMatchesController.createNewMatchesList.value.allseekers![itemIndex].salary.toString()+ ' Monthly',
                                                              style: TextStyle(
                                                                  color: Colors.black,
                                                                  fontSize: 6,
                                                                  fontWeight:
                                                                  FontWeight
                                                                      .w400),
                                                              softWrap: true,
                                                              overflow: TextOverflow.ellipsis,
                                                            ),
                                                          ],
                                                        )
                                                    ),
                                                    SizedBox(
                                                      width: Get.width * 0.15,
                                                    ),
                                                    Container(
                                                      height: Get.height * 0.05,
                                                      width: Get.width * 0.05,
                                                      child: Image.asset(
                                                        'assets/icons/next.png',
                                                        fit: BoxFit.contain,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ]),
                      Positioned(
                        child: Container(
                          height: Get.height * 0.19,
                          width: Get.width,
                          color: Colors.white,
                        ),
                      ),
                      Positioned(
                        top: 18,
                        child: Row(
                          children: [
                            SizedBox(
                              width: Get.width * 0.045,
                            ),
                            Container(
                              height: Get.height * 0.16,
                              width: Get.width * 0.91,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image(
                                    image:
                                    AssetImage('assets/images/banner.png'),
                                    fit: BoxFit.fill),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                          top: Get.height * 0.3,
                          left: Get.width * 0.36,
                          child: GestureDetector(
                            onTap: () {
                              print('1');
                              print( seekerViewMyProfileController
                                  .ViewProfileDetail
                                  .value
                                  .profileDetails![0] .name.toString()+' '+createNewMatchesController.createNewMatchesList.value.allseekers![createNewMatchesController.currentIndex.toInt()].name.toString());
                            },
                            child: Container(
                              height: Get.height * 0.15,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      width: 2,
                                      color: Color.fromRGBO(254, 0, 145, 1))),
                              child: Center(
                                child: Image(
                                    image:
                                    AssetImage('assets/images/Group 238.png'),
                                    fit: BoxFit.cover),
                              ),
                            ),
                          ))
                    ],
                  ),
                ],
              );
          }
        }),
      ),
    );
  }
}
