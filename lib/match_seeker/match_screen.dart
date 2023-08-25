import 'package:cupid_match/controllers/controller/RequestDetailsController/RequestDetailsController.dart';
import 'package:cupid_match/match_maker/chat_screen.dart';
import 'package:cupid_match/match_seeker/chat/RequestAcceptWidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  TextEditingController messagecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(

      
      child: Scaffold(

        appBar:AppBar(
          
          actions: [Container(child:               Image.asset("assets/icons/menuu.png"),)],
          leading: GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Icon(
                        Icons.arrow_back_ios,
                        size: 25,
                        color: Colors.black,
                      ),
                    ),
                    
                    title: Container( child:Row(children: [ SizedBox(width: width * .02),
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
                    ],),),),

        body: SingleChildScrollView( child: Column(
          children: [
           
            // SizedBox(height: height*.03),

            AcceptRequestwidget(),

            SizedBox(height: Get.height*0.02,),

            Row(
              children: [
                Wrap(
                        runSpacing: 8.0,
                        spacing: 6.0,
                        children: [
                          GestureDetector(
                            onTap: () {
                              // messagecontroller.text = "Hello!";
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
                              // messagecontroller.text = "How are you?";
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
                              // messagecontroller.text = "What are you doing?";
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
              ],
            ),


            SizedBox(height: Get.height*0.02,),
       
          ],
        ),
      ),
      bottomNavigationBar: Container(width:Get.width,child:  Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
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
      ),),
      ),
    );
  }
}
