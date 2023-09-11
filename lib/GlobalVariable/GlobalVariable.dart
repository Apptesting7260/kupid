

import 'dart:async';
import 'dart:ffi';
import 'dart:io';

String ?SelectedGender;
String ?SelectedLocation;
String ?SelectedMtachMakerExperience;
String ?SelectedDate;
DateTime? startdate;
String? datestring;
 File ?imgFile;
 String?Ocupasion;
String verification_method="nationality_identity_card";
String?nationality;
File? ImagetoUpload;
String?Subcriptiontype;
String?choose;
String ?listAsString;
  List<File> galleryImageFiles = [];
List <String>  interests=[];
  String? selectGender;
    bool isVisible = true;
  bool isNotVisible = false;
  int ?rolevalue;
File? videoFile;
 int ?selectedseekerid;
  String? selectExperience;
String ?match_fromid;
String ?match_withid;
String ?Makerid;
String ?Sikeraddress;
String? BioTitle;
String? BioDescription;
String? IntrestedIn;
String? Interests;
String ?SikerReligon;
  String selectedCountry = '';
  String? userIdsiker;

String? requestid;
String requestype="1";
String?action_with;
String?action_from;
String?actiontype;
Bool ?liverpullrequested;
Bool ?spinnwillrequested;


bool isTimerVisible = false;
Duration remainingTime = Duration(hours: 24);
late Timer countdownTimer;
int selectedRadioTile = 0;
bool shouldShowSpinButton = true;