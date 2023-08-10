import 'dart:convert';
import 'dart:io';
import 'package:country_list_pick/country_list_pick.dart';
import 'package:country_picker/country_picker.dart';
import 'package:cupid_match/match_maker/verify_identity.dart';
import 'package:cupid_match/models/GoogleLocationModel/GoogleLocationModel.dart';
import 'package:cupid_match/utils/app_colors.dart';
import 'package:cupid_match/widgets/my_button.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:file_picker/file_picker.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
// import 'package:country_picker/country_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
// import 'package:intl_phone_field/countries.dart';

import '../GlobalVariable/GlobalVariable.dart';
import '../controllers/controller/MakerProfileController/MakerProfileController.dart';

import 'package:http/http.dart' as http;

enum SelectProfile { gender }

File? videoFile;

class MakerProfileDetails extends StatefulWidget {
  const MakerProfileDetails({Key? key}) : super(key: key);

  @override
  State<MakerProfileDetails> createState() => _MakerProfileDetailsState();
}

class _MakerProfileDetailsState extends State<MakerProfileDetails> {
  //DateTime? startdate;
  FocusNode _dropdownFocus1 = FocusNode();
  FocusNode _dropdownFocus2 = FocusNode();
  bool _isDropdownOpen2 = false;
  bool _isDropdownOpen1 = false;
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

  List<Location> locations = [];
  double? lat;
  double? long;
  String countryCode = 'Choose country';

  DateTime date = DateTime.now();
  List<Predictions> searchPlace = [];
  final locationcntroller = TextEditingController();
  MakerProfileController MakerProfileControllerInstanse =
      Get.put(MakerProfileController());
  String googleAPiKey = "AIzaSyACG0YonxAConKXfgaeVYj7RCRdXazrPYI";
  var _formKey = GlobalKey<FormState>();
  var isLoading = false;

  void _submit() {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    _formKey.currentState!.save();
  }

  String? selectedValue;
  var items = ['22', '23', '24', '25', '26'];

  String? selectGender;
  var genderItems = ["Male", "Female", "Other"];

  String? selectLocationItems;
  var locationItems = ["Jaipur, indian", "Sikar"];

  String? selectExperience;
  var experienceItems = [
    "Bigginer",
    "Experience",
    "3 Month experience",
    "4 Month experience",
    "5 Month experience"
  ];

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

  File? galleryFile;
  final picker = ImagePicker();
  void _showPicker({
    required BuildContext context,
  }) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              'Choose',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            // Video Picker
            content:
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  child: Text(
                    'Camera',
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall
                        ?.copyWith(fontSize: 13),
                  ),
                  onTap: () {
                    getVideo(ImageSource.camera);
                    Navigator.pop(context);
                  },
                ),
                GestureDetector(
                  child: Text(
                    'Gallery',
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall
                        ?.copyWith(fontSize: 13),
                  ),
                  onTap: () {
                    getVideo(ImageSource.gallery);
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          );
        });
  }

  Future getVideo(
    ImageSource img,
  ) async {
    final pickedFile = await picker.pickVideo(
        source: img,
        preferredCameraDevice: CameraDevice.front,
        maxDuration: Duration(minutes: 10));
    XFile? xfilePick = pickedFile;
    setState(() {
      () {
        if (xfilePick != null) {
          galleryFile = File(pickedFile!.path);
        } else {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('Nothing is selected')));
        }
      };
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _dropdownFocus1.addListener(_onDropdownFocusChange1);
    _dropdownFocus2.addListener(_onDropdownFocusChange2);
  }
  // Future<DateTime?> showDatePicker({
  //   required BuildContext context,
  //   required DateTime initialDate,
  //   required DateTime firstDate,
  //   required DateTime lastDate,
  //   DateTime? currentDate,
  //   DatePickerEntryMode initialEntryMode = DatePickerEntryMode.calendar,
  //   SelectableDayPredicate? selectableDayPredicate,
  //   String? helpText,
  //   String? cancelText,
  //   String? confirmText,
  //   Locale? locale,
  //   bool useRootNavigator = true,
  //   RouteSettings? routeSettings,
  //   TextDirection? textDirection,
  //   TransitionBuilder? builder,
  //   DatePickerMode initialDatePickerMode = DatePickerMode.day,
  //   String? errorFormatText,
  //   String? errorInvalidText,
  //   String? fieldHintText,
  //   String? fieldLabelText,
  //   TextInputType? keyboardType,
  //   Offset? anchorPoint,
  //   final ValueChanged<DatePickerEntryMode>? onDatePickerModeChange
  // }) async {
  //   initialDate = DateUtils.dateOnly(initialDate);
  //   firstDate = DateUtils.dateOnly(firstDate);
  //   lastDate = DateUtils.dateOnly(lastDate);
  //   assert(
  //   !lastDate.isBefore(firstDate),
  //   'lastDate $lastDate must be on or after firstDate $firstDate.',
  //   );
  //   assert(
  //   !initialDate.isBefore(firstDate),
  //   'initialDate $initialDate must be on or after firstDate $firstDate.',
  //   );
  //   assert(
  //   !initialDate.isAfter(lastDate),
  //   'initialDate $initialDate must be on or before lastDate $lastDate.',
  //   );
  //   assert(
  //   selectableDayPredicate == null || selectableDayPredicate(initialDate),
  //   'Provided initialDate $initialDate must satisfy provided selectableDayPredicate.',
  //   );
  //   assert(debugCheckHasMaterialLocalizations(context));

  //   Widget dialog = DatePickerDialog(

  //     initialDate: initialDate,
  //     firstDate: firstDate,
  //     lastDate: lastDate,
  //     currentDate: currentDate,
  //     initialEntryMode: initialEntryMode,
  //     selectableDayPredicate: selectableDayPredicate,
  //     helpText: helpText,
  //     cancelText: cancelText,
  //     confirmText: confirmText,
  //     initialCalendarMode: initialDatePickerMode,
  //     errorFormatText: errorFormatText,
  //     errorInvalidText: errorInvalidText,
  //     fieldHintText: fieldHintText,
  //     fieldLabelText: fieldLabelText,
  //     keyboardType: keyboardType,
  //     onDatePickerModeChange: onDatePickerModeChange,
  //   );

  //   // if (textDirection != null) {
  //   //   dialog = Directionality(
  //   //     textDirection: textDirection,
  //   //     child: dialog,
  //   //   );
  //   // }

  //   if (locale != null) {
  //     dialog = Localizations.override(
  //       context: context,
  //       locale: locale,
  //       child: dialog,
  //     );
  //   }

  //   return showDialog<DateTime>(
  //     context: context,
  //     useRootNavigator: useRootNavigator,
  //     routeSettings: routeSettings,
  //     builder: (BuildContext context) {
  //       return builder == null ? dialog : builder(context, dialog);
  //     },
  //     anchorPoint: anchorPoint,
  //   );
  // }

  final imgPicker = ImagePicker();
  Future<void> showOptionsDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Center(
                child: Text(
              "Choose",
              style: Theme.of(context).textTheme.titleLarge,
            )),
            //Image Picker
            content: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  child: Icon(
                    Icons.camera_alt_outlined,
                    color: Colors.pinkAccent,
                  ),
                  onTap: () {
                    openCamera(ImageSource.camera);
                  },
                ),
                // GestureDetector(
                //   child: Text("Camera",style: Theme.of(context).textTheme.titleSmall?.copyWith(fontSize: 13),),
                //   onTap: () {
                //     openCamera(ImageSource.camera);
                //   },
                // ),

                GestureDetector(
                  child: Icon(
                    Icons.photo_library,
                    color: Colors.pinkAccent,
                  ),
                  onTap: () {
                    openCamera(ImageSource.gallery);
                  },
                ),
                // GestureDetector(
                //   child: Text("Gallery",style: Theme.of(context).textTheme.titleSmall?.copyWith(fontSize: 13),),
                //   onTap: () {
                //     openCamera(ImageSource.gallery);
                //   },
                // ),
              ],
            ),
          );
        });
  }

  void openCamera(abc) async {
    var imgCamera = await imgPicker.pickImage(source: abc);
    setState(() {
      imgFile = File(imgCamera!.path);

      print(imgFile);
    });
    Navigator.of(context).pop();
  }

  SelectProfile selectProfile = SelectProfile.gender;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: Color(0xff5A5A5A),
              size: 27,
            )),
        title: Text(
          "Profile Details",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        centerTitle: true,
        // actions: [
        //    Image(image: AssetImage("assets/images/menu (2) 1.png")),
        // ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: width * 0.04, vertical: height * .02),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Column(
                children: [
                  Center(
                    child: SizedBox(
                      height: height * .14,
                      width: width * .30,
                      child: Stack(
                        clipBehavior: Clip.none,
                        fit: StackFit.expand,
                        children: [
                          CircleAvatar(
                            child: ClipOval(
                                child: imgFile == null
                                    ? Image.network(
                                        'https://cdn-icons-png.flaticon.com/512/847/847969.png?w=740&t=st=1691407400~exp=1691408000~hmac=50e7754305b51bd502a2e16302b93ac076a3b959f6944c407253738aaf65d357',
                                        height: 200,
                                        width: 200,
                                        fit: BoxFit.cover,
                                      )
                                    : Image.file(
                                        imgFile!,
                                        height: height,
                                        width: width,
                                        fit: BoxFit.cover,
                                      )),
                          ),

                          Positioned(
                              bottom: -9,
                              right: -8,
                              //right: 0,
                              child: GestureDetector(
                                  onTap: () {
                                    showOptionsDialog(context);
                                  },
                                  child:
                                      Image.asset("assets/icons/cameraa.png")))

                          // Positioned(
                          //   bottom: -9,
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
                  SizedBox(
                    height: height * 0.05,
                  ),
                  Text(
                    "Upload photo",
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall
                        ?.copyWith(color: AppColors.black),
                  ),
                  SizedBox(height: height * 0.05),

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
                            videoFile == null
                                ? Text(
                                    "Upload Video",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(color: Colors.grey),
                                  )
                                : Row(
                                    children: [
                                      Text(
                                        " Video Uploaded ",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .copyWith(color: Colors.black),
                                      ),
                                      Icon(
                                        Icons.check_circle,
                                        size: 15,
                                        color: Colors.green,
                                      )
                                    ],
                                  ),
                            videoFile == null
                                ? InkWell(
                                    child: Container(
                                      height: height * .1,
                                      width: width * .1,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.grey.shade300,
                                      ),
                                      child: Image.asset(
                                        "assets/icons/vedio.png",
                                        color: Colors.pink,
                                      ),
                                      alignment: Alignment.center,
                                    ),
                                    onTap: () {
                                      pickVideo();
                                    },
                                  )
                                : InkWell(
                                    child: Container(
                                      height: height * .1,
                                      width: width * .1,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.grey.shade300,
                                      ),
                                      child: Icon(
                                        Icons.cancel,
                                        color: Colors.red,
                                      ),
                                      alignment: Alignment.center,
                                    ),
                                    onTap: () {
                                      setState(() {
                                        videoFile = null;
                                      });
                                    },
                                  )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * .03,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Name",
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall
                            ?.copyWith(fontWeight: FontWeight.w600)),
                  ),
                  SizedBox(
                    height: height * .01,
                  ),
                  TextFormField(
                    controller:
                        MakerProfileControllerInstanse.NameController.value,
                    decoration: InputDecoration(
                      hintText: "Name",
                      contentPadding: EdgeInsets.all(20),
                      hintStyle: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(color: AppColors.subtitletextcolor),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(color: Colors.pinkAccent),
                      ),
                      enabledBorder: OutlineInputBorder(
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
                        borderSide: BorderSide(
                          color: Color(0xffBABABA),
                        ),
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onFieldSubmitted: (value) {},
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter a valid name";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: height * 0.03,
                  ),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Email",
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall
                            ?.copyWith(fontWeight: FontWeight.w600),
                      )),
                  SizedBox(
                    height: height * .01,
                  ),
                  TextFormField(
                    controller:
                        MakerProfileControllerInstanse.EmailController.value,
                    decoration: InputDecoration(
                      hintText: "example@gmail.com",
                      contentPadding: EdgeInsets.all(20),
                      hintStyle: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(color: AppColors.subtitletextcolor),
                      //suffix: Text('Verify',style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Color(0xffFE0091),fontWeight: FontWeight.w400,fontSize: 12),),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(color: Colors.pinkAccent),
                      ),
                      enabledBorder: OutlineInputBorder(
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
                          )),
                    ),
                    onFieldSubmitted: (value) {},
                    validator: (value) {
                      if (value!.isEmpty ||
                          !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(value)) {
                        return 'Enter a valid email!';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: height * 0.03,
                  ),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Phone Number",
                        style: Theme.of(context).textTheme.titleSmall,
                      )),
                  SizedBox(
                    height: height * .01,
                  ),

                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: TextFormField(
                          maxLength: 15,
                          controller: MakerProfileControllerInstanse
                              .PhoneController.value,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            prefixIcon: CountryListPick(
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
                              onChanged: (code) {},
                            ),
                            hintText: "Mobile number",
                            contentPadding: EdgeInsets.all(20),
                            hintStyle: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(color: AppColors.subtitletextcolor),
                            //suffix: Text('Verify',style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Color(0xffFE0091),fontWeight: FontWeight.w400,fontSize: 12),),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(color: Colors.pinkAccent),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(color: Color(0xffBABABA)),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(35.0)),
                              borderSide: BorderSide(color: Colors.red),
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(35.0)),
                              borderSide: BorderSide(color: Color(0xffBABABA)),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(35.0)),
                              borderSide: BorderSide(color: Colors.pink),
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(
                                  color: Color(0xffBABABA),
                                )),
                          ),
                          onFieldSubmitted: (value) {},
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please Enter a Phone Number";
                            } else if (!RegExp(
                                    r'^\s*(?:\+?(\d{1,3}))?[-. (]*(\d{3})[-. )]*(\d{3})[-. ]*(\d{4})(?: *x(\d+))?\s*$')
                                .hasMatch(value)) {
                              return "Please Enter a Valid Phone Number";
                            }
                          },
                        ),
                      ),
                    ],
                  ),

                  SizedBox(
                    height: height * 0.04,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Gender",
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall
                          ?.copyWith(fontWeight: FontWeight.w600),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Focus(
                    focusNode: _dropdownFocus1,
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
                          height: Get.height * 0.07,
                          padding: const EdgeInsets.only(left: 14, right: 14),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(
                              color: _isDropdownOpen1 == false
                                  ? Colors.grey
                                  : Colors.pink,
                            ),
                            color: Colors.white,
                          ),
                        ),
                        iconStyleData: selectGender == null
                            ? IconStyleData(
                                icon: Icon(Icons
                                    .keyboard_arrow_down), // Change to up arrow icon
                                iconSize: 30,
                                iconEnabledColor: Colors.black,
                              )
                            : IconStyleData(
                                icon: InkWell(
                                  child: Icon(Icons.close),
                                  onTap: () {
                                    setState(() {
                                      selectGender = null;
                                    });
                                  },
                                ), // Change to down arrow icon
                                iconSize: 25,
                                //iconEnabledColor: Colors.black,
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
                            thumbVisibility:
                                MaterialStateProperty.all<bool>(true),
                          ),
                        ),
                        menuItemStyleData: const MenuItemStyleData(
                          height: 40,
                          padding: EdgeInsets.only(left: 14, right: 14),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.04,
                  ),

                  Container(
                    height: height * .08,
                    width: width,
                    decoration: BoxDecoration(
                      color: Color(0xffF3F3F3),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: width * .05),
                          child: startdate == null
                              ? Text(
                                  "Choose birthday date",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(
                                          color: Colors.pink,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w800),
                                )
                              : Text(
                                  DateFormat('dd-MM-yyyy').format(
                                      DateTime.parse(startdate.toString())),
                                  style: TextStyle(color: Colors.pink),
                                ),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: width * .05),
                          child: GestureDetector(
                              onTap: () async {
                                DateTime minimumDate = DateTime.now().subtract(
                                    Duration(
                                        days: 365 *
                                            18)); // 18 years ago from today

                                startdate = await showDatePicker(
                                  context: context,
                                  initialDate: minimumDate,
                                  firstDate: DateTime(1900),
                                  lastDate: minimumDate,
                                );
                                print(startdate);
                                datestring = DateFormat('dd-MM-yyyy').format(
                                    DateTime.parse(startdate.toString()));
                                print(datestring);

                                setState(() {
                                  datestring;
                                });
                              },
                              child: Image.asset(
                                'assets/icons/Calendar.png',
                                height: 30,
                                color: Colors.pink,
                              )),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: height * 0.04,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Location",
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ),
                  SizedBox(
                    height: height * .01,
                  ),
                  // DropdownButtonFormField(value: selectLocationItems,
                  //     icon: const Icon(Icons.keyboard_arrow_down,color: Color(0xff000000),size: 28,),
                  //     style: Theme.of(context).textTheme.bodyLarge,
                  //     items: locationItems.map((String items) {
                  //       return DropdownMenuItem(
                  //         value: items,
                  //         child: Text(items),
                  //       );
                  //     }).toList(),
                  //     validator: (value) {
                  //       if (value == null)
                  //         return "select your location";
                  //       return null;
                  //     },
                  //     onChanged: (String? newValue) {
                  //       setState(() {
                  //         selectLocationItems = newValue!;
                  //         SelectedLocation=newValue;
                  //       });
                  //     },
                  //     decoration: InputDecoration(
                  //       contentPadding: EdgeInsets.all(20),
                  //       hintText: "Select your location",
                  //       hintStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(color: AppColors.subtitletextcolor),
                  //       focusedBorder: OutlineInputBorder(
                  //         borderRadius: BorderRadius.circular(30),
                  //         borderSide: BorderSide(color: Color(0xffBABABA)),
                  //       ),
                  //       enabledBorder:  OutlineInputBorder(
                  //         borderRadius: BorderRadius.circular(30),
                  //         borderSide: BorderSide(color: Color(0xffBABABA)),
                  //       ),
                  //       border: OutlineInputBorder(
                  //           borderRadius: BorderRadius.circular(30),
                  //           borderSide: BorderSide(color: Color(0xffBABABA))),
                  //     )
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
                      hintStyle: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(color: AppColors.subtitletextcolor),
                      //border: InputBorder.none,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(color: Colors.pinkAccent),
                      ),
                      enabledBorder: OutlineInputBorder(
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
                                    SelectedLocation = locationcntroller.text;
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
                  SizedBox(
                    height: height * 0.04,
                  ),

                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Match Maker Experience:",
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ),
                  SizedBox(
                    height: height * .01,
                  ),

                  //******************************************************
                  Focus(
                    focusNode: _dropdownFocus2,
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton2<String>(
                        isExpanded: true,
                        hint: Text("Select Gender"),
                        items: experienceItems.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items),
                          );
                        }).toList(),
                        value: selectExperience,
                        onChanged: (String? value) {
                          setState(() {
                            selectExperience = value;
                          });
                        },
                        buttonStyleData: ButtonStyleData(
                          height: Get.height * 0.07,
                          padding: const EdgeInsets.only(left: 14, right: 14),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(
                              color: _isDropdownOpen2 == false
                                  ? Colors.grey
                                  : Colors.pink,
                            ),
                            color: Colors.white,
                          ),
                        ),
                        iconStyleData: selectExperience == null
                            ? IconStyleData(
                                icon: Icon(Icons
                                    .keyboard_arrow_down), // Change to up arrow icon
                                iconSize: 30,
                                iconEnabledColor: Colors.black,
                              )
                            : IconStyleData(
                                icon: InkWell(
                                  child: Icon(Icons.close),
                                  onTap: () {
                                    setState(() {
                                      selectExperience = null;
                                    });
                                  },
                                ), // Change to down arrow icon
                                iconSize: 25,
                                //iconEnabledColor: Colors.black,
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
                            thumbVisibility:
                                MaterialStateProperty.all<bool>(true),
                          ),
                        ),
                        menuItemStyleData: const MenuItemStyleData(
                          height: 40,
                          padding: EdgeInsets.only(left: 14, right: 14),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(
                    height: height * 0.04,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "About the Match Maker",
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ),
                  SizedBox(
                    height: height * .01,
                  ),
                  TextFormField(
                    controller: MakerProfileControllerInstanse
                        .AboutMakerController.value,
                    maxLines: 4,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(20),
                      hintText: "Type Something about the Match Maker",
                      hintStyle: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(color: AppColors.subtitletextcolor),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Color(0xffFE0091)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Color(0xffBABABA)),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Color(0xffBABABA)),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please required";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: height * 0.04,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "What do you expect from your match seekers",
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge
                          ?.copyWith(color: AppColors.black),
                    ),
                  ),
                  SizedBox(
                    height: height * .01,
                  ),
                  TextFormField(
                    controller: MakerProfileControllerInstanse
                        .ExpectFromSeekerController.value,
                    maxLines: 4,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(20),
                      hintText: "Type Something about the Match seekers",
                      hintStyle: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(color: AppColors.subtitletextcolor),
                      //contentPadding: EdgeInsets.symmetric(vertical: height * 0.05,horizontal: width * 0.04),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Color(0xffFE0091)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Color(0xffBABABA)),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Color(0xffBABABA)),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please required";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: height * 0.04,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Match Maker Heading that they want everyone to see:",
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge
                          ?.copyWith(color: AppColors.black),
                    ),
                  ),
                  SizedBox(
                    height: height * .01,
                  ),
                  TextFormField(
                    controller: MakerProfileControllerInstanse
                        .HandlingOfMakerController.value,
                    maxLines: 4,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(20),
                      hintText: "Type Something about the Match Maker Heading",
                      hintStyle: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(color: AppColors.subtitletextcolor),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Color(0xffFE0091)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Color(0xffBABABA)),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: Color(0xffBABABA))),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        if (value.isEmpty) {
                          return "Please required";
                        }
                        return null;
                      }
                    },
                  ),
                  SizedBox(
                    height: height * 0.06,
                  ),

                  Obx(
                    () => MyButton(
                      loading: MakerProfileControllerInstanse.loading.value,
                      width: width * 0.8,
                      title: 'Save',
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          _submit();
                          MakerProfileControllerInstanse.MakerProfileApiHit();
                        }
                      },
                    ),
                  ),
                  SizedBox(
                    height: height * 0.06,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  //////////google location api method //////////////

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
