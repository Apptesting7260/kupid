import 'package:cupid_match/GlobalVariable/GlobalVariable.dart';
import 'package:cupid_match/controllers/controller/SeekersAllInterests_Controller/SeekersAllInterests_Controller.dart';
import 'package:cupid_match/data/response/status.dart';
import 'package:cupid_match/match_seeker/profile/add_bio.dart';
import 'package:cupid_match/res/components/internet_exceptions_widget.dart';
import 'package:cupid_match/utils/utils.dart';
import 'package:cupid_match/widgets/my_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/controller/SeekerAddistionInfoController/Seeker_Addistion_InfoController.dart';

  List<String> selectedInterests = []; // Track selected interests
class Interest extends StatefulWidget {
  const Interest({Key? key}) : super(key: key);

  @override
  State<Interest> createState() => _InterestState();
}

class _InterestState extends State<Interest> {
//****************************************************************


  
  
  void showCustomErrorSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Container(
          padding: EdgeInsets.symmetric(vertical: 12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.error_outline, color: Colors.white),
              SizedBox(width: 8.0),
              Text(message, style: TextStyle(color: Colors.white)),
            ],
          ),
        ),
        backgroundColor: Colors.pink, // Set pink background color
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        margin: EdgeInsets.all(0.0), // Use zero margin for custom position
        padding: EdgeInsets.all(0.0), // Use zero padding for custom position
      ),
    );
  }


//***********************************************************************

  final SeekersAllInterstsControllerInstanse=Get.put(SeekersAllInterstsController());


  @override
  void initState() {
    SeekersAllInterstsControllerInstanse.SeekersAllInterestsApi();
  
    setState(() {
        selectedInterests=[];
    });
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Interests",
          style: Theme.of(context).textTheme.displayLarge,
        ),
        centerTitle: true,
      ),
      body:  Obx(() {
          switch (SeekersAllInterstsControllerInstanse.rxRequestStatus.value) {
            case Status.LOADING:
              return const Center(child: CircularProgressIndicator());
            case Status.ERROR:
              if (SeekersAllInterstsControllerInstanse.error.value == 'No internet') {
                return InterNetExceptionWidget(
                  onPress: () {},
                );
              } else {
                return Container();}
                 case Status.COMPLETED:
              return 
              
      Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Your interests",
              style: Theme.of(context).textTheme.displayLarge,
            ),
            SizedBox(
              height: height * .02,
            ),
            Text(
              "Select a few of your interests and let everyone\nknow what you\'re passionate about.",
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: Colors.grey),
            ),
            SizedBox(
              height: height * .02,
            ),
            Expanded(
              child: GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: SeekersAllInterstsControllerInstanse.SeekersAllIntersestsList.value.interests!.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10),
                itemBuilder: (context, index) {
                  return InkWell(
                    child: Container(
                      height: height * .1,
                      width: width * .5,
                      decoration: BoxDecoration(
                        color: SeekersAllInterstsControllerInstanse.SeekersAllIntersestsList.value.interests![index].isselected==true? Colors.pink:Colors.transparent,
                          border: Border.all(color: SeekersAllInterstsControllerInstanse.SeekersAllIntersestsList.value.interests![index].isselected==true?Colors.white:Colors.grey),
                          borderRadius: BorderRadius.circular(30)),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                           if(SeekersAllInterstsControllerInstanse.SeekersAllIntersestsList.value.interests![index].isselected==false) Image.network(SeekersAllInterstsControllerInstanse.SeekersAllIntersestsList.value.interests![index].unselectedIconPath.toString(),color:  Colors.pink),
                           if(SeekersAllInterstsControllerInstanse.SeekersAllIntersestsList.value.interests![index].isselected==true)Image.network(SeekersAllInterstsControllerInstanse.SeekersAllIntersestsList.value.interests![index].selectedIconPath.toString()),
                            SizedBox(width: width * .02),
                            Text(
                              SeekersAllInterstsControllerInstanse.SeekersAllIntersestsList.value.interests![index].title.toString(),
                              style: TextStyle(color:SeekersAllInterstsControllerInstanse.SeekersAllIntersestsList.value.interests![index].isselected==true?Colors.white: Colors.pink)
                            )
                          ],
                        ),
                      ),
                    ),
//                     onTap: () {
//                        if(interests.contains(SeekersAllInterstsControllerInstanse.SeekersAllIntersestsList.value.interests![index].id.toString())){
//                            interests.remove(SeekersAllInterstsControllerInstanse.SeekersAllIntersestsList.value.interests![index].id.toString());
//                              listAsString = interests.join(',');
//
//                       }else{
// interests.add(SeekersAllInterstsControllerInstanse.SeekersAllIntersestsList.value.interests![index].id.toString());
//   listAsString = interests.join(',');
//
//                       }
//                       // if(!interests.contains(SeekersAllInterstsControllerInstanse.SeekersAllIntersestsList.value.interests![index].title.toString())){
//
//                       // }
//
//                       SeekersAllInterstsControllerInstanse.SeekersAllIntersestsList.value.interests![index].isselected=!SeekersAllInterstsControllerInstanse.SeekersAllIntersestsList.value.interests![index].isselected;
//                 setState(() {
//                   print(listAsString);
//                 });
//                     },
                    onTap: () {

                      if (selectedInterests.length >= 6 &&
                          !selectedInterests.contains(SeekersAllInterstsControllerInstanse.SeekersAllIntersestsList.value.interests![index].id.toString())) {
                        Utils.snackBar( "Message","You can only select up to 6 interests.");
                        return;
                      }

                      // Update selected interests list
                      setState(() {
                        final interestId = SeekersAllInterstsControllerInstanse.SeekersAllIntersestsList.value.interests![index].id.toString();
                        if (selectedInterests.contains(interestId)) {
                          selectedInterests.remove(interestId);
                        }

                        else {
                          selectedInterests.add(interestId);
                        }

                        SeekersAllInterstsControllerInstanse.SeekersAllIntersestsList.value.interests![index].isselected =
                        !SeekersAllInterstsControllerInstanse.SeekersAllIntersestsList.value.interests![index].isselected;
                      });
                    },
                  );
                },
              ),
            ),
            SizedBox(
              height: height * .02,
            ),
            Center(
              child: MyButton(
                title: "Continue",
                onTap: () {
                  if (selectedInterests.isEmpty) {
                    Utils.snackBar('Message', 'Minimum one interest mendatory');
                    return;
                  }
                  else{
                    Get.to(() => AddBio());
                  }
                  //Get.to(() => AddBio());
                },
              ),
            )
          ],
        ),
      );
      }
      }
      ),
    );
  }
}
