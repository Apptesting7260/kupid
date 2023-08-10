import 'package:cupid_match/widgets/my_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/controller/SetRoleController/SetRoleController.dart';

class ChooseProfile extends StatefulWidget {
  const ChooseProfile({Key? key}) : super(key: key);

  @override
  State<ChooseProfile> createState() => _ChooseProfileState();
}

class _ChooseProfileState extends State<ChooseProfile> {
  int _value = 1;

  final SetRoleControllerInstanse =Get.put(SetRoleController());

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Choose your profile",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            SizedBox(
              height: height * .02,
            ),
            Container(
              height: height * .075,
              width: width * 1,
              decoration: BoxDecoration(
                  border: _value != 1
                      ? Border.all(color: Colors.grey)
                      : Border.all(color: Color(0xffFE0091)),
                  borderRadius: BorderRadius.circular(35)),
              child: RadioListTile(
                  title: GestureDetector(
                    onTap: () {
                      // Get.to(() => ProfileOneScreen());
                    },
                    child: Text(
                      "Match Maker",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: Colors.black),
                    ),
                  ),
                  value: 1,
                  groupValue: _value,
                  onChanged: (val) {
                    setState(() {
                      _value = val!;
                      ProfileType=val;
                    });
                  },
                  activeColor: Color(0xffFE0091)),
            ),
            SizedBox(
              height: height * .02,
            ),
            Container(
              height: height * .075,
              width: width * 1,
              decoration: BoxDecoration(
                  border: _value != 2
                      ? Border.all(color: Colors.grey)
                      : Border.all(color: Color(0xffFE0091)),
                  borderRadius: BorderRadius.circular(35)),
              child: RadioListTile(
                  title: Text(
                    "Match Seeker",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: Colors.black),
                  ),
                  value: 2,
                  groupValue: _value,
                  onChanged: (val) {
                    setState(() {
                      _value = val!;
                      ProfileType=val;
                    });
                  },
                  activeColor: Color(0xffFE0091)),
            ),
            SizedBox(
              height: height * .02,
            ),
            
            Obx(
              () =>Center(
                child: MyButton(loading: SetRoleControllerInstanse.loading.value,
                  title: "Next",
                  onTap: () {
                    setState(() {
                      ProfileType=_value;
                    });
                    SetRoleControllerInstanse.SetRoleapiiHit();
            
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
