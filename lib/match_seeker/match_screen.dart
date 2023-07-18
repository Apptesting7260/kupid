import 'package:cupid_match/match_maker/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MatchScreen extends StatefulWidget {
  const MatchScreen({Key? key}) : super(key: key);

  @override
  State<MatchScreen> createState() => _MatchScreenState();
}

class _MatchScreenState extends State<MatchScreen> {
  TextEditingController messagecontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              height: height * .1,
              width: width * 1,
              decoration: BoxDecoration(
                color: Color(0xffF3F3F3),
              ),
              child: Padding(
                padding: const EdgeInsets.all(11.0),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Icon(
                        Icons.arrow_back_ios,
                        size: 25,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(width: width * .02),
                    CircleAvatar(
                      radius: 30.0,
                      backgroundImage: NetworkImage(
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR2av8pAdOHJdgpwkYC5go5OE07n8-tZzTgwg&usqp=CAU"),
                      backgroundColor: Colors.transparent,
                    ),
                    SizedBox(width: width * .05),
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
                          "Hey! How\'s it going?",
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(color: Colors.grey),
                        ),
                      ],
                    ),
                    SizedBox(width: width * .25),
                    Image.asset("assets/icons/menuu.png")
                  ],
                ),
              ),
            ),
            SizedBox(height: height*.03),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: height * .72,
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
                        height: height * .72,
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
                                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRK-ZKfGu1ROysU_T0exLpE3gpcPGyxyHsWtnhpHhR8EA&usqp=CAU&ec=48600112",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: height * .03,
                              ),
                              Text(
                                "Skyler, 20",
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                              SizedBox(
                                height: height * .005,
                              ),
                              Text(
                                "Makeup Artist",
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
                                "Indian",
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
                                    width: width * .2,
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
                                          "Christion",
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
                                          "5 Feet 2.8",
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
                                          "25k Monthly",
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
                      )
                    ],
                  ),
                  SizedBox(
                    height: height * .03,
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap:(){
                          Get.to(()=>ChatScreen());
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
                  SizedBox(
                    height: height * .2,
                  ),
                  Wrap(
                    runSpacing: 8.0,
                    spacing: 6.0,
                    children: [
                      GestureDetector(
                        onTap: () {
                          messagecontroller.text = "Hello!";
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(20)),
                          height: height * .04,
                          width: width * .18,
                          child: Center(
                            child: Text(
                              "Hello!",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(color: Colors.grey),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          messagecontroller.text = "How are you?";
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(20)),
                          height: height * .04,
                          width: width * .3,
                          child: Center(
                            child: Text(
                              "How are you?",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(color: Colors.grey),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          messagecontroller.text = "What are you doing?";
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(20)),
                          height: height * .04,
                          width: width * .37,
                          child: Center(
                            child: Text(
                              "What are you doing?",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(color: Colors.grey),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * .02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset("assets/icons/camera.png"),
                      Container(
                        height: height * .06,
                        width: width * .7,
                        child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          controller: messagecontroller,
                          validator: (value) {},
                          decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15.0)),
                                  borderSide:
                                      BorderSide(color: Color(0xffF3F3F3))),
                              hintStyle: TextStyle(
                                  fontSize: 16, color: Color(0xffBABABA)),
                              contentPadding: EdgeInsets.all(12),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15.0)),
                                  borderSide:
                                      BorderSide(color: Color(0xffF3F3F3))),
                              errorBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15.0)),
                                  borderSide:
                                      BorderSide(color: Color(0xffF3F3F3))),
                              focusedErrorBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15.0)),
                                borderSide:
                                    BorderSide(color: Color(0xffF3F3F3)),
                              ),
                              hintText: "Type a message...",
                              filled: true,
                              fillColor: Color(0xffF3F3F3)),
                        ),
                      ),
                      Icon(
                        Icons.send_rounded,
                        size: 35,
                        color: Color(0xffFE0091),
                      )
                    ],
                  ),

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
