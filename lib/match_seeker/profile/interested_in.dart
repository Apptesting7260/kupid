
import 'package:cupid_match/GlobalVariable/GlobalVariable.dart';

import 'package:cupid_match/match_seeker/profile/interest.dart';
import 'package:cupid_match/widgets/my_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InterstedIn extends StatefulWidget {
  const InterstedIn({Key? key}) : super(key: key);

  @override
  State<InterstedIn> createState() => _InterstedInState();
}

class _InterstedInState extends State<InterstedIn> {



  String _value = "Woman";
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Interested In",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "I am Interested In",
              style: Theme.of(context).textTheme.displayLarge,
            ),
            SizedBox(
              height: height * .04,
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  _value = "Female";
                  IntrestedIn="Female";
                  print(IntrestedIn);
                });
              },
              child: Container(
                height: height * .075,
                width: width * 1,
                decoration: BoxDecoration(
                    color: _value != "Female" ? Colors.white :  Colors.pink,
                    border: _value != "Female"
                        ? Border.all(color: Colors.grey)
                        : Border.all(color: Colors.pink),
                    borderRadius: BorderRadius.circular(30)),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset(
                            "assets/icons/woman.png",
                            color: _value != "Female "
                                ? Colors.black
                                : Colors.white,
                          ),
                          SizedBox(width: width * .02),
                          Text(
                            "Female",
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(
                                    color: _value != "Female"
                                        ? Colors.black
                                        : Colors.white),
                          ),
                        ],
                      ),
                      Icon(
                        Icons.done,
                        size: 20,
                        color: _value != "Female" ? Colors.grey : Colors.white,
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: height * .03,
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  _value = "Male";
   IntrestedIn="Male";
                  print(IntrestedIn);
                });
              },
              child: Container(
                height: height * .075,
                width: width * 1,
                decoration: BoxDecoration(
                    color: _value != "Male" ? Colors.white :  Colors.pink,
                    border: _value != "Male"
                        ? Border.all(color: Colors.grey)
                        : Border.all(color: Colors.pink),
                    borderRadius: BorderRadius.circular(30)),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset(
                            "assets/icons/man.png",
                            color:
                                _value != "Male" ? Colors.black : Colors.white,
                          ),
                          SizedBox(width: width * .02),
                          Text(
                            "Male",
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(
                                    color: _value != "Male"
                                        ? Colors.black
                                        : Colors.white),
                          ),
                        ],
                      ),
                      Icon(
                        Icons.done,
                        size: 20,
                        color: _value != "Male" ? Colors.grey : Colors.white,
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: height * .03,
            ),
            GestureDetector(
              onTap: () {
               setState(() {
                 _value = "Both";
                   IntrestedIn="Both";
                  print(IntrestedIn);
               });
              },
              child: Container(
                height: height * .075,
                width: width * 1,
                decoration: BoxDecoration(
                    color: _value != "Both" ? Colors.white :  Colors.pink,
                    border: _value != "Both"
                        ? Border.all(color: Colors.grey)
                        : Border.all(color: Colors.pink),
                    borderRadius: BorderRadius.circular(30)),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset(
                            "assets/icons/both.png",
                            color:
                                _value != "Both" ? Colors.black : Colors.white,
                          ),
                          SizedBox(width: width * .02),
                          Text(
                            "Both",
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(
                                    color: _value != "Both"
                                        ? Colors.black
                                        : Colors.white),
                          ),
                        ],
                      ),
                      Icon(
                        Icons.done,
                        size: 20,
                        color: _value != "Both" ? Colors.grey : Colors.white,
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: height * .03,
            ),
            Center(
              child: MyButton(
                title: "Continue",
                onTap: () {
                  Get.to(() => Interest());
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
