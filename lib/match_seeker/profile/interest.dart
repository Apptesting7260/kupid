import 'package:cupid_match/controllers/controller/SeekersAllInterests_Controller/SeekersAllInterests_Controller.dart';
import 'package:cupid_match/match_seeker/profile/add_bio.dart';
import 'package:cupid_match/widgets/my_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Interest extends StatefulWidget {
  const Interest({Key? key}) : super(key: key);

  @override
  State<Interest> createState() => _InterestState();
}

class _InterestState extends State<Interest> {

  final SeekersAllInterstsControllerInstanse=Get.put(SeekersAllInterstsController());


  @override
  void initState() {
    SeekersAllInterstsControllerInstanse.SeekersAllInterestsApi();
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
      body: Padding(
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
                  return Container(
                    height: height * .1,
                    width: width * .5,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(30)),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset("assets/icons/camera (1).png"),
                          SizedBox(width: width * .02),
                          Text(
                            "Photography",
                            style: Theme.of(context).textTheme.bodySmall,
                          )
                        ],
                      ),
                    ),
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
                  Get.to(() => AddBio());
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
