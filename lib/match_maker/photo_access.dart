import 'dart:io';
import 'package:cupid_match/GlobalVariable/GlobalVariable.dart';
import 'package:cupid_match/controllers/controller/additionalinfoController/AdditonalInfoController.dart';
import 'package:cupid_match/match_maker/payment_screen.dart';
import 'package:cupid_match/widgets/my_button.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class GalleryAccess extends StatefulWidget {
  const GalleryAccess({super.key});

  @override
  State<GalleryAccess> createState() => _GalleryAccessState();
}

class _GalleryAccessState extends State<GalleryAccess> {
  final AdditonalInfpMakerControllerinstance=Get.put(AdditonalInfpMakerController());


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
  File? galleryFile;
  final picker = ImagePicker();


@override
  void initState() {
    // TODO: implement initState

    setState(() {
      imgFile=null;
    });
    super.initState();
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
             
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: height * .4,
                width: width,
                child: imgFile == null
                    ?  Center(child: Container(height: Get.height*0.4,width: Get.width,decoration: BoxDecoration(image:DecorationImage(image: AssetImage("assets/images/Upload.png"))),),)
                    : Center(child: Image.file(imgFile!)),
              ),
              SizedBox(
                height: height * 0.04,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                    if(imgFile==null)  MyButton(
                          width: width * 0.4, title: "Select", onTap: () {
                            setState(() {
                            // imgFile=null;
                               showOptionsDialog(context);
                            });
                          }),
                        if(imgFile!=null) MyButton(
                          width: width * 0.4, title: "Replace", onTap: () {
                            setState(() {
                            imgFile=null;
                               showOptionsDialog(context);
                            });
                          }),
                    ],
                  ),
                  Column(children: [
                  Obx(() =>  OutlinedButton(
                      style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          side: BorderSide(color: Color(0xff000CAA), width: 2),
                          fixedSize: Size(150, 60)),
                      onPressed: () {
AdditonalInfpMakerControllerinstance.MakerAditonalApiHit();
                    // Get.to(PaymentScreen());
                      },
                      child: AdditonalInfpMakerControllerinstance.loading.value==true?LoadingAnimationWidget.inkDrop(
          color: Colors.pink,
          size: 30,
        ):
                      
                      Text(



                        "Continue",

                        style: Theme.of(context)
                            .textTheme
                            .titleLarge
                            ?.copyWith(color: Color(0xff000CAA)),
                      ),
                    ),) 

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
