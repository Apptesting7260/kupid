import 'package:cupid_match/match_seeker/photos.dart';
import 'package:cupid_match/utils/my_theme.dart';
import 'package:cupid_match/views/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
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
      home: const SplashScreen(),
    );
  }
}

// search locaton api method

  // void searchAutocomplete(String query) async {
  //   print("calling");
  //   Uri uri = Uri.https(
  //       "maps.googleapis.com",
  //       "maps/api/place/autocomplete/json",
  //       {"input": query, "key": googleAPiKey});
  //   print(uri);
  //   try {
  //     final response = await http.get(uri);
  //     print(response.statusCode);
  //     final parse = jsonDecode(response.body);
  //     print(parse);
  //     if (parse['status'] == "OK") {
  //       setState(() {
  //         SearchPlaceModel searchPlaceModel = SearchPlaceModel.fromJson(parse);
  //         searchPlace = searchPlaceModel.predictions!;

  //         // print(searchPlace.length);
  //       });
  //     }
  //   } catch (err) {}
  // }
// onchanged method 

// onChanged: (value) {
//                         print(value);
//                         setState(() {
//                           if (dropController.text.isEmpty) {
//                             searchPlace.clear();
//                           }
//                         });
//                         searchAutocomplete(value);
//                       },

// list view of loacation 




// Visibility(
//                 visible: dropController.text.isNotEmpty,
//                 child: Container(
//                   width: double.infinity,
//                   child: ListView.builder(
//                       shrinkWrap: true,
//                       itemCount: searchPlace.length,
//                       itemBuilder: (context, index) => ListTile(
//                             onTap: () {
//                               setState(() {
//                                 dropController.text =
//                                     searchPlace[index].description ?? "";
//                                 _getLatLang();

//                                 setState(() {
//                                   searchPlace.clear();
//                                 });
//                               });
//                             },
//                             horizontalTitleGap: 0,
//                             title: Text(
//                               searchPlace[index].description ?? "",
//                               maxLines: 2,
//                               overflow: TextOverflow.ellipsis,
//                             ),
//                           )),
//                 ),
//               ),