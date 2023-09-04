import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cupid_match/controllers/controller/RequestDetailsController/RequestDetailsController.dart';
import 'package:cupid_match/controllers/controller/ViewSikerDetailsController/ViewSikerDetaolsController.dart';
import 'package:cupid_match/data/response/status.dart';
import 'package:cupid_match/match_maker/chat_screen.dart';
import 'package:cupid_match/match_seeker/chat/RequestAcceptWidget.dart';
import 'package:cupid_match/res/components/general_exception.dart';
import 'package:cupid_match/res/components/internet_exceptions_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  TextEditingController messagecontroller = TextEditingController();


    final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final ViewRequestDetailsControllerinstance=Get.put(ViewRequestDetailsController());
  
  final ViewSikerProfileDetailsControllernstance=Get.put(ViewSikerProfileDetailsController());
   String formatTimestamp(Timestamp timestamp) {
    final DateTime dateTime = timestamp.toDate();
    final DateFormat formatter = DateFormat('h:mm a');
    return formatter.format(dateTime);
  }
 FocusNode messageFocusNode = FocusNode();
void updatetryeDataInFirestore() async {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
print(("hited"));
  // Replace 'users' with your collection name and 'documentId' with the specific document ID
  DocumentReference docRef =  firestore
          .collection("RoomId's")
          .doc(ViewRequestDetailsControllerinstance.ViewProfileDetail.value.data!.roomId.toString())
.collection("typestatus").doc("userstypingstatus");

   Map<String, dynamic> typestatus = {
        "id": ViewSikerProfileDetailsControllerinstance.ViewProfileDetail.value.profileDetails![0].id.toString(),
        "status":true,
        
      };

  await docRef.update(typestatus);
}

void updatefalseDataInFirestore() async {
   FirebaseFirestore firestore = FirebaseFirestore.instance;
print(("hited"));
  // Replace 'users' with your collection name and 'documentId' with the specific document ID
  DocumentReference docRef =  firestore
          .collection("RoomId's")
          .doc(ViewRequestDetailsControllerinstance.ViewProfileDetail.value.data!.roomId.toString())
.collection("typestatus").doc("userstypingstatus");

   Map<String, dynamic> typestatus = {
        "id": ViewSikerProfileDetailsControllerinstance.ViewProfileDetail.value.profileDetails![0].id.toString(),
        "status":false,
        
      };

  await docRef.update(typestatus);
}
    void _onFocusChange() {
    if (messageFocusNode.hasFocus) {
      updatetryeDataInFirestore();
      print("TextField is active: true");
    } else {
      updatefalseDataInFirestore();
      print("TextField is active: false");
    }
  }

 void typeingstatusofuser()async{
    print("hited");
     Map<String, dynamic> typestatus = {
        "id": ViewSikerProfileDetailsControllerinstance.ViewProfileDetail.value.profileDetails![0].id.toString(),
        "status":false,
        
      };

      await _firestore
          .collection("RoomId's")
          .doc(ViewRequestDetailsControllerinstance.ViewProfileDetail.value.data!.roomId.toString())
.collection("typestatus").doc("userstypingstatus").set(typestatus);
}

@override
  void initState() {
   
      messageFocusNode.addListener(_onFocusChange);
     
                ViewSikerProfileDetailsControllernstance.ViewSikerProfileDetailsApiHit();
ViewRequestDetailsControllerinstance.ViewRequestDetailsApiHit();

    // TODO: implement initState
    super.initState();
  }
  final ViewSikerProfileDetailsControllerinstance=Get.put(ViewSikerProfileDetailsController
());
 final ScrollController _scrollController = ScrollController();

void onSendMessage() async {
  print(messagecontroller.text);
    if (messagecontroller.text.isNotEmpty) {
      Map<String, dynamic> messages = {
        "sentby": ViewSikerProfileDetailsControllerinstance.ViewProfileDetail.value.profileDetails![0].id.toString(),
        "message": messagecontroller.text,
        "type": "text",
        "time": FieldValue.serverTimestamp(),
      };

      messagecontroller.clear();
      await _firestore
          .collection("RoomId's")
          .doc(ViewRequestDetailsControllerinstance.ViewProfileDetail.value.data!.roomId.toString())
.collection("massages").add(messages);
      print("Enter Some Text");
    }
  }




/////////////////////////////


  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(

      
      child: Scaffold(
resizeToAvoidBottomInset: true,
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

        body: Container(
        
          child: Column(
            children: [
             
              // SizedBox(height: height*.03),
        
             AcceptRequestwidget(),
        
              SizedBox(height: Get.height*0.02,),
              FutureBuilder<dynamic>(
  future: ViewRequestDetailsControllerinstance.ViewRequestDetailsApiHit(), // The Future you want to monitor
  builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
    switch (snapshot.connectionState) {
      case ConnectionState.none:
        return Text('Press button to start.');
      case ConnectionState.active:
      case ConnectionState.waiting:
        return Text("");
      case ConnectionState.done:
        if (snapshot.hasError)
          return Text('Error: ${snapshot.error}');
  
  
  return

       
    


          Obx(() {
          switch (ViewRequestDetailsControllerinstance.rxRequestStatus.value) {
            case Status.LOADING:
              return const Center(child: Text(""));
            case Status.ERROR:
              if (ViewRequestDetailsControllerinstance.error.value == 'No internet') {
                return InterNetExceptionWidget(
                  onPress: () {},
                );
              } else {
                return GeneralExceptionWidget(onPress: () {});
              }
            case Status.COMPLETED:
              return   
                Expanded(
        child: StreamBuilder<QuerySnapshot>(
          stream: _firestore
            .collection("RoomId's")
            .doc(ViewRequestDetailsControllerinstance.ViewProfileDetail.value.data!.roomId.toString())
            .collection('massages')
            .orderBy("time", descending: true) // Reverse order here
            .snapshots(),
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: Text(""));
            }

            if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
              return Center(
                child: Text("No messages yet."),
              );
            }

            return ListView.builder(
  reverse: true,
  itemCount: snapshot.data!.docs.length,
  itemBuilder: (context, index) {
    final message = snapshot.data!.docs[index]['message'].toString();
    final timestamp = snapshot.data!.docs[index]['time'] as Timestamp? ; // Assuming 'time' is the timestamp field
    final isSentByCurrentUser = snapshot.data!.docs[index]['sentby'].toString() ==
        ViewSikerProfileDetailsControllerinstance.ViewProfileDetail.value.profileDetails![0].id.toString();

    return Align(
      alignment: isSentByCurrentUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: EdgeInsets.all(8.0),
          decoration: BoxDecoration(

            color: isSentByCurrentUser ? Color(0xffFFCCCB) : Color(0xffcce7e8),
            borderRadius:isSentByCurrentUser? BorderRadius.only(
              topLeft: Radius.circular(8),
              topRight: Radius.circular(8),
              bottomLeft: Radius.circular(8),
            ):BorderRadius.only(
              topRight: Radius.circular(8),
              bottomRight: Radius.circular(8),
              bottomLeft: Radius.circular(8),
            ),
          ),
          child: Column(
            crossAxisAlignment: isSentByCurrentUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
            children: [
              Text(
            breakMessage(message),
                style: TextStyle(color: Colors.black),
              ),
              SizedBox(height: 4), // Adjust the spacing as needed
             if (timestamp != null)  Text(
                formatTimestamp(timestamp), // Format timestamp as needed
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
            ],
          ),
        ),
      ),
    );
  },
);

          },
        ),
        );}});}}) ,

            Obx(() {
          switch (ViewRequestDetailsControllerinstance.rxRequestStatus.value) {
            case Status.LOADING:
              return const Center(child: Text(""));
            case Status.ERROR:
              if (ViewRequestDetailsControllerinstance.error.value == 'No internet') {
                return InterNetExceptionWidget(
                  onPress: () {},
                );
              } else {
                return GeneralExceptionWidget(onPress: () {});
              }
            case Status.COMPLETED:
              return   StreamBuilder<DocumentSnapshot>(
  stream: _firestore
      .collection("RoomId's")
      .doc(ViewRequestDetailsControllerinstance.ViewProfileDetail.value.data!.roomId.toString())
      .collection('typestatus')
      .doc("userstypingstatus") // Replace with the actual document ID
      .snapshots(),
  builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return Center(child: Text(""));
    }

    if (!snapshot.hasData || !snapshot.data!.exists) {
      return Center(
        child: Text("No status data yet."),
      );
    }

    Map<String, dynamic> statusData = snapshot.data!.data() as Map<String, dynamic>;
    String status = statusData['status'].toString(); // Assuming 'status' is the field name
    String id = statusData['id'].toString(); // Assuming 'status' is the field name

    return id!= ViewSikerProfileDetailsControllerinstance.ViewProfileDetail.value.profileDetails![0].id.toString()&& status=="true"?Align(

      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: EdgeInsets.all(8.0),
          decoration: BoxDecoration(

            color:  Color(0xffcce7e8),
            borderRadius:BorderRadius.only(
              topRight: Radius.circular(8),
              bottomRight: Radius.circular(8),
              bottomLeft: Radius.circular(8),
            ),
          ),
          child: Row(
            children: [
              Text("typing...",style: TextStyle(color: Colors.black),),
            ],
          )
          ),
        ),
      ):Container();
    
  },
            );}}),

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
        
              Container(width:Get.width,child:  Padding(
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
                            focusNode: messageFocusNode,
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
                        InkWell(
                          child: Icon(
                            Icons.send_rounded,
                            size: 35,
                            color: Color(0xffFE0091),
                          ),
                          onTap: (){
                            print("sent");
// typeingstatusofuser(); if()
if(ViewRequestDetailsControllerinstance.ViewProfileDetail.value.data!.roomId!=null){

                            onSendMessage();
}
                          },
                        )
                      ],
                    ),
      ),),
               
            ],
          ),
        ),
     
    ));
  }

  String breakMessage(String message) {
  List<String> words = message.split(' ');
  List<String> lines = [];
  for (int i = 0; i < words.length; i += 9) {
    lines.add(words.skip(i).take(9).join(' '));
  }
  return lines.join('\n');
}



}
