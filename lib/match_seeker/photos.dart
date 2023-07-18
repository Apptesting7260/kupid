import 'package:cupid_match/match_seeker/profile/interested_in.dart';
import 'package:cupid_match/widgets/my_button.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:convert';
import 'dart:io';

class PhotosScreen extends StatefulWidget {
  const PhotosScreen({Key? key}) : super(key: key);

  @override
  State<PhotosScreen> createState() => _PhotosScreenState();
}

class _PhotosScreenState extends State<PhotosScreen> {
  File imgFile = File("");
  final imgPicker = ImagePicker();
  Future<void> showOptionsDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              "Choose",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            //Image Picker
            content: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  child: Text(
                    "Camera",
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall
                        ?.copyWith(fontSize: 13),
                  ),
                  onTap: () {
                    openCamera(ImageSource.camera);
                  },
                ),
                GestureDetector(
                  child: Text(
                    "Gallery",
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall
                        ?.copyWith(fontSize: 13),
                  ),
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
    });
    Navigator.of(context).pop();
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
            icon: Icon(Icons.arrow_back, color: Color(0xff5A5A5A), size: 27)),
        title: Text(
          "Photos",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: width * .04, vertical: height * .04),
        child: ListView(
          children: [
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 9,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 25,
                  mainAxisSpacing: 25,
                  childAspectRatio: 1,
                  mainAxisExtent: 150),
              itemBuilder: (context, index) {
                return DottedBorder(
                  borderType: BorderType.RRect,
                  radius: Radius.circular(15),
                  dashPattern: [5, 5],
                  color: Color(0xffC4C4C4),
                  strokeWidth: 1,
                  child: Stack(clipBehavior: Clip.none, children: [
                    Container(
                      height: height * .5,
                      width: width * .3,
                      decoration: BoxDecoration(
                        color: Color(0xffC4C4C4),
                        borderRadius: BorderRadius.circular(15),
                        // image: DecorationImage(image: imgFile.path.isNotEmpty
                        //     ?Image.file(imgFile,height: height,width: width,fit: BoxFit.cover,) : AssetImage("assets/images/photos/gellery.png")),
                      ),
                      child: imgFile.path.isNotEmpty
                          ? Image.file(
                              imgFile,
                              height: height,
                              width: width,
                              fit: BoxFit.cover,
                            )
                          : Image.asset("assets/maker/gellery.png"),
                    ),
                    Positioned(
                        bottom: -6,
                        right: -6,
                        child: GestureDetector(
                            onTap: () {
                              showOptionsDialog(context);
                            },
                            child: Image(
                              image: AssetImage(
                                  "assets/maker/Group 197.png"),
                              height: height * .03,
                            )))
                  ]),
                );
              },
            ),
            SizedBox(
              height: height * .06,
            ),
            Center(
                child: Text(
              "You can only upload 9 Photos!",
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Color(0xff777777), fontWeight: FontWeight.w400),
            )),
            SizedBox(
              height: height * .05,
            ),
            Center(
              child: MyButton(
                width: width * .8,
                title: "Next",
                onTap: () {
                  Get.to(()=>InterstedIn());
                },
              ),
            ),
            SizedBox(
              height: height * .1,
            ),
          ],
        ),
      ),
    );
  }
}