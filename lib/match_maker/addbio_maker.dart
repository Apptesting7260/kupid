import 'dart:io';
import 'package:cupid_match/match_maker/verify_identity.dart';
import 'package:cupid_match/utils/app_colors.dart';
import 'package:cupid_match/widgets/my_button.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart' ;
import 'package:intl/intl.dart';

import '../GlobalVariable/GlobalVariable.dart';
import '../controllers/controller/MakerProfileController/MakerProfileController.dart';
import 'package:date_time_picker/date_time_picker.dart';

enum SelectProfile {gender}
class ProfileOneScreen extends StatefulWidget {
  const ProfileOneScreen({Key? key}) : super(key: key);

  @override
  State<ProfileOneScreen> createState() => _ProfileOneScreenState();
}

class _ProfileOneScreenState extends State<ProfileOneScreen> {
  //DateTime? startdate;
  DateTime date = DateTime.now();

  MakerProfileController MakerProfileControllerInstanse=Get.put(MakerProfileController());

  var _formKey = GlobalKey<FormState>();
  var isLoading = false;

  void _submit() {
    final isValid = _formKey.currentState!.validate();
    if(!isValid) {
      return;
    }
    _formKey.currentState!.save();
  }

  String? selectedValue;
  var items = [
    '22',
    '23',
    '24',
    '25',
    '26'
  ];

  String? selectGender;
  var genderItems = [
    "Male",
    "Female",
    "Other"
  ];

  String? selectLocationItems;
  var locationItems = [
    "Jaipur, indian",
    "Sikar"
  ];

  String? selectExperience;
  var experienceItems = [
    "Bigginer",
    "Experience",
    "3 Month experience",
    "4 Month experience",
    "5 Month experience"
  ];

  File? galleryFile;
  final picker = ImagePicker();
  void _showPicker({
    required BuildContext context,
  }) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Choose',style: Theme.of(context).textTheme.titleLarge,),
            // Video Picker
            content: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  child: Text('Camera',style: Theme.of(context).textTheme.titleSmall?.copyWith(fontSize: 13),),
                  onTap: () {
                    getVideo(ImageSource.camera);
                    Navigator.pop(context);
                  },
                ),
                GestureDetector(
                  child: Text('Gallery',style: Theme.of(context).textTheme.titleSmall?.copyWith(fontSize: 13),),
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
    final pickedFile = await picker.pickVideo(source: img,
        preferredCameraDevice: CameraDevice.front,
        maxDuration: Duration(minutes: 10));
    XFile? xfilePick = pickedFile;
    setState(() {
          () {
        if (xfilePick != null) {
          galleryFile = File(pickedFile!.path);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Nothing is selected')));
        }
      };
    });
  }

  Future<DateTime?> showDatePicker({
    required BuildContext context,
    required DateTime initialDate,
    required DateTime firstDate,
    required DateTime lastDate,
    DateTime? currentDate,
    DatePickerEntryMode initialEntryMode = DatePickerEntryMode.calendar,
    SelectableDayPredicate? selectableDayPredicate,
    String? helpText,
    String? cancelText,
    String? confirmText,
    Locale? locale,
    bool useRootNavigator = true,
    RouteSettings? routeSettings,
    TextDirection? textDirection,
    TransitionBuilder? builder,
    DatePickerMode initialDatePickerMode = DatePickerMode.day,
    String? errorFormatText,
    String? errorInvalidText,
    String? fieldHintText,
    String? fieldLabelText,
    TextInputType? keyboardType,
    Offset? anchorPoint,
    final ValueChanged<DatePickerEntryMode>? onDatePickerModeChange
  }) async {
    initialDate = DateUtils.dateOnly(initialDate);
    firstDate = DateUtils.dateOnly(firstDate);
    lastDate = DateUtils.dateOnly(lastDate);
    assert(
    !lastDate.isBefore(firstDate),
    'lastDate $lastDate must be on or after firstDate $firstDate.',
    );
    assert(
    !initialDate.isBefore(firstDate),
    'initialDate $initialDate must be on or after firstDate $firstDate.',
    );
    assert(
    !initialDate.isAfter(lastDate),
    'initialDate $initialDate must be on or before lastDate $lastDate.',
    );
    assert(
    selectableDayPredicate == null || selectableDayPredicate(initialDate),
    'Provided initialDate $initialDate must satisfy provided selectableDayPredicate.',
    );
    assert(debugCheckHasMaterialLocalizations(context));

    Widget dialog = DatePickerDialog(

      initialDate: initialDate,
      firstDate: firstDate,
      lastDate: lastDate,
      currentDate: currentDate,
      initialEntryMode: initialEntryMode,
      selectableDayPredicate: selectableDayPredicate,
      helpText: helpText,
      cancelText: cancelText,
      confirmText: confirmText,
      initialCalendarMode: initialDatePickerMode,
      errorFormatText: errorFormatText,
      errorInvalidText: errorInvalidText,
      fieldHintText: fieldHintText,
      fieldLabelText: fieldLabelText,
      keyboardType: keyboardType,
      onDatePickerModeChange: onDatePickerModeChange,
    );

    // if (textDirection != null) {
    //   dialog = Directionality(
    //     textDirection: textDirection,
    //     child: dialog,
    //   );
    // }

    if (locale != null) {
      dialog = Localizations.override(
        context: context,
        locale: locale,
        child: dialog,
      );
    }

    return showDialog<DateTime>(
      context: context,
      useRootNavigator: useRootNavigator,
      routeSettings: routeSettings,
      builder: (BuildContext context) {
        return builder == null ? dialog : builder(context, dialog);
      },
      anchorPoint: anchorPoint,
    );
  }


  File imgFile =File("");
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
    });
    Navigator.of(context).pop();
  }

  SelectProfile selectProfile = SelectProfile.gender;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {
          Navigator.pop(context);
        },
            icon: Icon(Icons.arrow_back,color: Color(0xff5A5A5A), size: 27,)),
        title: Text("Profile Details",style: Theme.of(context).textTheme.titleLarge,),
        centerTitle: true,
        // actions: [
        //    Image(image: AssetImage("assets/images/menu (2) 1.png")),
        // ],
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: width*0.04,vertical: height*.02),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Column(
                children: [
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
                              child: imgFile.path.isNotEmpty
                                  ?Image.file(imgFile,height: height,width: width,fit:BoxFit.cover,)
                                  :Image.network('https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=870&q=80',height: 200,width: 200,fit:BoxFit.cover,),
                            ),
                          ),
                          Positioned(
                            bottom: -9,
                            right: -8,
                            child:
                            Container(
                              height: height*0.06,
                              width: width*.12,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: AppColors.white),
                                  borderRadius: BorderRadius.circular(50),
                                  color: Color(0xff777777)
                              ),
                              child: IconButton(
                                onPressed: (){
                                  showOptionsDialog(context);
                                },
                                icon: Icon(
                                  Icons.camera_alt,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.05,),
                  Text(
                    "Upload photo",
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(color: AppColors.black),
                  ),
                  SizedBox(height: height * 0.03),

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
                            Text(
                              "Upload Vedio",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(color: Colors.grey),
                            ),
                            Container(
                              height: height * .1,
                              width: width * .1,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.grey.shade300,
                              ),
                              child: Image.asset("assets/icons/vedio.png"),
                              alignment: Alignment.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                        "Name",
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600)),
                  ),
                  SizedBox(height: height*.01,),
                  TextFormField(
                    controller: MakerProfileControllerInstanse.NameController.value,
                    decoration: InputDecoration(
                      hintText: "Name",
                      contentPadding: EdgeInsets.all(20),
                      hintStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(color: AppColors.subtitletextcolor),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(color: Color(0xffBABABA)),
                      ),
                      enabledBorder:  OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(color: Color(0xffBABABA)),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xffBABABA),
                        ),
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onFieldSubmitted: (value){},
                    validator: (value) {
                      if(value!.isEmpty) {
                        return "Enter a valid name";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: height * 0.03,),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Email",
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600),
                      )),
                  SizedBox(height: height*.01,),
                  TextFormField(
                    controller: MakerProfileControllerInstanse.EmailController.value,
                    decoration: InputDecoration(
                      hintText: "example@gmail.com",
                      contentPadding: EdgeInsets.all(20),
                      hintStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(color: AppColors.subtitletextcolor),
                      suffix: Text('Verify',style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Color(0xffFE0091),fontWeight: FontWeight.w400,fontSize: 12),),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(color: Color(0xffBABABA)),
                      ),
                      enabledBorder:  OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(color: Color(0xffBABABA)),
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
                      if (value!.isEmpty ||
                          !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(value)) {
                        return 'Enter a valid email!';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: height * 0.03,),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Phone Number",
                        style: Theme.of(context).textTheme.titleSmall,
                      )),
                  SizedBox(height: height*.01,),
                  TextFormField(
                    controller: MakerProfileControllerInstanse.PhoneController.value,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: "Mobile number",
                      contentPadding: EdgeInsets.all(20),
                      hintStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(color: AppColors.subtitletextcolor),
                      suffix: Text('Verify',style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Color(0xffFE0091),fontWeight: FontWeight.w400,fontSize: 12),),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(color: Color(0xffBABABA)),
                      ),
                      enabledBorder:  OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(color: Color(0xffBABABA)),
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

                  SizedBox(height: height * 0.04,),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Sex",
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600),
                    ),
                  ),
                  SizedBox(height: height * 0.01,),
                  DropdownButtonFormField(
                      value: selectGender,
                      icon: const Icon(Icons.keyboard_arrow_down,color: Color(0xff000000),size: 28,),
                      style: Theme.of(context).textTheme.bodyLarge,
                      items: genderItems.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items),
                        );
                      }).toList(),
                      validator: (value) {
                        if(value == null)
                          return "select your gender";
                        return null;
                      },
                      onChanged: (String? newValue) {
                        setState(() {
                          selectGender = newValue!;
                          SelectedGender=newValue;
                        });
                      },
                      decoration: InputDecoration(
                        hintText: "Select your gender",
                        contentPadding: EdgeInsets.all(20),
                        hintStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(color: AppColors.subtitletextcolor),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(color: Color(0xffBABABA)),
                        ),
                        enabledBorder:  OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(color: Color(0xffBABABA)),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(color: Color(0xffBABABA))),
                      )
                  ),
                  SizedBox(height: height * 0.04,),

                  Container(
                    height: height*.09,
                    width: width,
                    decoration: BoxDecoration(
                      color: Color(0xffCACACA),
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
                  SizedBox(height: height * 0.04,),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Location",
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ),
                  SizedBox(height: height*.01,),
                  DropdownButtonFormField(value: selectLocationItems,
                      icon: const Icon(Icons.keyboard_arrow_down,color: Color(0xff000000),size: 28,),
                      style: Theme.of(context).textTheme.bodyLarge,
                      items: locationItems.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items),
                        );
                      }).toList(),
                      validator: (value) {
                        if (value == null)
                          return "select your location";
                        return null;
                      },
                      onChanged: (String? newValue) {
                        setState(() {
                          selectLocationItems = newValue!;
                          SelectedLocation=newValue;
                        });
                      },
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(20),
                        hintText: "Select your location",
                        hintStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(color: AppColors.subtitletextcolor),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(color: Color(0xffBABABA)),
                        ),
                        enabledBorder:  OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(color: Color(0xffBABABA)),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(color: Color(0xffBABABA))),
                      )
                  ),
                  SizedBox(height:  height * 0.04,),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Match Maker Experience:",
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ),
                  SizedBox(height: height*.01,),
                  DropdownButtonFormField(value: selectExperience,
                      icon: const Icon(Icons.keyboard_arrow_down,color: Color(0xff000000),size: 28,),
                      style: Theme.of(context).textTheme.bodyLarge,
                      items: experienceItems.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items),
                        );
                      }).toList(),
                      validator: (value) {
                        if(value == null)
                          return "select your experience";
                        return null;
                      },
                      onChanged: (String? newValue) {
                        setState(() {
                          selectExperience = newValue!;
                          SelectedMtachMakerExperience=newValue;
                        });
                      },
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(20),
                        hintText: "Select your experience",
                        hintStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(color: AppColors.subtitletextcolor),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(color: Color(0xffBABABA)),
                        ),
                        enabledBorder:  OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(color: Color(0xffBABABA)),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(color: Color(0xffBABABA))),
                      )
                  ),


                  SizedBox(height: height * 0.04,),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "About the Match Maker",
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ),
                  SizedBox(height: height*.01,),
                  TextFormField(
                    controller: MakerProfileControllerInstanse.AboutMakerController.value,
                    maxLines: 4,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(20),
                      hintText: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                      hintStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(color: AppColors.subtitletextcolor),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Color(0xffBABABA)),
                      ),
                      enabledBorder:  OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Color(0xffBABABA)),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Color(0xffBABABA)),
                      ),
                    ),
                    validator: (value) {
                      if(value!.isEmpty) {
                        return "Please required";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: height * 0.04,),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "What do you expect from your match seekers",
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(color: AppColors.black),
                    ),
                  ),
                  SizedBox(height: height*.01,),
                  TextFormField(
                    controller: MakerProfileControllerInstanse.ExpectFromSeekerController.value,
                    maxLines: 4,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(20),
                      hintText: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                      hintStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(color: AppColors.subtitletextcolor),
                      //contentPadding: EdgeInsets.symmetric(vertical: height * 0.05,horizontal: width * 0.04),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Color(0xffBABABA)),
                      ),
                      enabledBorder:  OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Color(0xffBABABA)),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Color(0xffBABABA)),
                      ),
                    ),
                    validator: (value) {
                      if(value!.isEmpty) {
                        return "Please required";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: height * 0.04,),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Match Maker Heading that they want everyone to see:",
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(color: AppColors.black),
                    ),
                  ),
                  SizedBox(height: height*.01,),
                  TextFormField(
                    controller: MakerProfileControllerInstanse.HandlingOfMakerController.value,
                    maxLines: 4,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(20),
                      hintText: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                      hintStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(color: AppColors.subtitletextcolor),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Color(0xffBABABA)),
                      ),
                      enabledBorder:  OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Color(0xffBABABA)),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: Color(0xffBABABA))
                      ),
                    ),
                    validator: (value) {
                      if(value!.isEmpty) {
                        if(value!.isEmpty) {
                          return "Please required";
                        }
                        return null;
                      }
                    },
                  ),
                  SizedBox(height: height * 0.06,),


                 Obx(() => MyButton(
                   loading: MakerProfileControllerInstanse.loading.value,
                   width: width * 0.8,
                   title: 'Save',
                   onTap: () {
                     if(_formKey.currentState!.validate()) {
                       _formKey.currentState!.save();
                       _submit();
                       MakerProfileControllerInstanse.MakerProfileApiHit();

                     }
                   },
                 ),) ,
                  SizedBox(height: height * 0.06,),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
