

import 'package:flutter/material.dart';

class AcceptRequestwidget extends StatefulWidget {
  const AcceptRequestwidget({super.key});

  @override
  State<AcceptRequestwidget> createState() => _AcceptRequestwidgetState();
}

class _AcceptRequestwidgetState extends State<AcceptRequestwidget> {
  @override
  Widget build(BuildContext context) {

        final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return                   Column(
      children: [
        Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            // height: height * .5,
                            width: width * .46,
                            decoration: BoxDecoration(
                                color: Color(0xffF3F3F3),
                                borderRadius: BorderRadius.circular(15)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: height * .3,
                                    width: width * .42,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: Image.network(
                                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTUMVgZA0_97XbZH3bBs4y-gaAQ-pNWgZuUjnOj3k3GHQ&usqp=CAU&ec=48600112",
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: height * .03,
                                  ),
                                  Text(
                                    "Jake, 22",
                                    style: Theme.of(context).textTheme.titleSmall,
                                  ),
                                  SizedBox(
                                    height: height * .005,
                                  ),
                                  Text(
                                    "Fashion Designer",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(color: Colors.grey),
                                  ),
                                  SizedBox(
                                    height: height * .005,
                                  ),
                                  Text(
                                    "Jaipur, Indian",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .copyWith(color: Colors.grey),
                                  ),
                                  SizedBox(
                                    height: height * .03,
                                  ),
                                  Text(
                                    "Interest",
                                    style: Theme.of(context).textTheme.titleSmall,
                                  ),
                                  SizedBox(
                                    height: height * .005,
                                  ),
                                  Text(
                                    "American",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .copyWith(color: Colors.grey),
                                  ),
                                  SizedBox(
                                    height: height * .03,
                                  ),
                                  Wrap(
                                    runSpacing: 8.0,
                                    spacing: 6.0,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            border: Border.all(color: Colors.black),
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        height: height * .04,
                                        width: width * .18,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Image.asset("assets/icons/religon.png"),
                                            SizedBox(width: width * .01),
                                            // Transform.scale(
                                            //     scale: 2,
                                            //     child: IconButton(
                                            //         icon: ImageIcon(
                                            //           AssetImage(
                                            //               'assets/icons/religon.png'),
                                            //           size: 50,color: Colors.amber,
                                            //         ),
                                            //         onPressed: null)),
                                            Text(
                                              "Hindu",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodySmall,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                            border: Border.all(color: Colors.black),
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        height: height * .04,
                                        width: width * .22,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Image.asset("assets/icons/height.png"),
                                            SizedBox(width: width * .01),
                                            Text(
                                              "6 Feet 2.8",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodySmall,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                            border: Border.all(color: Colors.black),
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        height: height * .04,
                                        width: width * .25,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Image.asset("assets/icons/money.png"),
                                            SizedBox(width: width * .01),
                                            // Transform.scale(
                                            //     scale: 2,
                                            //     child: IconButton(
                                            //         icon: ImageIcon(
                                            //           AssetImage(
                                            //               'assets/icons/religon.png'),
                                            //           size: 50,color: Colors.amber,
                                            //         ),
                                            //         onPressed: null)),
                                            Text(
                                              "30k Monthly",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodySmall,
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  Align(
                                      alignment: Alignment.bottomRight,
                                      child: Image.asset("assets/icons/next.png"))
                                ],
                              ),
                            ),
                          ),
                         
                               Container(
                            // height: height * .5,
                            width: width * .46,
                            decoration: BoxDecoration(
                                color: Color(0xffF3F3F3),
                                borderRadius: BorderRadius.circular(15)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: height * .3,
                                    width: width * .42,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: Image.network(
                                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTUMVgZA0_97XbZH3bBs4y-gaAQ-pNWgZuUjnOj3k3GHQ&usqp=CAU&ec=48600112",
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: height * .03,
                                  ),
                                  Text(
                                    "Jake, 22",
                                    style: Theme.of(context).textTheme.titleSmall,
                                  ),
                                  SizedBox(
                                    height: height * .005,
                                  ),
                                  Text(
                                    "Fashion Designer",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(color: Colors.grey),
                                  ),
                                  SizedBox(
                                    height: height * .005,
                                  ),
                                  Text(
                                    "Jaipur, Indian",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .copyWith(color: Colors.grey),
                                  ),
                                  SizedBox(
                                    height: height * .03,
                                  ),
                                  Text(
                                    "Interest",
                                    style: Theme.of(context).textTheme.titleSmall,
                                  ),
                                  SizedBox(
                                    height: height * .005,
                                  ),
                                  Text(
                                    "American",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .copyWith(color: Colors.grey),
                                  ),
                                  SizedBox(
                                    height: height * .03,
                                  ),
                                  Wrap(
                                    runSpacing: 8.0,
                                    spacing: 6.0,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            border: Border.all(color: Colors.black),
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        height: height * .04,
                                        width: width * .18,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Image.asset("assets/icons/religon.png"),
                                            SizedBox(width: width * .01),
                                            // Transform.scale(
                                            //     scale: 2,
                                            //     child: IconButton(
                                            //         icon: ImageIcon(
                                            //           AssetImage(
                                            //               'assets/icons/religon.png'),
                                            //           size: 50,color: Colors.amber,
                                            //         ),
                                            //         onPressed: null)),
                                            Text(
                                              "Hindu",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodySmall,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                            border: Border.all(color: Colors.black),
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        height: height * .04,
                                        width: width * .22,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Image.asset("assets/icons/height.png"),
                                            SizedBox(width: width * .01),
                                            Text(
                                              "6 Feet 2.8",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodySmall,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                            border: Border.all(color: Colors.black),
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        height: height * .04,
                                        width: width * .25,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Image.asset("assets/icons/money.png"),
                                            SizedBox(width: width * .01),
                                            // Transform.scale(
                                            //     scale: 2,
                                            //     child: IconButton(
                                            //         icon: ImageIcon(
                                            //           AssetImage(
                                            //               'assets/icons/religon.png'),
                                            //           size: 50,color: Colors.amber,
                                            //         ),
                                            //         onPressed: null)),
                                            Text(
                                              "30k Monthly",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodySmall,
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  Align(
                                      alignment: Alignment.bottomRight,
                                      child: Image.asset("assets/icons/next.png"))
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),



       
       
       
     Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  SizedBox(
                    height: height * .03,
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap:(){
                          // Get.to(()=>ChatScreen());
                        },
                        child: Container(
                          height: height * .04,
                          width: width * .21,
                          decoration: BoxDecoration(
                            color: Color(0xffFE0091),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Center(
                            child: Text(
                              "Accept",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: width * .02,
                      ),
                      Container(
                        height: height * .04,
                        width: width * .21,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: Color(0xff000CAA))),
                        child: Center(
                          child: Text(
                            "Declined",
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(color: Color(0xff000CAA)),
                          ),
                        ),
                      ),
                    ],
                  ),
                  
    
                ],
              ),
            )
      ],
    );
  }


}