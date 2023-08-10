import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:country_list_pick/country_list_pick.dart';
import 'package:flutter/foundation.dart';
import 'package:geocoding/geocoding.dart';
import 'package:http/http.dart' as http;
import 'package:cupid_match/GlobalVariable/GlobalVariable.dart';
import 'package:cupid_match/match_seeker/photos.dart';
import 'package:cupid_match/utils/app_colors.dart';
import 'package:cupid_match/widgets/my_button.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:image/image.dart' as imgLib;
import '../../controllers/controller/GetAllOcupationsController/GetAllOcupations.dart';
import '../../controllers/controller/MakerProfileController/MakerProfileController.dart';
import '../../controllers/controller/SeekerProfileController/SeekerProfileController.dart';
import '../../match_maker/match_maker_profile_update.dart';
import '../../models/GoogleLocationModel/GoogleLocationModel.dart';

File ?videoFile ;
class SikerProfileDetails extends StatefulWidget {
  const SikerProfileDetails({Key? key}) : super(key: key);

  @override
  State<SikerProfileDetails> createState() => _SikerProfileDetailsState();
}

class _SikerProfileDetailsState extends State<SikerProfileDetails> {
  MakerProfileController MakerProfileControllerInstanse=Get.put(MakerProfileController());
  FocusNode _dropdownFocus1 = FocusNode();
  FocusNode _dropdownFocus2 = FocusNode();
  FocusNode _dropdownFocus3 = FocusNode();
  bool _isDropdownOpen1 = false;
  bool _isDropdownOpen2 = false;
  bool _isDropdownOpen3 = false;

  final locationcntroller=TextEditingController();

  final SeekerProfileControllerInstanse=Get.put(SeekerProfileController());
  final GetAllOcupationsControllerInstanse=Get.put(GetAllOcupationsController());
  String googleAPiKey = "AIzaSyACG0YonxAConKXfgaeVYj7RCRdXazrPYI";
  DateTime date = DateTime.now();
  List<Predictions> searchPlace = [];
  List<Location> locations = [];
  double? lat;
  double? long;
  bool isDropdownExpanded = true;
  bool selectedColor = false;


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
                  child:Icon(Icons.camera_alt,color: Colors.pink,),
                  onTap: () {
                    openCamera(ImageSource.camera);
                    Navigator.of(context).pop();
                  },
                ),
                GestureDetector(
                  child: Icon(Icons.photo_library,color: Colors.pink,),
                  onTap: () {
                    Navigator.of(context).pop();
                    openCamera(ImageSource.gallery);
                  },
                ),
              ],
            ),
          );
        });
  }

  File? compressedFile;
  Future<void> openCamera(ImageSource source) async {
    var imgCamera = await imgPicker.pickImage(source: source);

    if (imgCamera != null) {
      setState(() {
        imgFile = File(imgCamera.path);
      });

      // Run compression in a background isolate
      await compressImageInBackground(imgFile!);
    }
  }
  Future<void> compressImageInBackground(File imageFile) async {
    final compressedFile = await compute(compressImage, imageFile);
    setState(() {
      this.compressedFile = compressedFile;

      ImagetoUpload=compressedFile;
      print("${ImagetoUpload!.path}==========================");
    });
  }
  static File compressImage(File imageFile) {
    var image = imgLib.decodeImage(imageFile.readAsBytesSync())!;
    var compressedImage = imgLib.encodeJpg(image, quality: 50);
    File compressedFile = File(imageFile.path.replaceAll('.jpg', '_compressed.jpg'))
      ..writeAsBytesSync(compressedImage);
    print("Original image size: ${imageFile.lengthSync()} bytes");
    print("Compressed image size: ${compressedFile.lengthSync()} bytes");
    // print("Compressed image path: ${compressedFile.path}");

    return compressedFile;
  }


  TextEditingController namecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController mobilecontroller = TextEditingController();
  TextEditingController addresscontroller = TextEditingController();
  TextEditingController questioncontroller = TextEditingController();

  String? dropdownvalue ;
  File? pickedImage;
  String? selectGender;
  String? selectOccupations;



  var genderItems = ["Men", "Woman", "Other"];


  String? selectReligion;
  var religionItems = [
    "Hindus",
    "Muslims",
    "Sikhs"
  ];

  void _onDropdownFocusChange1() {
    setState(() {
      _isDropdownOpen1 = _dropdownFocus1.hasFocus;

      print(_isDropdownOpen1);
    });
  }

  void _onDropdownFocusChange2() {
    setState(() {
      _isDropdownOpen2 = _dropdownFocus2.hasFocus;

      print(_isDropdownOpen2);
    });
  }
  void _onDropdownFocusChange3() {
    setState(() {
      _isDropdownOpen3 = _dropdownFocus3.hasFocus;

      print(_isDropdownOpen3);
    });
  }
@override
  void initState() {
    GetAllOcupationsControllerInstanse.GetAllOcupationsListApiHit();
    // TODO: implement initState
    super.initState();
    _dropdownFocus1.addListener(_onDropdownFocusChange1);
    _dropdownFocus2.addListener(_onDropdownFocusChange2);
    _dropdownFocus3.addListener(_onDropdownFocusChange3);
  }
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
      body:
      Padding(
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
                                  ?  Image.network('https://cdn-icons-png.flaticon.com/512/847/847969.png?w=740&t=st=1691391117~exp=1691391717~hmac=c402e52cf04c8941cd7bc1fae55a6ed27830a0e3f82a34da252300f7b68ce614',height: 200,width: 200,fit:BoxFit.cover,)
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
                        "Upload Video",
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
                          child: Image.asset("assets/icons/vedio.png",color: Colors.pink,),
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
              controller: SeekerProfileControllerInstanse.NameController.value,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Enter your name';
                }
                return null;
              },
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(35.0)),
                      borderSide: BorderSide(color: Color(0xffFE0091))),
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
            // TextFormField(
            //   keyboardType: TextInputType.number,
            //   controller: SeekerProfileControllerInstanse.PhoneController.value,
            //   validator: (value) {
            //     if (value!.isEmpty) {
            //       return "Please Enter Phone Number";
            //     } else {
            //       return null;
            //     }
            //   },
            //   decoration: InputDecoration(
            //       focusedBorder: OutlineInputBorder(
            //           borderRadius: BorderRadius.all(Radius.circular(35.0)),
            //           borderSide: BorderSide(color: Color(0xffFE0091))),
            //       hintStyle: TextStyle(fontSize: 16, color: Color(0xffBABABA)),
            //       contentPadding: EdgeInsets.all(18),
            //       enabledBorder: OutlineInputBorder(
            //           borderRadius: BorderRadius.all(Radius.circular(35.0)),
            //           borderSide: BorderSide(color: Color(0xffBABABA))),
            //       errorBorder: OutlineInputBorder(
            //           borderRadius: BorderRadius.all(Radius.circular(35.0)),
            //           borderSide: BorderSide(color: Color(0xffBABABA))),
            //       focusedErrorBorder: OutlineInputBorder(
            //         borderRadius: BorderRadius.all(Radius.circular(35.0)),
            //         borderSide: BorderSide(color: Color(0xffBABABA)),
            //       ),
            //       suffix: Text(
            //         "verify",
            //         style: Theme.of(context)
            //             .textTheme
            //             .bodySmall!
            //             .copyWith(color: Color(0xffFE0091)),
            //       ),
            //       hintText: "Phone Number",
            //       filled: true,
            //       fillColor: Colors.white),
            // ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: TextFormField(
                    maxLength: 15,
                    controller: MakerProfileControllerInstanse.PhoneController.value,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      prefixIcon:  CountryListPick(
                        theme: CountryTheme(
                          initialSelection: '+91',
                          isShowFlag: true,
                          isShowTitle: false,
                          isShowCode: true,
                          isDownIcon: true,
                          showEnglishName: true,
                          labelColor: Colors.blueAccent,
                        ),
                        initialSelection: '+91',
                        onChanged: ( code) {
                        },
                      ),
                      hintText: "Mobile number",
                      contentPadding: EdgeInsets.all(20),
                      hintStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(color: AppColors.subtitletextcolor),
                      //suffix: Text('Verify',style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Color(0xffFE0091),fontWeight: FontWeight.w400,fontSize: 12),),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(color: Colors.pinkAccent),
                      ),
                      enabledBorder:  OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(color: Color(0xffBABABA)),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(35.0)),
                        borderSide: BorderSide(color: Colors.red),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(35.0)),
                        borderSide: BorderSide(color: Color(0xffBABABA)),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(35.0)),
                        borderSide: BorderSide(color: Colors.pink),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(
                            color: Color(0xffBABABA),
                          )
                      ),
                    ),
                    onFieldSubmitted: (value){},
                    validator: (value) {
                      if(value!.isEmpty){
                        return "Please Enter a Phone Number";
                      }else if(!RegExp(r'^\s*(?:\+?(\d{1,3}))?[-. (]*(\d{3})[-. )]*(\d{3})[-. ]*(\d{4})(?: *x(\d+))?\s*$').hasMatch(value)){
                        return "Please Enter a Valid Phone Number";
                      }
                    },
                  ),
                ),
              ],
            ),

            SizedBox(height: height * .03),
            Text(
              "Email Id",
              style: Theme.of(context).textTheme.titleSmall,
            ),
            SizedBox(height: height * .01),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              controller: SeekerProfileControllerInstanse.EmailController.value,
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
                      borderSide: BorderSide(color: Color(0xffFE0091))),
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
                  // suffix: Text(
                  //   "verify",
                  //   style: Theme.of(context)
                  //       .textTheme
                  //       .bodySmall!
                  //       .copyWith(color: Color(0xffFE0091)),
                  // ),
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
         if(GetAllOcupationsControllerInstanse.Ocupations.isNotEmpty)     Focus(
                focusNode:_dropdownFocus3 ,
                child: DropdownButtonHideUnderline(
                  child: DropdownButton2<String>(
                    isExpanded: true,
                    hint: Text("Select Occupation",style:TextStyle(color:Colors.black),),
                    items: GetAllOcupationsControllerInstanse.Ocupations.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    value: dropdownvalue,
                    onChanged: (String? value) {
                      setState(() {
                        dropdownvalue = value!;
                        Ocupasion = value;
                        print(Ocupasion);
                      });
                    },
                    buttonStyleData: ButtonStyleData(
                      height: Get.height*0.07,
                      padding: const EdgeInsets.only(left: 14, right: 14),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                          color:_isDropdownOpen3==false? Colors.grey:Colors.pink,
                        ),
                        color: Colors.white,
                      ),


                    ),
                    iconStyleData:selectGender==null
                        ? IconStyleData(
                      icon: Icon(Icons.keyboard_arrow_down),  // Change to up arrow icon
                      iconSize: 30,
                      iconEnabledColor: Colors.black,
                    )
                        : IconStyleData(
                      icon: InkWell(child: Icon(Icons.close),onTap: (){
                        setState(() {
                          selectGender=null;
                        });
                      },),  // Change to down arrow icon
                      iconSize: 25,
                      //iconEnabledColor: Colors.black,
                    ),

                    dropdownStyleData: DropdownStyleData(
                      width: Get.width*0.89,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: Colors.white,
                      ),
                      offset: const Offset(10, 0),
                      scrollbarTheme: ScrollbarThemeData(
                        radius: const Radius.circular(40),
                        thickness: MaterialStateProperty.all<double>(6),
                        thumbVisibility: MaterialStateProperty.all<bool>(true),
                      ),
                    ),
                    menuItemStyleData: const MenuItemStyleData(
                      height: 40,
                      padding: EdgeInsets.only(left: 14, right: 14),
                    ),
                  ),
                ),


            ),


           // ***************************   Occupation Pjdfgjdsfds ***************************




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
                      borderSide: BorderSide(color: Color(0xffFE0091))),
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
                  hintText: "Salary",
                  filled: true,
                  fillColor: Colors.white),
            ),


            SizedBox(height: height * .03),
            Text(
              "Address",
              style: Theme.of(context).textTheme.titleSmall,
            ),
            SizedBox(height: height * .01),
            // TextFormField(
            //   keyboardType: TextInputType.emailAddress,
            //   controller: SeekerProfileControllerInstanse.AddressController.value,
            //   validator: (value) {
            //     if (value!.isEmpty) {
            //       return "Please Enter Address";
            //     } else {
            //       return null;
            //     }
            //   },
            //   decoration: InputDecoration(
            //       focusedBorder: OutlineInputBorder(
            //           borderRadius: BorderRadius.all(Radius.circular(35.0)),
            //           borderSide: BorderSide(color: Color(0xffFE0091))),
            //       hintStyle: TextStyle(fontSize: 16, color: Color(0xffBABABA)),
            //       contentPadding: EdgeInsets.all(18),
            //       enabledBorder: OutlineInputBorder(
            //           borderRadius: BorderRadius.all(Radius.circular(35.0)),
            //           borderSide: BorderSide(color: Color(0xffBABABA))),
            //       errorBorder: OutlineInputBorder(
            //           borderRadius: BorderRadius.all(Radius.circular(35.0)),
            //           borderSide: BorderSide(color: Color(0xffBABABA))),
            //       focusedErrorBorder: OutlineInputBorder(
            //         borderRadius: BorderRadius.all(Radius.circular(35.0)),
            //         borderSide: BorderSide(color: Color(0xffBABABA)),
            //       ),
            //       hintText: "Address",
            //       filled: true,
            //       fillColor: Colors.white),
            // ),
            TextFormField(
              keyboardType: TextInputType.text,
              controller: locationcntroller,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please Enter your address';
                }
              },
              onChanged: (value) {
                print(value);
                setState(() {
                  if (locationcntroller.text.isEmpty) {
                    // searchPlace.clear();
                  }
                });
                searchAutocomplete(value);
              },
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(20),
                hintText: "Please Enter your address",
                hintStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(color: AppColors.subtitletextcolor),
                //border: InputBorder.none,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(color: Colors.pinkAccent),
                ),
                enabledBorder:  OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(color: Color(0xffBABABA)),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(35.0)),
                  borderSide: BorderSide(color: Colors.red),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(35.0)),
                  borderSide: BorderSide(color: Color(0xffBABABA)),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(35.0)),
                  borderSide: BorderSide(color: Colors.pink),
                ),
              ),
            ),
            Visibility(
              visible: locationcntroller.text.isNotEmpty,
              child: Container(
                width: double.infinity,
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: searchPlace.length,
                    itemBuilder: (context, index) => ListTile(
                      onTap: () {
                        setState(() {
                          locationcntroller.text =
                              searchPlace[index].description ?? "";
                          _getLatLang();
                          SelectedLocation=locationcntroller.text;
                          print(SelectedLocation);
                          setState(() {
                            searchPlace.clear();
                          });
                        });
                      },
                      horizontalTitleGap: 0,
                      title: Text(
                        searchPlace[index].description ?? "",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    )),
              ),
            ),
            SizedBox(height: height * .03),


            Text(
              "Gender",
              style: Theme.of(context).textTheme.titleSmall,
            ),
            SizedBox(height: height * .01),
            // ****************  select gender dropdown ***********************
            Focus(
              focusNode:_dropdownFocus1 ,
              child: DropdownButtonHideUnderline(
                child: DropdownButton2<String>(
                  isExpanded: true,
                  hint: Text("Select Gender"),
                  items: genderItems.map((String items) {
                    return DropdownMenuItem(
                          value: items,
                     child: Text(items),
                    );
                    }).toList(),
                  value: selectGender,
                  onChanged: (String? value) {
                    setState(() {
                      selectGender = value;
                    });
                  },
                  buttonStyleData: ButtonStyleData(
                    height: Get.height*0.07,
                    padding: const EdgeInsets.only(left: 14, right: 14),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(
                        color:_isDropdownOpen1==false? Colors.grey:Colors.pink,
                      ),
                      color: Colors.white,
                    ),


                  ),
                  iconStyleData:selectGender==null
                      ? IconStyleData(
                    icon: Icon(Icons.keyboard_arrow_down),  // Change to up arrow icon
                    iconSize: 30,
                    iconEnabledColor: Colors.black,
                  )
                      : IconStyleData(
                    icon: InkWell(child: Icon(Icons.close),onTap: (){
                      setState(() {
                        selectGender=null;
                      });
                    },),  // Change to down arrow icon
                    iconSize: 25,
                    //iconEnabledColor: Colors.black,
                  ),

                  dropdownStyleData: DropdownStyleData(
                    width: Get.width*0.89,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: Colors.white,
                    ),
                    offset: const Offset(10, 0),
                    scrollbarTheme: ScrollbarThemeData(
                      radius: const Radius.circular(40),
                      thickness: MaterialStateProperty.all<double>(6),
                      thumbVisibility: MaterialStateProperty.all<bool>(true),
                    ),
                  ),
                  menuItemStyleData: const MenuItemStyleData(
                    height: 40,
                    padding: EdgeInsets.only(left: 14, right: 14),
                  ),
                ),
              ),
            ),
            SizedBox(height: height * .03),

            // ****************  select Religion dropdown ***********************
            Text(
              "Religion",
              style: Theme.of(context).textTheme.titleSmall,
            ),
            SizedBox(height: height * .01),

            Focus(
              focusNode: _dropdownFocus2,
              child: DropdownButtonHideUnderline(
                child: DropdownButton2<String>(
                  isExpanded: true,
                  hint: Text("Select Religion"),
                  items: religionItems.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                  value: selectReligion,
                  onChanged: (String? value) {
                    setState(() {
                      selectReligion = value;
                    });
                  },
                  buttonStyleData: ButtonStyleData(
                    height: Get.height * 0.07,
                    padding: const EdgeInsets.only(left: 14, right: 14),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(
                        color:_isDropdownOpen2==false ?Colors.grey:Colors.pink // Set border color based on selected state
                      ),
                      color: Colors.white,
                    ),
                  ),
                  iconStyleData: selectReligion == null
                      ? IconStyleData(
                    icon: Icon(Icons.keyboard_arrow_down),
                    iconSize: 30,
                    iconEnabledColor: Colors.black,
                  )
                      : IconStyleData(
                    icon: InkWell(
                      child: Icon(Icons.close),
                      onTap: () {
                        setState(() {
                          selectReligion = null;
                        });
                      },
                    ),
                    iconSize: 25,
                    iconEnabledColor: Colors.black,
                  ),
                  dropdownStyleData: DropdownStyleData(
                    width: Get.width * 0.89,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: Colors.white,
                    ),
                    offset: const Offset(10, 0),
                    scrollbarTheme: ScrollbarThemeData(
                      radius: const Radius.circular(40),
                      thickness: MaterialStateProperty.all<double>(6),
                      thumbVisibility: MaterialStateProperty.all<bool>(true),
                    ),
                  ),
                  menuItemStyleData: const MenuItemStyleData(
                    height: 40,
                    padding: EdgeInsets.only(left: 14, right: 14),
                  ),
                ),
              ),
            ),

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
                      controller: SeekerProfileControllerInstanse.HeightController.value,
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
                            borderSide: BorderSide(color: Color(0xffFE0091))),
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
                  controller: SeekerProfileControllerInstanse.InchesController.value,
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
                            borderSide: BorderSide(color: Color(0xffFE0091))),
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

            //no changes **********************************
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
                    child:startdate==null? Text("Choose birthday date",style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.pink,fontSize: 14,fontWeight: FontWeight.w800),):Text(DateFormat('dd-MM-yyyy').format(DateTime.parse(startdate.toString())),style: TextStyle(color:Colors.black),),
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
                        child: Image.asset('assets/icons/Calendar.png',height: 30,color:Colors.pink,)),
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
                controller: SeekerProfileControllerInstanse.QuestionController.value,
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
                        borderSide: BorderSide(color: Color(0xffFE0091))),
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
                    controller: SeekerProfileControllerInstanse.FirstanswerController.value,
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
                            borderSide: BorderSide(color: Color(0xffFE0091))),
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
                    controller: SeekerProfileControllerInstanse.SecondanswerController.value,
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
                            borderSide: BorderSide(color: Color(0xffFE0091))),
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
                    controller: SeekerProfileControllerInstanse.ThirdanswerController.value,
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
                            borderSide: BorderSide(color: Color(0xffFE0091))),
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
                        choose = SeekerProfileControllerInstanse.FirstanswerController.value.text;
                        setState(() {

                          print(choose);
                        });
                      },
                      child: null,
                      style: ElevatedButton.styleFrom(
                          backgroundColor:
                              choose == SeekerProfileControllerInstanse.FirstanswerController.value.text ? Color(0xffFE0091) : Colors.white,
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
                        choose = SeekerProfileControllerInstanse.SecondanswerController.value.text;
                        setState(() {
                          // click = !click;
                          print(choose);
                        });
                      },
                      child: null,
                      style: ElevatedButton.styleFrom(
                          backgroundColor:
                              choose == SeekerProfileControllerInstanse.SecondanswerController.value.text ? Color(0xffFE0091) : Colors.white,
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
                        choose = SeekerProfileControllerInstanse.ThirdanswerController.value.text;
                        setState(() {
                          print(choose);
                          // click = !click;
                        });
                      },
                      child: null,
                      style: ElevatedButton.styleFrom(
                          backgroundColor:
                              choose == SeekerProfileControllerInstanse.ThirdanswerController.value.text ? Color(0xffFE0091) : Colors.white,
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
           Obx(() => Center(
               child: MyButton(
                 loading: SeekerProfileControllerInstanse.loading.value,
                 title: 'Confirm',
                 onTap: () {
                   SeekerProfileControllerInstanse.SeekerProfileApiHit();
                   // Get.to(() => PhotosScreen());
                 },
               )
           )),
            SizedBox(height: Get.height*0.05)
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
              style: Theme.of(context).textTheme.titleLarge,
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
  void searchAutocomplete(String query) async {
    print("calling");
    Uri uri = Uri.https(
        "maps.googleapis.com",
        "maps/api/place/autocomplete/json",
        {"input": query, "key": googleAPiKey});
    print(uri);
    try {
      final response = await http.get(uri);
      print(response.statusCode);
      final parse = jsonDecode(response.body);
      print(parse);
      if (parse['status'] == "OK") {
        setState(() {
          SearchPlaceModel searchPlaceModel = SearchPlaceModel.fromJson(parse);
          searchPlace = searchPlaceModel.predictions!;

          print(searchPlace.length);
        });
      }
    } catch (err) {}
  }
  Future<void> _getLatLang() async {
    final query = locationcntroller.text;
    locations = await locationFromAddress(query);

    setState(() {
      var first = locations.first;
      lat = first.latitude;
      long = first.longitude;
      print("*****lat ${lat} : ${long}**********long");
    });
  }
}
