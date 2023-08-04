// import 'dart:math';

// import 'package:cupid_match/match_seeker/lever/request_makers.dart';
// import 'package:cupid_match/widgets/drawer.dart';
// import 'package:cupid_match/widgets/my_button.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_slot_machine/slot_machine.dart';
// import 'package:get/get.dart';

// class LeverPull extends StatefulWidget {
//   const LeverPull({Key? key}) : super(key: key);

//   @override
//   State<LeverPull> createState() => _LeverPullState();
// }

// class _LeverPullState extends State<LeverPull> {
//   late SlotMachineController _controller;
//   bool isVisible = true;
//   bool isNotVisible = false;
//   final _scaffoldKey = GlobalKey<ScaffoldState>();
// @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//   }
//   void onButtonTap({required int index}) {
//     _controller.stop(reelIndex: index);
//   }

//   void onStart() {
//     final index = Random().nextInt(20);
//     _controller.start(hitRollItemIndex: index < 5 ? index : null);
//   }
//   @override
//   Widget build(BuildContext context) {
//     final height = MediaQuery.of(context).size.height;
//     final width = MediaQuery.of(context).size.width;
//     return Scaffold(
//       key: _scaffoldKey,
//       endDrawer: MyDrawer(),
//       // appBar: AppBar(
//       //   automaticallyImplyLeading: false,
//       //   title: Row(
//       //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       //     children: [
//       //       Align(
//       //         alignment: Alignment.topLeft,
//       //         child: Text(
//       //           "Home",
//       //           style: Theme.of(context).textTheme.titleSmall,
//       //         ),
//       //       ),
//       //       GestureDetector(
//       //           onTap: () {
//       //             _scaffoldKey.currentState!.openEndDrawer();
//       //           },
//       //           child: Image.asset("assets/icons/menu.png"))
//       //     ],
//       //   ),
//       // ),
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(18.0),
//           child: ListView(
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Align(
//                     alignment: Alignment.topLeft,
//                     child: Text(
//                       "Home",
//                       style: Theme.of(context).textTheme.titleSmall,
//                     ),
//                   ),
//                   GestureDetector(
//                       onTap: () {
//                         _scaffoldKey.currentState!.openEndDrawer();
//                       },
//                       child: Image.asset("assets/icons/menu.png")),
//                 ],
//               ),
//               SizedBox(
//                 height: height * .03,
//               ),
//               Center(child: Image.asset("assets/images/match.png")),
//               SizedBox(
//                 height: height * .06,
//               ),
//               Row(mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Center(
//                     child: SlotMachine(
//                       rollItems: [
//                         RollItem(
//                             index: 0,
//                             child: Image.asset('assets/maker/pull.png')),
//                         RollItem(
//                             index: 1,
//                             child: Image.asset('assets/maker/pulll.png')),
//                         RollItem(
//                             index: 2,
//                             child: Image.asset('assets/maker/pullll.png')),
//                         RollItem(
//                             index: 3,
//                             child: Image.asset('assets/maker/pullll.png')),

//                       ],
//                       onCreated: (controller) {
//                         _controller = controller;
//                       },
//                       onFinished: (resultIndexes) {
//                         print('Result: $resultIndexes');
//                       },
//                     ),
//                   ),
//                   GestureDetector(
//                       onTap: ()async {
//                         setState(() {
//                           isVisible = !isVisible;
//                           isNotVisible = !isNotVisible;
//                         });

//                           onStart();
//                           await Future.delayed(Duration(seconds: 1));
//                           onButtonTap(index: 0);
//                           onButtonTap(index: 1);
//                           onButtonTap(index: 2);

//                       },
//                       child: Image.asset("assets/maker/lever.png")),
//                 ],
//               ),
//               // Padding(
//               //   padding: const EdgeInsets.only(top: 16),
//               //   child: Row(
//               //     mainAxisAlignment: MainAxisAlignment.center,
//               //     children: [
//               //       SizedBox(
//               //         width: 72,
//               //         height: 44,
//               //         child: TextButton(
//               //             child: Text('STOP'),
//               //             onPressed: () => onButtonTap(index: 0)),
//               //       ),
//               //       SizedBox(width: 8),
//               //       SizedBox(
//               //         width: 72,
//               //         height: 44,
//               //         child: TextButton(
//               //             child: Text('STOP'),
//               //             onPressed: () => onButtonTap(index: 1)),
//               //       ),
//               //       SizedBox(width: 8),
//               //       SizedBox(
//               //         width: 72,
//               //         height: 44,
//               //         child: TextButton(
//               //             child: Text('STOP'),
//               //             onPressed: () => onButtonTap(index: 2)),
//               //       ),
//               //     ],
//               //   ),
//               // ),
//               // Padding(
//               //   padding: const EdgeInsets.only(top: 24),
//               //   child: TextButton(
//               //     child: Text('START'),
//               //     onPressed: () => onStart(),
//               //   ),
//               // ),
//               // Row(
//               //   mainAxisAlignment: MainAxisAlignment.center,
//               //   children: [
//               //     Image.asset("assets/maker/pull.png"),
//               //     SizedBox(
//               //       width: width * .06,
//               //     ),
//               //     GestureDetector(
//               //         onTap: () {
//               //           showDialog(
//               //             barrierDismissible: false,
//               //             context: context,
//               //             builder: (context) {
//               //               return AlertDialog(
//               //                 shape: RoundedRectangleBorder(
//               //                     borderRadius:
//               //                         BorderRadius.all(Radius.circular(32.0))),
//               //                 insetPadding: EdgeInsets.all(0),
//               //                 title: Column(
//               //                   children: [
//               //                     Align(
//               //                         alignment: Alignment.bottomRight,
//               //                         child: GestureDetector(
//               //                           onTap: () {
//               //                             Get.back();
//               //                           },
//               //                           child: Image.asset(
//               //                               "assets/icons/cancel.png"),
//               //                         )),
//               //                     Stack(
//               //                       children: <Widget>[
//               //                         Center(
//               //                           child: Container(
//               //                             height: height * .3,
//               //                             width: width * .3,
//               //                             child: CircleAvatar(
//               //                               radius: 30.0,
//               //                               backgroundImage: NetworkImage(
//               //                                   "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR2av8pAdOHJdgpwkYC5go5OE07n8-tZzTgwg&usqp=CAU"),
//               //                               backgroundColor: Colors.transparent,
//               //                             ),
//               //                           ),
//               //                         ),
//               //                         Positioned(
//               //                             top: 80,
//               //                             left: 55,
//               //                             right: 0,
//               //                             child: Image.asset(
//               //                                 "assets/icons/locked 1.png"))
//               //                       ],
//               //                     ),
//               //                     Text(
//               //                       "How old do you think i am",
//               //                       style:
//               //                           Theme.of(context).textTheme.titleSmall,
//               //                     ),
//               //                     SizedBox(
//               //                       height: height * .01,
//               //                     ),
//               //                     GestureDetector(
//               //                       onTap: () {
//               //                         showDialog(
//               //                           barrierDismissible: false,
//               //                           context: context,
//               //                           builder: (context) {
//               //                             return AlertDialog(
//               //                               shape: RoundedRectangleBorder(
//               //                                   borderRadius: BorderRadius.all(
//               //                                       Radius.circular(32.0))),
//               //                               insetPadding: EdgeInsets.all(0),
//               //                               title: Column(
//               //                                 children: [
//               //                                   Align(
//               //                                       alignment:
//               //                                           Alignment.bottomRight,
//               //                                       child: GestureDetector(
//               //                                         onTap: () {
//               //                                           Get.back();
//               //                                         },
//               //                                         child: Image.asset(
//               //                                             "assets/icons/cancel.png"),
//               //                                       )),
//               //                                   Stack(
//               //                                     children: <Widget>[
//               //                                       Center(
//               //                                         child: Container(
//               //                                           height: height * .3,
//               //                                           width: width * .3,
//               //                                           child: CircleAvatar(
//               //                                             radius: 30.0,
//               //                                             backgroundImage:
//               //                                                 NetworkImage(
//               //                                                     "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR2av8pAdOHJdgpwkYC5go5OE07n8-tZzTgwg&usqp=CAU"),
//               //                                             backgroundColor:
//               //                                                 Colors
//               //                                                     .transparent,
//               //                                           ),
//               //                                         ),
//               //                                       ),
//               //                                       Positioned(
//               //                                           top: 80,
//               //                                           left: 55,
//               //                                           right: 0,
//               //                                           child: Image.asset(
//               //                                               "assets/icons/unlocked 1.png"))
//               //                                     ],
//               //                                   ),
//               //                                   Text(
//               //                                     "Profile Unlocked",
//               //                                     style: Theme.of(context)
//               //                                         .textTheme
//               //                                         .titleSmall,
//               //                                   ),
//               //                                   SizedBox(
//               //                                     height: height * .01,
//               //                                   ),
//               //                                   Text(
//               //                                     "Your answer is correct.",
//               //                                     style: Theme.of(context)
//               //                                         .textTheme
//               //                                         .bodySmall!
//               //                                         .copyWith(
//               //                                             color: Colors.grey),
//               //                                   ),
//               //                                   SizedBox(
//               //                                     height: height * .02,
//               //                                   ),
//               //                                   GestureDetector(
//               //                                     onTap: () {
//               //                                       showDialog(
//               //                                         barrierDismissible: false,
//               //                                         context: context,
//               //                                         builder: (context) {
//               //                                           return AlertDialog(
//               //                                             shape: RoundedRectangleBorder(
//               //                                                 borderRadius: BorderRadius
//               //                                                     .all(Radius
//               //                                                         .circular(
//               //                                                             32.0))),
//               //                                             insetPadding:
//               //                                                 EdgeInsets.all(0),
//               //                                             title: Column(
//               //                                               children: [
//               //                                                 Align(
//               //                                                     alignment:
//               //                                                         Alignment
//               //                                                             .bottomRight,
//               //                                                     child:
//               //                                                         GestureDetector(
//               //                                                       onTap: () {
//               //                                                         Get.back();
//               //                                                       },
//               //                                                       child: Image
//               //                                                           .asset(
//               //                                                               "assets/icons/cancel.png"),
//               //                                                     )),
//               //                                                 Stack(
//               //                                                   children: <Widget>[
//               //                                                     Center(
//               //                                                       child:
//               //                                                           Container(
//               //                                                         height:
//               //                                                             height *
//               //                                                                 .3,
//               //                                                         width:
//               //                                                             width *
//               //                                                                 .3,
//               //                                                         child:
//               //                                                             CircleAvatar(
//               //                                                           radius:
//               //                                                               30.0,
//               //                                                           backgroundImage:
//               //                                                               NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR2av8pAdOHJdgpwkYC5go5OE07n8-tZzTgwg&usqp=CAU"),
//               //                                                           backgroundColor:
//               //                                                               Colors.transparent,
//               //                                                         ),
//               //                                                       ),
//               //                                                     ),
//               //                                                     Positioned(
//               //                                                         top: 80,
//               //                                                         left: 50,
//               //                                                         right: 0,
//               //                                                         child: Image
//               //                                                             .asset(
//               //                                                                 "assets/icons/locked 1.png"))
//               //                                                   ],
//               //                                                 ),
//               //                                                 Text(
//               //                                                   "Profile locked",
//               //                                                   style: Theme.of(
//               //                                                           context)
//               //                                                       .textTheme
//               //                                                       .titleSmall,
//               //                                                 ),
//               //                                                 SizedBox(
//               //                                                   height: height *
//               //                                                       .01,
//               //                                                 ),
//               //                                                 Text(
//               //                                                   "Better Luck Next Time!",
//               //                                                   style: Theme.of(
//               //                                                           context)
//               //                                                       .textTheme
//               //                                                       .bodySmall!
//               //                                                       .copyWith(
//               //                                                           color: Colors
//               //                                                               .grey),
//               //                                                 ),
//               //                                                 SizedBox(
//               //                                                   height: height *
//               //                                                       .02,
//               //                                                 ),
//               //                                                 GestureDetector(
//               //                                                   onTap: () {
//               //                                                     // Get.to(() =>
//               //                                                     //     HomeScreen());
//               //                                                   },
//               //                                                   child:
//               //                                                       Container(
//               //                                                     height:
//               //                                                         height *
//               //                                                             .04,
//               //                                                     width: width *
//               //                                                         .3,
//               //                                                     decoration:
//               //                                                         BoxDecoration(
//               //                                                       color: Color(
//               //                                                           0xffFE0091),
//               //                                                       borderRadius:
//               //                                                           BorderRadius.circular(
//               //                                                               15),
//               //                                                     ),
//               //                                                     child: Center(
//               //                                                       child: Text(
//               //                                                         "Back",
//               //                                                         style: Theme.of(
//               //                                                                 context)
//               //                                                             .textTheme
//               //                                                             .bodySmall!
//               //                                                             .copyWith(
//               //                                                                 color: Colors.white),
//               //                                                       ),
//               //                                                     ),
//               //                                                   ),
//               //                                                 ),
//               //                                                 SizedBox(
//               //                                                   height: MediaQuery.of(
//               //                                                               context)
//               //                                                           .size
//               //                                                           .height *
//               //                                                       .02,
//               //                                                 ),
//               //                                               ],
//               //                                             ),
//               //                                           );
//               //                                         },
//               //                                       );
//               //                                     },
//               //                                     child: Container(
//               //                                       height: height * .04,
//               //                                       width: width * .3,
//               //                                       decoration: BoxDecoration(
//               //                                         color: Color(0xffFE0091),
//               //                                         borderRadius:
//               //                                             BorderRadius.circular(
//               //                                                 15),
//               //                                       ),
//               //                                       child: Center(
//               //                                         child: Text(
//               //                                           "Message",
//               //                                           style: Theme.of(context)
//               //                                               .textTheme
//               //                                               .bodySmall!
//               //                                               .copyWith(
//               //                                                   color: Colors
//               //                                                       .white),
//               //                                         ),
//               //                                       ),
//               //                                     ),
//               //                                   ),
//               //                                   SizedBox(
//               //                                     height: MediaQuery.of(context)
//               //                                             .size
//               //                                             .height *
//               //                                         .02,
//               //                                   ),
//               //                                 ],
//               //                               ),
//               //                             );
//               //                           },
//               //                         );
//               //                       },
//               //                       child: Container(
//               //                         height: height * .04,
//               //                         width: width * .3,
//               //                         decoration: BoxDecoration(
//               //                           color: Color(0xffFE0091),
//               //                           borderRadius: BorderRadius.circular(15),
//               //                         ),
//               //                         child: Center(
//               //                           child: Text(
//               //                             "Submit",
//               //                             style: Theme.of(context)
//               //                                 .textTheme
//               //                                 .bodySmall!
//               //                                 .copyWith(color: Colors.white),
//               //                           ),
//               //                         ),
//               //                       ),
//               //                     ),
//               //                     SizedBox(
//               //                       height: MediaQuery.of(context).size.height *
//               //                           .02,
//               //                     ),
//               //                   ],
//               //                 ),
//               //               );
//               //             },
//               //           );
//               //         },
//               //         child: Image.asset("assets/maker/pulll.png")),
//               //     SizedBox(
//               //       width: width * .06,
//               //     ),
//               //     Image.asset("assets/maker/pullll.png"),
//               //
//               //   ],
//               // ),
//               SizedBox(
//                 height: height * .03,
//               ),
//               Visibility(
//                 visible: isVisible,
//                 child: Align(
//                   alignment: Alignment.center,
//                   child: Text(
//                     "Please Pull the Lever",
//                     style: Theme.of(context).textTheme.titleLarge,
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: height * .03,
//               ),
//               Visibility(
//                 visible: isNotVisible,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       "Request to be Makers",
//                       style: Theme.of(context).textTheme.titleSmall,
//                     ),
//                     GestureDetector(
//                       onTap: () {
//                         Get.to(() => RequestMakers());
//                       },
//                       child: Text(
//                         "See all",
//                         style: Theme.of(context)
//                             .textTheme
//                             .labelLarge!
//                             .copyWith(color: Color(0xff000CAA)),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(
//                 height: height * .02,
//               ),
//               Visibility(
//                 visible: isNotVisible,
//                 child: Container(
//                   width: width * 1,
//                   height: height * .2,
//                   child: ListView.builder(
//                     physics: NeverScrollableScrollPhysics(),
//                     itemCount: 2,
//                     itemExtent: 80,
//                     shrinkWrap: true,
//                     itemBuilder: (context, index) {
//                       return Row(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: [
//                           CircleAvatar(
//                             radius: 30.0,
//                             backgroundImage: NetworkImage(
//                                 "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR2av8pAdOHJdgpwkYC5go5OE07n8-tZzTgwg&usqp=CAU"),
//                             backgroundColor: Colors.transparent,
//                           ),
//                           SizedBox(
//                             width: width * .03,
//                           ),
//                           Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 "John Deo",
//                                 style: Theme.of(context).textTheme.titleSmall,
//                               ),
//                               SizedBox(
//                                 height: height * .01,
//                               ),
//                               Text(
//                                 "Match Maker",
//                                 style: Theme.of(context)
//                                     .textTheme
//                                     .bodySmall!
//                                     .copyWith(color: Colors.grey),
//                               ),
//                             ],
//                           ),
//                           SizedBox(width: width * .17),
//                           GestureDetector(
//                             onTap: () {},
//                             child: MyButton(
//                                 height: height * .04,
//                                 width: width * .3,
//                                 title: "Request",
//                                 onTap: () {}),
//                           )
//                         ],
//                       );
//                     },
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
