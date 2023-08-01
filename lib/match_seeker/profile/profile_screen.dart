import 'dart:io';

import 'package:cupid_match/GlobalVariable/GlobalVariable.dart';
import 'package:cupid_match/match_seeker/photos.dart';
import 'package:cupid_match/utils/app_colors.dart';
import 'package:cupid_match/widgets/my_button.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../../match_maker/addbio_maker.dart';

File ?videoFile ;
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  DateTime date = DateTime.now();

  Future<File?> pickVideo() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.video,
      allowMultiple: false,
    );

    if (result != null) {
      videoFile = File(result.files.single.path!);
      setState(() {
        videoFile;
      });
      print(videoFile);
      return videoFile;
    } else {
      // User canceled the file picker
      return null;
    }
  }

   final imgPicker = ImagePicker();
  Future<void> showOptionsDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Choose",style: Theme.of(context).textTheme.titleLarge,),
            //Image Picker
            content: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  child: Text("Camera",style: Theme.of(context).textTheme.titleSmall?.copyWith(fontSize: 13),),
                  onTap: () {
                    openCamera(ImageSource.camera);
                  },
                ),
                GestureDetector(
                  child: Text("Gallery",style: Theme.of(context).textTheme.titleSmall?.copyWith(fontSize: 13),),
                  onTap: () {
                    openCamera(ImageSource.gallery);
                  },
                ),
              ],
            ),
          );
        });
  }

  void openCamera(abc) async {
    var imgCamera = await imgPicker.pickImage(source: abc);
    setState(() {
      imgFile = File(imgCamera!.path);

      print(imgFile
      );
    });
    Navigator.of(context).pop();
  }


  TextEditingController namecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController mobilecontroller = TextEditingController();
  TextEditingController addresscontroller = TextEditingController();
  TextEditingController questioncontroller = TextEditingController();
  var items1 = [
    'Electrician',
    'Engineer',
    'Doctor',
    'Advocate',
  ];
  String dropdownvalue = 'Electrician';
  File? pickedImage;
  String? selectGender;

  var choose = 1;

  var genderItems = ["Men", "Woman", "Other"];


  String? selectReligion;
  var religionItems = [
    "Hindus",
    "Muslims",
    "Sikhs"
  ];

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      // drawer: MyDrawer(),
      appBar: AppBar(
        // leading: Icon(
        //   Icons.menu,
        //   size: 25,
        //   color: Colors.black,
        // ),
        title: Text(
          "Profile Details",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView(
          children: [
            Stack(
              children: <Widget>[
                // Center(
                //   child: SizedBox(
                //     height: height * .4,
                //     width: width * .3,
                //     child: CircleAvatar(
                //       radius: 30.0,
                //        backgroundImage: NetworkImage(
                //           "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR2av8pAdOHJdgpwkYC5go5OE07n8-tZzTgwg&usqp=CAU"),
                //       backgroundColor: Colors.transparent,
                //     ),
                //   ),
                // ),
                //
                // Positioned(
                //     top: 50,
                //     left: 55,
                //     right: 0,
                //     child: GestureDetector(
                //         onTap: () {
                //           showOptionsDialog(context);
                //         },
                //         child: Image.asset("assets/icons/cameraa.png")))

                Center(
                  child: SizedBox(
                    height: height*.14,
                    width: width*.30,
                    child: Stack(
                      clipBehavior: Clip.none,
                      fit: StackFit.expand,
                      children: [
                        CircleAvatar(
                          child: ClipOval(
                              child: imgFile==null
                                  ?  Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR2av8pAdOHJdgpwkYC5go5OE07n8-tZzTgwg&usqp=CAU',height: 200,width: 200,fit:BoxFit.cover,)
                                  :Image.file(imgFile!,height: height,width: width,fit:BoxFit.cover,)

                          ),
                        ),
                        Positioned(
                            top: 60,
                            left: 65,
                            right: 0,
                            child: GestureDetector(
                                onTap: () {
                                  showOptionsDialog(context);
                                },
                                child: Image.asset("assets/icons/cameraa.png")))
                        // Positioned(
                        //   bottom: 0,
                        //   right: -8,
                        //   child:
                        //   Container(
                        //     height: height*0.06,
                        //     width: width*.12,
                        //     decoration: BoxDecoration(
                        //         border: Border.all(
                        //             color: AppColors.white),
                        //         borderRadius: BorderRadius.circular(50),
                        //         color: Color(0xff777777)
                        //     ),
                        //     child: IconButton(
                        //       onPressed: (){
                        //         showOptionsDialog(context);
                        //       },
                        //       icon: Icon(
                        //         Icons.camera_alt,
                        //         color: Colors.white,
                        //       ),
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: height*.05,),
            Center(
              child: Container(
                height: height * .075,
                width: width * .7,
                decoration: BoxDecoration(
                    color: Color(0xffF3F3F3),
                    borderRadius: BorderRadius.circular(35)),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    videoFile == null ?  Text(
                        "Upload Vedio",
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: Colors.grey),
                      ) : Row(
                        children: [
                          Text(
                            "Video Uploaded",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(color: Colors.grey),
                            ),
                          Icon(Icons.check_circle,size: 15,color:Colors.green,)
                        ],
                      ),
                    videoFile == null ?  InkWell(
                        child: Container(
                          height: height * .1,
                          width: width * .1,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey.shade300,
                          ),
                          child: Image.asset("assets/icons/vedio.png"),
                          alignment: Alignment.center,
                        ),
                        onTap: () {
                          pickVideo();
                        },
                      ):InkWell(
                      child: Container(
                        height: height * .1,
                        width: width * .1,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey.shade300,
                        ),
                        child: Icon(Icons.cancel,color:Colors.red,),
                        alignment: Alignment.center,
                      ),
                      onTap: () {

                        setState(() {
                          videoFile=null;
                        });
                      },
                    ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: height * .04),
            Text(
              "Name",
              style: Theme.of(context).textTheme.titleSmall,
            ),
            SizedBox(height: height * .01),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              controller: namecontroller,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Enter your name';
                }
                return null;
              },
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(35.0)),
                      borderSide: BorderSide(color: Color(0xffBABABA))),
                  hintStyle: TextStyle(fontSize: 16, color: Color(0xffBABABA)),
                  contentPadding: EdgeInsets.all(18),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(35.0)),
                      borderSide: BorderSide(color: Color(0xffBABABA))),
                  errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(35.0)),
                      borderSide: BorderSide(color: Color(0xffBABABA))),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(35.0)),
                    borderSide: BorderSide(color: Color(0xffBABABA)),
                  ),
                  hintText: "Enter name",
                  filled: true,
                  fillColor: Colors.white),
            ),
            SizedBox(height: height * .03),
            Text(
              "Phone Number",
              style: Theme.of(context).textTheme.titleSmall,
            ),
            SizedBox(height: height * .01),
            TextFormField(
              keyboardType: TextInputType.number,
              controller: mobilecontroller,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Please Enter Phone Number";
                } else {
                  return null;
                }
              },
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(35.0)),
                      borderSide: BorderSide(color: Color(0xffBABABA))),
                  hintStyle: TextStyle(fontSize: 16, color: Color(0xffBABABA)),
                  contentPadding: EdgeInsets.all(18),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(35.0)),
                      borderSide: BorderSide(color: Color(0xffBABABA))),
                  errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(35.0)),
                      borderSide: BorderSide(color: Color(0xffBABABA))),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(35.0)),
                    borderSide: BorderSide(color: Color(0xffBABABA)),
                  ),
                  suffix: Text(
                    "verify",
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(color: Color(0xffFE0091)),
                  ),
                  hintText: "Phone Number",
                  filled: true,
                  fillColor: Colors.white),
            ),
            SizedBox(height: height * .03),
            Text(
              "Email Id",
              style: Theme.of(context).textTheme.titleSmall,
            ),
            SizedBox(height: height * .01),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              controller: emailcontroller,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Please Enter Email";
                } else {
                  return null;
                }
              },
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(35.0)),
                      borderSide: BorderSide(color: Color(0xffBABABA))),
                  hintStyle: TextStyle(fontSize: 16, color: Color(0xffBABABA)),
                  contentPadding: EdgeInsets.all(18),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(35.0)),
                      borderSide: BorderSide(color: Color(0xffBABABA))),
                  errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(35.0)),
                      borderSide: BorderSide(color: Color(0xffBABABA))),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(35.0)),
                    borderSide: BorderSide(color: Color(0xffBABABA)),
                  ),
                  suffix: Text(
                    "verify",
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(color: Color(0xffFE0091)),
                  ),
                  hintText: "Email",
                  filled: true,
                  fillColor: Colors.white),
            ),
            SizedBox(height: height * .03),

            Text(
              "Occupation",
              style: Theme.of(context).textTheme.titleSmall,
            ),
            SizedBox(height: height * .01),
            DropdownButtonFormField(
              value: dropdownvalue,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please Enter Drop Points';
                }
              },
              hint: Text(
                "Electrician",
                style: TextStyle(fontSize: 10),
              ),
              items: items1.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items),
                );
              }).toList(),
              onChanged: (String? value) {
                setState(() {
                  dropdownvalue = value!;
                });
              },
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.fromLTRB(20, 10, 10, 22),
                filled: true,
                fillColor: Colors.white,
                border: InputBorder.none,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(35.0),
                  borderSide: BorderSide(color: Color(0xffBABABA)),
                ),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xffBABABA)),
                    borderRadius: BorderRadius.circular(35.0)),
              ),
            ),
            SizedBox(height: height * .03),
            Text(
              "Salary",
              style: Theme.of(context).textTheme.titleSmall,
            ),
            SizedBox(height: height * .01),
            TextFormField(
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Please Enter Salary";
                } else {
                  return null;
                }
              },
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(35.0)),
                      borderSide: BorderSide(color: Color(0xffBABABA))),
                  hintStyle: TextStyle(fontSize: 16, color: Color(0xffBABABA)),
                  contentPadding: EdgeInsets.all(18),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(35.0)),
                      borderSide: BorderSide(color: Color(0xffBABABA))),
                  errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(35.0)),
                      borderSide: BorderSide(color: Color(0xffBABABA))),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(35.0)),
                    borderSide: BorderSide(color: Color(0xffBABABA)),
                  ),
                  hintText: "25k monthly",
                  filled: true,
                  fillColor: Colors.white),
            ),
            SizedBox(height: height * .03),
            Text(
              "Address",
              style: Theme.of(context).textTheme.titleSmall,
            ),
            SizedBox(height: height * .01),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              // controller: addresscontroller,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Please Enter Address";
                } else {
                  return null;
                }
              },
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(35.0)),
                      borderSide: BorderSide(color: Color(0xffBABABA))),
                  hintStyle: TextStyle(fontSize: 16, color: Color(0xffBABABA)),
                  contentPadding: EdgeInsets.all(18),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(35.0)),
                      borderSide: BorderSide(color: Color(0xffBABABA))),
                  errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(35.0)),
                      borderSide: BorderSide(color: Color(0xffBABABA))),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(35.0)),
                    borderSide: BorderSide(color: Color(0xffBABABA)),
                  ),
                  hintText: "Address",
                  filled: true,
                  fillColor: Colors.white),
            ),
            SizedBox(height: height * .03),
            Text(
              "Gender",
              style: Theme.of(context).textTheme.titleSmall,
            ),
            SizedBox(height: height * .01),
            DropdownButtonFormField(
                value: selectGender,
                icon: const Icon(
                  Icons.keyboard_arrow_down,
                  color: Color(0xff000000),
                  size: 28,
                ),
                style: Theme.of(context).textTheme.bodyLarge,
                items: genderItems.map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Text(items),
                  );
                }).toList(),
                validator: (value) {
                  if (value == null) return "Select your gender";
                  return null;
                },
                onChanged: (String? newValue) {
                  setState(() {
                    selectGender = newValue!;
                  });
                },
                decoration: InputDecoration(
                  hintText: "Man",
                  contentPadding: EdgeInsets.all(20),
                  hintStyle: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(color: AppColors.subtitletextcolor),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(color: Color(0xffBABABA)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(color: Color(0xffBABABA)),
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: Color(0xffBABABA))),
                )),
            SizedBox(height: height * .03),
            Text(
              "Religion",
              style: Theme.of(context).textTheme.titleSmall,
            ),
            SizedBox(height: height * .01),
            DropdownButtonFormField(
                value: selectReligion,
                icon: const Icon(
                  Icons.keyboard_arrow_down,
                  color: Color(0xff000000),
                  size: 28,
                ),
                style: Theme.of(context).textTheme.bodyLarge,
                items: religionItems.map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Text(items),
                  );
                }).toList(),
                validator: (value) {
                  if (value == null) return "Select your gender";
                  return null;
                },
                onChanged: (String? newValue) {
                  setState(() {
                    selectReligion = newValue!;
                  });
                },
                decoration: InputDecoration(
                  hintText: "Sikh",
                  contentPadding: EdgeInsets.all(20),
                  hintStyle: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(color: AppColors.subtitletextcolor),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(color: Color(0xffBABABA)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(color: Color(0xffBABABA)),
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: Color(0xffBABABA))),
                )),
            SizedBox(height: height * .03),
            Text(
              "Height",
              style: Theme.of(context).textTheme.titleSmall,
            ),
            SizedBox(height: height * .01),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: width * .45,
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,

                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please Enter Hieght";
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(35.0)),
                            borderSide: BorderSide(color: Color(0xffBABABA))),
                        hintStyle:
                            TextStyle(fontSize: 16, color: Color(0xffBABABA)),
                        contentPadding: EdgeInsets.all(18),
                        enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(35.0)),
                            borderSide: BorderSide(color: Color(0xffBABABA))),
                        errorBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(35.0)),
                            borderSide: BorderSide(color: Color(0xffBABABA))),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(35.0)),
                          borderSide: BorderSide(color: Color(0xffBABABA)),
                        ),
                        hintText: "Feet",
                        filled: true,
                        fillColor: Colors.white),
                  ),
                ),
                Container(
                  width: width * .45,
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,

                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please Enter Height";
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(35.0)),
                            borderSide: BorderSide(color: Color(0xffBABABA))),
                        hintStyle:
                            TextStyle(fontSize: 16, color: Color(0xffBABABA)),
                        contentPadding: EdgeInsets.all(18),
                        enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(35.0)),
                            borderSide: BorderSide(color: Color(0xffBABABA))),
                        errorBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(35.0)),
                            borderSide: BorderSide(color: Color(0xffBABABA))),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(35.0)),
                          borderSide: BorderSide(color: Color(0xffBABABA)),
                        ),
                        hintText: "Inches",
                        filled: true,
                        fillColor: Colors.white),
                  ),
                ),
              ],
            ),
            SizedBox(height: height * .03),
            Container(
              height: height*.08,
              width: width,
              decoration: BoxDecoration(
                color: Color(0xffF3F3F3),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width*.05),
                    child:startdate==null? Text("Choose birthday date",style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Color(0xff000CAA),fontSize: 14,fontWeight: FontWeight.w800),):Text(DateFormat('dd-MM-yyyy').format(DateTime.parse(startdate.toString()))),
                  ),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: width*.05),
                    child: GestureDetector(
                        onTap: ()  async {
                          startdate  =
                          await showDatePicker(
                            context: context,
                            initialDate: date,
                            firstDate: DateTime(1900),
                            lastDate: DateTime(2100),
                          );
                          print(startdate);
                          datestring=DateFormat('dd-MM-yyyy').format(DateTime.parse(startdate.toString()));
                          print(datestring);

                          setState(() {
                            datestring;
                          });
                        },
                        child: Image.asset('assets/icons/Calendar.png',height: 30,)),
                  ),
                ],
              ),
            ),
            SizedBox(height: height * .03),
            Text(
              "Add Question",
              style: Theme.of(context).textTheme.titleSmall,
            ),
            SizedBox(height: height * .01),
            Container(
              width: width * .45,
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: questioncontroller,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please add question";
                  } else {
                    return null;
                  }
                },
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(35.0)),
                        borderSide: BorderSide(color: Color(0xffBABABA))),
                    hintStyle:
                        TextStyle(fontSize: 16, color: Color(0xffBABABA)),
                    contentPadding: EdgeInsets.all(18),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(35.0)),
                        borderSide: BorderSide(color: Color(0xffBABABA))),
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(35.0)),
                        borderSide: BorderSide(color: Color(0xffBABABA))),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(35.0)),
                      borderSide: BorderSide(color: Color(0xffBABABA)),
                    ),
                    hintText: "Enter your questions",
                    filled: true,
                    fillColor: Colors.white),
              ),
            ),
            SizedBox(height: height * .03),
            Text(
              "Answer",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Flexible(
                  child: TextFormField(
                    decoration: InputDecoration(
                        hintText: "Enter",
                        fillColor: Colors.white,
                        filled: true,
                        contentPadding: EdgeInsets.all(10),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(color: Color(0xffDCDCDC))),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(color: Color(0xffDCDCDC))),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(color: Color(0xffDCDCDC)))),
                    onFieldSubmitted: (value) {},
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'enter value';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(width: 10),
                Flexible(
                  child: TextFormField(
                    decoration: InputDecoration(
                        hintText: "Enter",
                        fillColor: Colors.white,
                        filled: true,
                        contentPadding: EdgeInsets.all(10),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(color: Color(0xffDCDCDC))),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(color: Color(0xffDCDCDC))),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(color: Color(0xffDCDCDC)))),
                    onFieldSubmitted: (value) {},
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'enter value';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(width: 10),
                Flexible(
                  child: TextFormField(
                    decoration: InputDecoration(
                        hintText: "Enter",
                        fillColor: Colors.white,
                        filled: true,
                        contentPadding: EdgeInsets.all(10),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(color: Color(0xffDCDCDC))),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(color: Color(0xffDCDCDC))),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(color: Color(0xffDCDCDC)))),
                    onFieldSubmitted: (value) {},
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'enter value';
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.only(right: 40, left: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 20,
                    width: 20,
                    child: ElevatedButton(
                      onPressed: () {
                        choose = 1;
                        setState(() {
                          // click = !click;
                        });
                      },
                      child: null,
                      style: ElevatedButton.styleFrom(
                          backgroundColor:
                              choose == 1 ? Color(0xffFE0091) : Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                              side: BorderSide(
                                  color: Color(0xffBABABA), width: 2))),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                    width: 20,
                    child: ElevatedButton(
                      onPressed: () {
                        choose = 2;
                        setState(() {
                          // click = !click;
                        });
                      },
                      child: null,
                      style: ElevatedButton.styleFrom(
                          backgroundColor:
                              choose == 2 ? Color(0xffFE0091) : Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                              side: BorderSide(
                                  color: Color(0xffBABABA), width: 2))),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                    width: 20,
                    child: ElevatedButton(
                      onPressed: () {
                        choose = 3;
                        setState(() {
                          // click = !click;
                        });
                      },
                      child: null,
                      style: ElevatedButton.styleFrom(
                          backgroundColor:
                              choose == 3 ? Color(0xffFE0091) : Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                              side: BorderSide(
                                  color: Color(0xffBABABA), width: 2))),
                    ),
                  ),
                ],
              ),
            ),

            // Container(
            //   height: height * .11,
            //   width: width * 1,
            //   decoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(15),
            //       border: Border.all(color: Colors.grey)),
            //   child: Padding(
            //     padding: const EdgeInsets.all(8.0),
            //     child: Column(
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       children: [
            //         Text(
            //           "How old do you think i am?",
            //           style: Theme.of(context).textTheme.subtitle1,
            //         ),
            //         SizedBox(height: height * .02),
            //         Text(
            //           "I am 20 years old.",
            //           style: Theme.of(context)
            //               .textTheme
            //               .subtitle1!
            //               .copyWith(color: Colors.grey),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            SizedBox(height: height * .03),
            Center(
                child: MyButton(
              title: 'Confirm',
              onTap: () {
                Get.to(() => PhotosScreen());
              },
            ))
          ],
        ),
      ),
    );
  }

  void imagePickerOption() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
            title: Text(
              'Choose Image',
              style: Theme.of(context).textTheme.headline6,
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  pickImage(ImageSource.camera);
                  Get.back();
                },
                child: const Text('Camera'),
              ),
              TextButton(
                onPressed: () async {
                  pickImage(ImageSource.gallery);
                  Get.back();
                },
                child: const Text('Gallery'),
              )
            ]);
      },
    );
  }

  pickImage(ImageSource imageType) async {
    try {
      final photo = await ImagePicker().pickImage(source: imageType);
      if (photo == null) return;
      final tempImage = File(photo.path);
      setState(() {
        pickedImage = tempImage;
      });

      Get.back();
    } catch (error) {
      debugPrint(error.toString());
    }
  }
}
