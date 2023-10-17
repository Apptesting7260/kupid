import 'package:cupid_match/GlobalVariable/GlobalVariable.dart';
import 'package:cupid_match/match_seeker/profile/interested_in.dart';
import 'package:cupid_match/widgets/my_button.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image/image.dart' as imgLib;
import 'dart:io';

import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
import 'dart:io';

int emptgrid=9;

class PhotosScreen extends StatefulWidget {
  const PhotosScreen({Key? key}) : super(key: key);

  @override
  State<PhotosScreen> createState() => _PhotosScreenState();
}
List<dynamic> galarylength=["","2","3","4","5","6","7","8","9"];
class _PhotosScreenState extends State<PhotosScreen> {

  final ImagePicker imgPicker = ImagePicker();


  // File? imgFile;
  // File? compressedFile;
  // Future<void> openCamera(ImageSource source) async {
  //   var imgCamera = await imgPicker.pickImage(source: source);
  //
  //   if (imgCamera != null) {
  //     setState(() {
  //       imgFile = File(imgCamera.path);
  //     });
  //
  //     // Run compression in a background isolate
  //     await compressImageInBackground(imgFile!);
  //   }
  // }
  // Future<void> compressImageInBackground(File imageFile) async {
  //   final compressedFile = await compute(compressImage, imageFile);
  //   setState(() {
  //     this.compressedFile = compressedFile;
  //
  //     ImagetoUpload=compressedFile;
  //     print("${ImagetoUpload!.path}==========================");
  //   });
  // }
  // static File compressImage(File imageFile) {
  //   var image = imgLib.decodeImage(imageFile.readAsBytesSync())!;
  //   var compressedImage = imgLib.encodeJpg(image, quality: 50);
  //   File compressedFile = File(imageFile.path.replaceAll('.jpg', '_compressed.jpg'))
  //     ..writeAsBytesSync(compressedImage);
  //   print("Original image size: ${imageFile.lengthSync()} bytes");
  //   print("Compressed image size: ${compressedFile.lengthSync()} bytes");
  //   // print("Compressed image path: ${compressedFile.path}");
  //
  //   return compressedFile;
  // }
  //
  @override
  void initState() {
    // TODO: implement initState
    setState(() {
      galarylength==[];
             selectedImagesFiles.clear();
    });

    super.initState();
  }

  File imgFile = File("");

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
                  child: Icon(Icons.camera_alt_outlined,color: Colors.pink,),
                  onTap: () {
                    openCamera();
                      Navigator.pop(context);
                  },
                ),
                GestureDetector(
                  child: Icon(Icons.photo_library,color: Colors.pink,),
                  onTap: () {
                    openCamera();
                      Navigator.pop(context);
                  },
                ),
              ],
            ),
          );
        });
  }


  void openCamera() async {
    List<Asset> selectedImages = [];

    try {
      selectedImages = await MultiImagePicker.pickImages(
        maxImages: 9-galleryImageFiles.length,
        enableCamera: true,
      );
    } on Exception catch (e) {
      print(e.toString());
    }

    if (!mounted) return;

    await convertAssetsToFiles(selectedImages);

    setState(() {
      galleryImageFiles = selectedImagesFiles;
    });

    printCompressedImagePaths();
  }

  List<File> selectedImagesFiles = [];

  Future<void> convertAssetsToFiles(List<Asset> assets) async {
    for (var asset in assets) {
      final byteData = await asset.getByteData();
      final buffer = byteData.buffer.asUint8List();

      final compressedFile = await compressImage(buffer);

      setState(() {
        selectedImagesFiles.add(compressedFile);
      });
    }
  }

  Future<File> compressImage(Uint8List uint8List) async {
    final tempDir = await getTemporaryDirectory();
    final tempFile = File('${tempDir.path}/${DateTime.now().millisecondsSinceEpoch}.jpg');

    final result = await FlutterImageCompress.compressWithList(
      uint8List,
      minHeight: 1920,
      minWidth: 1080,
      quality: 50,
      rotate: 0,
    );

    await tempFile.writeAsBytes(result);

    return tempFile;
  }

  void printCompressedImagePaths() {
    for (var file in selectedImagesFiles) {
      print(file.path);
    }
  }


  
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
             
            },
            icon: Icon(Icons.arrow_back, color: Colors.white, size: 27)),
        title: Text(
          "Photos",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            if(selectedImagesFiles.isNotEmpty) Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: selectedImagesFiles.length,
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
                          child:
                          Image.file(
                            selectedImagesFiles[index],
                            height: height,
                            width: width,
                            fit: BoxFit.cover,
                          )
                    
                        ),
                        Positioned(
                            bottom: -6,
                            right: -6,
                            child: GestureDetector(
                                onTap: () {
                                  selectedImagesFiles.removeAt(index);
                                  setState(() {
                                    selectedImagesFiles;
                                  });
                                },
                                child:Center(child: Icon(Icons.cancel,color:Colors.pink,),)
                            )
                        )
                      ]),
                    );
                  },
                ),
              ),
            ),
            SizedBox(height:Get.height*.03,),
          if(selectedImagesFiles.length<9)Container(
            
        width: width * .3,
            child: Stack(
              children: [DottedBorder(
                      borderType: BorderType.RRect,
                      radius: Radius.circular(15),
                      dashPattern: [5, 5],
                      color: Color(0xffC4C4C4),
                      // strokeWidth: 0.2,
                      child: Stack(clipBehavior: Clip.antiAlias, children: [
                        Container(
                          height: height * .25,
                          width: width * .3,
                          decoration: BoxDecoration(
                            color: Color(0xffC4C4C4),
                            borderRadius: BorderRadius.circular(15),
                            // image: DecorationImage(image: imgFile.path.isNotEmpty
                            //     ?Image.file(imgFile,height: height,width: width,fit: BoxFit.cover,) : AssetImage("assets/images/photos/gellery.png")),
                          ),
                          child:
                              Image.asset("assets/maker/gellery.png"),
                        ),
                        
                      ]),
                    ),
                    Positioned(
                          bottom: 0,
                          right: 0,
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
          ),
            SizedBox(
              height: height * .06,
            ),
           if(selectedImagesFiles.length==9) Center(
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
