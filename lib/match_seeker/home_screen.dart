import 'package:cupid_match/controllers/controller/MagicProfileController/MagicProfileConrtroller.dart';
import 'package:cupid_match/match_seeker/choose_one.dart';
import 'package:cupid_match/match_seeker/lever/new_liver.dart';
import 'package:cupid_match/match_seeker/Siker_TabView.dart';
import 'package:cupid_match/widgets/Spin_Will_Wigdet.dart';
import 'package:cupid_match/widgets/drawer.dart';
import 'package:cupid_match/widgets/my_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:get/get.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
    int ?selectedrole;
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  ChoseRole()async{
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  
selectedrole=prefs.getInt("roll");
 print("$selectedrole======");

 setState(() {
   
 });
}


@override
  void initState() {

        ChoseRole();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      key: _scaffoldKey,
      endDrawer: MyDrawer(),
      appBar: AppBar(title: Text(
                  "Home",
                  style: Theme.of(context).textTheme.titleSmall,
                ),actions: [ GestureDetector(
                    onTap: () {
                      _scaffoldKey.currentState!.openEndDrawer();
                    },
                    child: Image.asset("assets/icons/menu.png"))],),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: SingleChildScrollView(
          child: Column(children: [

                Center(child: Image.asset("assets/images/match.png")),
                  if(selectedrole==1)  SpinWillWidget(),
                 if(selectedrole==2) SlotMachine()
          ],),
        )
      ),
    );
  }
}
