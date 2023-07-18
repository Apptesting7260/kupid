import 'dart:io';
import 'package:cupid_match/match_maker/payment_screen.dart';
import 'package:cupid_match/widgets/my_button.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GalleryAccess extends StatefulWidget {
  const GalleryAccess({super.key});

  @override
  State<GalleryAccess> createState() => _GalleryAccessState();
}

class _GalleryAccessState extends State<GalleryAccess> {
  File? galleryFile;
  final picker = ImagePicker();
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
            icon: Icon(
              Icons.arrow_back,
              color: Color(0xff5A5A5A),
              size: 27,
            )),
        title: Text(
          "Photo ID",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        centerTitle: true,
      ),
      body: Builder(
        builder: (BuildContext context) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: height * 0.04,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                child: Text(
                  "Photo ID",
                  style: Theme.of(context).textTheme.displayLarge,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: width * 0.04, vertical: height * 0.01),
                child: Text(
                  "Please point the camera at the Id card",
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(color: Color(0xff777777)),
                ),
              ),
              SizedBox(
                height: height * 0.04,
              ),
              Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(22))),
                  child: Text(
                    'Select Image',
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  onPressed: () {
                    _showPicker(context: context);
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: height * .4,
                width: width,
                child: galleryFile == null
                    ? const Center(child: Text('Sorry nothing selected!!'))
                    : Center(child: Image.file(galleryFile!)),
              ),
              SizedBox(
                height: height * 0.04,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      MyButton(
                          width: width * 0.4, title: "Try Again", onTap: () {})
                    ],
                  ),
                  Column(children: [
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          side: BorderSide(color: Color(0xff000CAA), width: 2),
                          fixedSize: Size(150, 60)),
                      onPressed: () {
                        Get.to(() => PaymentScreen());
                      },
                      child: Text(



                        "Continue",

                        style: Theme.of(context)
                            .textTheme
                            .titleLarge
                            ?.copyWith(color: Color(0xff000CAA)),
                      ),
                    ),

                    // OutlinedButton(onPressed: (){
                    //   Get.to(PaymentScreen());
                    // },
                    //     style: OutlinedButton.styleFrom(
                    //       fixedSize: Size(140, 60),
                    //       shape: RoundedRectangleBorder(
                    //         side: BorderSide(color: Color(0xff000CAA)),
                    //         borderRadius: BorderRadius.circular(30),
                    //       ),
                    //     ),
                    //     child: Text("Continue",style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Color(0xff000CAA)),))

                    // MyButton(
                    //   width: width * 0.4,
                    //     title: "Continue",
                    //     onTap: (){
                    //     Get.to(PaymentScreen());
                    //     }),
                  ]),
                ],
              ),
            ],
          );
        },
      ),
    );
  }

  Future _showPicker({
    required BuildContext context,
  }) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Options"),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  ListTile(
                    leading: const Icon(Icons.photo_library),
                    title: const Text('Photo Library'),
                    onTap: () {
                      getImage(ImageSource.gallery);
                      Get.back();
                      // Navigator.of(context).pop();
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.photo_camera),
                    title: const Text('Camera'),
                    onTap: () {
                      getImage(ImageSource.camera);
                      Get.back();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  Future getImage(
    ImageSource img,
  ) async {
    final pickedFile = await picker.pickImage(source: img);
    XFile? xfilePick = pickedFile;
    setState(
      () {
        if (xfilePick != null) {
          galleryFile = File(pickedFile!.path);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(// is this context <<<
              const SnackBar(content: Text('Nothing is selected')));
        }
      },
    );
  }
}
