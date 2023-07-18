import 'package:cupid_match/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class RecentMatches extends StatefulWidget {
  const RecentMatches({Key? key}) : super(key: key);

  @override
  State<RecentMatches> createState() => _RecentMatchesState();
}

class _RecentMatchesState extends State<RecentMatches> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Recent Matches",
            style: Theme.of(context).textTheme.titleSmall,
          ),
          centerTitle: true,
        ),
        body: Padding(padding: EdgeInsets.symmetric(horizontal: width*0.04),
          child: SingleChildScrollView(
            child: Column(
              children: [
                GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,mainAxisSpacing: 10,childAspectRatio: .50),
                  scrollDirection: Axis.vertical,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Container(
                      width: width *.45,
                      child: Padding(
                        padding:  EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                Container(
                                  height: height * 0.32,
                                  width: width * 0.43,
                                  decoration: BoxDecoration(
                                      color: AppColors.ratingcodeColor,
                                      borderRadius:
                                      BorderRadius.circular(18)),
                                ),
                                Transform.rotate(
                                  angle: (math.pi / 390) * 11,
                                  origin: Offset(-190.0, 760.0),
                                  child: Container(
                                    height: height * .2,
                                    width: width * .2,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(22),
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              'https://images.unsplash.com/photo-1685464670063-2cbac395fc24?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw5M3x8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=500&q=60'),
                                          fit: BoxFit.cover),
                                    ),
                                  ),
                                ),
                                Transform.rotate(
                                  angle: (math.pi / 850) * -40,
                                  origin: Offset(520.0, -80.0),
                                  child: Container(
                                    height: height * .2,
                                    width: width * .2,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              'https://plus.unsplash.com/premium_photo-1664547606960-008623079291?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw3fHx8ZW58MHx8fHx8&auto=format&fit=crop&w=500&q=60'),
                                          fit: BoxFit.cover),
                                      borderRadius: BorderRadius.circular(22),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 10,
                                  left: 10,
                                  child: CircleAvatar(
                                    radius: 20,
                                    child: CircleAvatar(
                                      radius: 50,
                                      backgroundColor: AppColors.white,
                                      child: Icon(Icons.heart_broken),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 60,
                                  top: 6,
                                  child: CircleAvatar(
                                    radius: 20,
                                    child: CircleAvatar(
                                      radius: 50,
                                      backgroundColor: AppColors.white,
                                      child: Icon(Icons.heart_broken),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: height*.01,),
                            Text(
                              "It’s a match, Jake!",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall
                                  ?.copyWith(color: AppColors.red),maxLines: 1,
                            ),
                            SizedBox(height: height*.01,),
                            Text(
                              "Start a conversation now with each other",
                              style: Theme.of(context).textTheme.labelSmall,

                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ));
  }
}
