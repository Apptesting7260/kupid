import 'package:cupid_match/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileTwoScreen extends StatefulWidget {
  const ProfileTwoScreen({Key? key}) : super(key: key);

  @override
  State<ProfileTwoScreen> createState() => _ProfileTwoScreenState();
}

class _ProfileTwoScreenState extends State<ProfileTwoScreen> {
  var ListItem = [
    {"Name": "Matches Made","Age": "26","Image": "assets/maker/img_2.png"},
    {"Name": "Matches Sucessfull","Age": "26","Image": "assets/maker/img_3.png"},
    {"Name": "Matches Declined","Age": "26","Image": "assets/maker/img_4.png"},
    {"Name": "Matches Completed","Age": "26","Image": "assets/maker/img_5.png"},
    {"Name": "Maker Experience:","Age": "26","Image": "assets/maker/img_6.png"},
    {"Name": "Liked Profile","Age": "26","Image": "assets/maker/img_7.png"},
  ];
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(

          leading: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Icon(Icons.arrow_back,color: Color(0xff5A5A5A), size: 27,)),
          backgroundColor: Color(0xffF3F3F3),
          elevation: 0,
          title: Text(
            "Profile",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          centerTitle: true,
          actions: [
            Image(image: AssetImage("assets/icons/menu.png")),
          ],
        ),
        body: SingleChildScrollView(
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Column(
                // physics: NeverScrollableScrollPhysics(),
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: height * 0.1,
                    width: width,
                    color: Color(0xffF3F3F3),
                  ),
                  SizedBox( height: height *0.09,),
                  Align(
                      alignment: Alignment.center,
                      child: Text("Name,22",style: Theme.of(context).textTheme.displayMedium,)),
                  SizedBox(height: height * 0.01,),
                  Align(
                      alignment: Alignment.center,
                      child: Text("Address",style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Color(0xff777777)))),
                  SizedBox(height: height * 0.01,),
                  Align(
                      alignment: Alignment.center,
                      child: Text("Gender",style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Color(0xff777777)))),
                  SizedBox(height: height * 0.1,),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                    child: Text(
                      "Email",
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ),
                  Padding(padding: EdgeInsets.symmetric(horizontal: width  *0.04,vertical: height * 0.02),
                    child:  Text(
                      "mailto:user123456@gmail.com",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppColors.subtitletextcolor),
                    ),
                  ),
                  SizedBox(height: height * 0.02,),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.04,),
                    child: Text(
                      "Phone Number",
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width  *0.04,vertical: height * 0.02),
                    child: Text(
                      "+123456789",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppColors.subtitletextcolor),
                    ),
                  ),
                  SizedBox(height: height * 0.02,),
                  Align(
                      alignment: Alignment.center,
                      child: Image.asset("assets/images/vedio.png",height: height*.2,)),
                  SizedBox(height: height*.02,),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: width * 0.04),
                    child: GridView.builder(
                        scrollDirection: Axis.vertical,
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: ListItem.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          mainAxisSpacing: 4,
                          crossAxisSpacing: 4,
                        ),
                        itemBuilder: (BuildContext, index){
                          return Card(
                            elevation: 2,
                            shadowColor: Color(0xff0000001),
                            color: Color(0xffF3F3F3),
                            child: Column(
                              children: [
                                CircleAvatar(
                                  backgroundColor:Color(0xff0000001A),
                                  radius: 17,
                                  child: CircleAvatar(
                                    backgroundImage: AssetImage(ListItem[index]['Image'] ??'assets/maker/img_2.png'),
                                    //backgroundImage: NetworkImage(ListItem[index]['Image'] ??"https://images.unsplash.com/photo-1685118148066-da2c5c61e291?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw1fHx8ZW58MHx8fHx8&auto=format&fit=crop&w=500&q=60"),
                                    radius: 23,
                                  ),
                                ),
                                SizedBox(height: height * 0.01,),
                                Text(ListItem[index]['Name'] ??"Name",style: Theme.of(context).textTheme.labelSmall?.copyWith(color: Color(0xff777777),fontSize: 4),),
                                Text(ListItem[index]['Age'] ??"Age",style: Theme.of(context).textTheme.titleLarge,),
                              ],
                            ),
                          );
                        }),
                  ),
                  SizedBox(height: height * 0.04,),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                    child: Text(
                      "About the Match Maker",
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width  *0.04,vertical: height * 0.01),
                    child: Text(
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: AppColors.subtitletextcolor),
                    ),
                  ),
                  SizedBox(height: height * 0.04,),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                    child: Text(
                      "What do you expect from your match seekers",
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width  *0.04,vertical: height * 0.01),
                    child: Text(
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: AppColors.subtitletextcolor,
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.04,),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                    child: Text(
                      "Match Maker Heading that they want everyone to see:",
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: width  *0.04,vertical: height  *0.01),
                    child: Text(
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppColors.subtitletextcolor),
                    ),
                  ),
                  SizedBox(height: height * 0.1,),
                ],
              ),
              Positioned(
                left: 135,
                top:  height * 0.03,
                child: Container(
                  height: height * 0.14,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: CircleAvatar(
                    radius: 50,
                    child: CircleAvatar(
                      radius: 60,
                      backgroundImage: NetworkImage('https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=870&q=80'),
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
    );
  }
}


