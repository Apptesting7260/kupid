import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  var size, height, width;
  var clo = 0;
  var h1 = 0;
  var h2 = 0;
  var h3 = 0;
  var re = "0";
  bool bt = false;
  var Textcr = new TextEditingController();
  var me = "I think you guys are cute together";
  void _showImagePicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          child: Wrap(
            children: [
              ListTile(
                leading: Icon(Icons.camera_alt),
                title: Text('Take a Photo'),
                onTap: () {
                  _pickImage(ImageSource.camera);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.photo_library),
                title: Text('Choose from Gallery'),
                onTap: () {
                  _pickImage(ImageSource.gallery);
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  File? _selectedImage;
  Future<void> _pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedImage = await picker.getImage(source: source);

    if (pickedImage != null) {
      setState(() {
        _selectedImage = File(pickedImage.path);
      });
    }
  }

  void clearText() {
    Textcr.clear();
  }

  List<Map<String, dynamic>> kk = [
    {
      'system_69': 'md',
    },
  ];

  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
        statusBarColor: Colors.white));
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      // appBar: AppBar(
      //   automaticallyImplyLeading: false,
      //   // primary: false,
      //   //   title
      //   backgroundColor: Color(0xffF3F3F3),
      //   elevation: 0,
      //   centerTitle: true,
      //   title: Padding(
      //     padding: EdgeInsets.symmetric(
      //       vertical: width / 10,
      //     ),
      //     child: Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //       children: [
      //         Icon(
      //           Icons.arrow_back_ios_new_sharp,
      //           color: Color(0xff101623),
      //           size: 20,
      //         ),
      //         GestureDetector(
      //             onTap: () {
      //
      //             },
      //             child: Image.asset("assets/images/Rectangle 103.png")),
      //         SizedBox(
      //           width: width / 40,
      //         ),
      //         Column(
      //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //           children: [
      //             RichText(
      //               text: const TextSpan(
      //                 text: 'Hello',
      //                 style: TextStyle(
      //                     color: Color(0xff000000),
      //                     fontSize: 14,
      //                     fontWeight: FontWeight.w600
      //
      //                   // fontFamily: 'Your App Font Family',
      //                 ),
      //                 children: [
      //                   WidgetSpan(child: SizedBox(height: 10)),
      //                   TextSpan(
      //                     text: '\n Hey! How’s it going?',
      //                     style: TextStyle(
      //                         fontWeight: FontWeight.w300,
      //                         fontSize: 14,
      //                         color: Color(0xff777777)),
      //                   ),
      //                 ],
      //               ),
      //             )
      //           ],
      //         ),
      //         Padding(
      //           padding: EdgeInsets.only(
      //               left: MediaQuery.of(context).size.width / 5),
      //         ),
      //
      //         // Icon(Icons.more_vert),
      //         PopupMenuButton(
      //             icon: Icon(
      //               Icons.more_vert,
      //               color: Colors.black,
      //               size: 30,
      //             ),
      //             color: Colors.white,
      //             shape: OutlineInputBorder(
      //                 borderRadius: BorderRadius.only(
      //                   topLeft: Radius.circular(20),
      //                   topRight: Radius.circular(0),
      //                   bottomLeft: Radius.circular(20),
      //                   bottomRight: Radius.circular(20),
      //                 ),
      //                 borderSide: BorderSide(width: 1, color: Colors.white)),
      //             itemBuilder: (context) => [
      //               PopupMenuItem(
      //                 child: Text('unmatch'),
      //               ),
      //               PopupMenuItem(child: Text('report')),
      //             ])
      //       ],
      //     ),
      //   ),
      // ),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
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

              SizedBox(height: height / 35),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: width / 30,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: width / 25,
                    ), //after removing const
                    child: CircleAvatar(
                      radius: 30.0,
                      backgroundImage: NetworkImage(
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR2av8pAdOHJdgpwkYC5go5OE07n8-tZzTgwg&usqp=CAU"),
                      backgroundColor: Colors.transparent,
                    ),
                  ),
                  SizedBox(
                    width: width / 40,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: width * 0, vertical: height * 0.023),
                    height: height / 10,
                    width: width / 2.3,
                    decoration: BoxDecoration(
                        color: Color(0xff000CAA).withOpacity(0.05),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(0),
                          topRight: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        )),
                    child: Column(
                      children: [
                        SizedBox(
                          height: height / 45,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width / 25),
                          child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "Valentina",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge
                                    ?.copyWith(
                                        color: Color(0xff000000),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600),
                              )),
                        ),
                        SizedBox(
                          height: height / 80,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width / 25),
                          child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "Hey! how's it going",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge
                                    ?.copyWith(
                                        color: Color(0xff323643),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w300),
                              )),
                        )
                      ],
                    ),
                  )
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: width / 30,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: width / 80),
                    child: CircleAvatar(
                      radius: 30.0,
                      backgroundImage: NetworkImage(
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR2av8pAdOHJdgpwkYC5go5OE07n8-tZzTgwg&usqp=CAU"),
                      backgroundColor: Colors.transparent,
                    ),
                  ),
                  SizedBox(
                    width: width / 40,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: width * 0, vertical: height * 0.010),
                    height: height / 10,
                    width: width / 2.3,
                    decoration: BoxDecoration(
                        color: Color(0xffF5F5F5),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(0),
                          topRight: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        )),
                    child: Column(
                      children: [
                        SizedBox(
                          height: height / 50,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width / 25),
                          child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "John Duo",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge
                                    ?.copyWith(
                                        color: Color(0xff000000),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600),
                              )),
                        ),
                        SizedBox(
                          height: height / 80,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width / 25),
                          child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "Hey! How’s it going?",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge
                                    ?.copyWith(
                                        color: Color(0xff323643),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w300),
                              )),
                        )
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: height / 4.4,
              ),
              Padding(
                padding: EdgeInsets.only(
                    right: MediaQuery.of(context).size.width / 30),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    height: height / 10,
                    width: width / 1.7,
                    decoration: BoxDecoration(
                        color: Color(0xffFE0091).withOpacity(0.05),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(0),
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        )),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                            child: Text(
                          "$me",
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(
                                  color: Color(0xff777777),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w300),
                        )),
                        SizedBox(
                          height: 7,
                        ),
                        Container(
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                                "                                              "
                                "              5:00 PM",
                                style: TextStyle(
                                  fontSize: 8,
                                  fontWeight: FontWeight.w300,
                                  color: Color(0xff7777777),
                                  fontFamily: GoogleFonts.inter().fontFamily,
                                )),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),

              SizedBox(
                height: height / 35,
              ),
              Container(
                height: height / 19,
                width: width / 1.9,
                child: Center(
                  child: Text(
                    "Remove Matchmaker",
                    style: TextStyle(
                      color: Color(0xffFE0091),
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      fontFamily: GoogleFonts.inter().fontFamily,
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                    // color: Colors.grey,
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(color: Color(0xffFE0091))),
              ),
              SizedBox(
                height: height / 38,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {
                      h1 = 1;
                      setState(() {});
                    },
                    child: Container(
                      height: height / 26,
                      width: width / 6,
                      // color: Colors.grey,
                      child: Center(
                          child: Text("hello!",
                              style: TextStyle(
                                color: Color(0xff777777),
                                fontSize: 12,
                                fontWeight: FontWeight.w300,
                                fontFamily: GoogleFonts.inter().fontFamily,
                              ))),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Color(0xff777777))),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      h1 = 2;
                      setState(() {});
                    },
                    child: Container(
                      height: height / 26,
                      width: width / 3.7,
                      // color: Colors.grey,
                      child: Center(
                          child: Text("How are you?",
                              style: TextStyle(
                                color: Color(0xff777777),
                                fontSize: 12,
                                fontWeight: FontWeight.w300,
                                fontFamily: GoogleFonts.inter().fontFamily,
                              ))),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Color(0xff777777))),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      h1 = 3;
                      setState(() {});
                    },
                    child: Container(
                      height: height / 26,
                      width: width / 2.7,
                      // color: Colors.grey,
                      child: Center(
                          child: Text("What are you doing?",
                              style: TextStyle(
                                color: Color(0xff777777),
                                fontSize: 12,
                                fontWeight: FontWeight.w300,
                                fontFamily: GoogleFonts.inter().fontFamily,
                              ))),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Color(0xff777777))),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: height / 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      height: 44,
                      width: 18,
                      child: Column(
                        children: [
                          // Container(
                          //   child: Wrap(
                          //     children: [
                          //       ListTile(
                          //         leading: Icon(Icons.camera_alt),
                          //         title: Text('Take a Photo'),
                          //         onTap: () {
                          //           _pickImage(ImageSource.camera);
                          //           Navigator.pop(context);
                          //         },
                          //       ),
                          //       ListTile(
                          //         leading: Icon(Icons.photo_library),
                          //         title: Text('Choose from Gallery'),
                          //         onTap: () {
                          //           _pickImage(ImageSource.gallery);
                          //
                          //         },
                          //       ),
                          //     ],
                          //   ),
                          // )
                          if (_selectedImage != null)
                            Image.file(
                              _selectedImage!,
                              width: 200,
                              height: 200,
                            ),
                          // Padding(
                          //   padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                          //   child: ElevatedButton.icon(
                          //     onPressed: () => _showImagePicker(context),
                          //     icon: Icon(Icons.camera_alt,size: 10,),
                          //     label: Text(''),
                          //   ),
                          // ),

                          InkWell(
                              onTap: () {
                                return _showImagePicker(context);
                              },
                              child: Container(
                                  child: Icon(
                                Icons.camera_alt,
                                size: 40,
                              )))
                        ],
                      )),
                  SizedBox(
                    width: width / 50,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width / 65),
                    child: Container(
                      height: height / 16,
                      width: width / 1.4,
                      child: TextField(
                        controller: Textcr,
                        decoration: InputDecoration(
                            // label: Text("Type a Message"),
                            hintText: "Type a message",
                            filled: true,
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide:
                                    BorderSide(color: Color(0xffF0F0F0))),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide:
                                    BorderSide(color: Color(0xffF0F0F0))),
                            fillColor: Color(0xffF0F0F0)),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      me = Textcr.text;
                      bt = !bt;
                      print("hii");
                      clearText();

                      setState(() {});
                    },
                    child: Container(
                        height: 44,
                        width: 18,
                        child: Icon(
                          Icons.send,
                          color: Color(0xffFE0091),
                        )),
                  )
                ],
              ),
              // SizedBox(height: 20,)
            ],
          ),
        ),
      ),
    );
  }
}
