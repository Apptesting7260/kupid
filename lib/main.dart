
import 'package:cupid_match/utils/my_theme.dart';
import 'package:cupid_match/views/sign_up/signup_screen.dart';
import 'package:cupid_match/views/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'match_maker/match_maker_profile_update.dart';
import 'match_maker/photo_access.dart';
import 'match_maker/profile_maker.dart';
import 'match_seeker/Chose_role_Type.dart';
import 'match_seeker/SeeAllMaker/SeAllMaker.dart';
import 'match_seeker/home_screen.dart';
import 'match_seeker/lever/new_liver.dart';
import 'match_seeker/profile/interest.dart';
import 'match_seeker/profile/update_profile_details.dart';
import 'match_seeker/siker_Home_Screen.dart';

Future main()async {
    
   WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp();

  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: MyTheme.light,
      home:  SplashScreen(),
    );
  }
}
