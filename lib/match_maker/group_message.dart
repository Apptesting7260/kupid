
import 'package:cupid_match/match_maker/chat_screen.dart';
import 'package:cupid_match/match_maker/premium.dart';
import 'package:cupid_match/match_maker/premium_seeker.dart';
import 'package:cupid_match/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class Message extends StatefulWidget {
  const Message({Key? key}) : super(key: key);

  @override
  State<Message> createState() => _MessageState();
}

class _MessageState extends State<Message> {
  List imagesList = [
    "https://images.unsplash.com/photo-1687076613219-fb4b3d94e75a?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxMzJ8fHxlbnwwfHx8fHw%3D&auto=format&fit=crop&w=500&q=60",
    "https://plus.unsplash.com/premium_photo-1686777550406-98c56a8bd590?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxNzZ8fHxlbnwwfHx8fHw%3D&auto=format&fit=crop&w=500&q=60"
  ];

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Get.back();
        },
            icon: Icon(Icons.arrow_back,color: Color(0xff5A5A5A),size: 27,)),
        title: Text("Message",style: Theme.of(context).textTheme.titleLarge,),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width*.04),
        child: ListView(
          children: [
            SizedBox(height: height*.03,),
            Text("Matches (5)",style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Color(0xff000000)),),
            Container(
              height: height*.1,
              child: ListView.builder(
                itemCount: 20,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                physics: AlwaysScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return CircleAvatar(
                    radius: 28,
                    backgroundColor: AppColors.white,
                    child: CircleAvatar(
                      radius: 26,
                      backgroundImage: NetworkImage("https://images.unsplash.com/photo-1687076613219-fb4b3d94e75a?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxMzJ8fHxlbnwwfHx8fHw%3D&auto=format&fit=crop&w=500&q=60"),
                    ),
                  );
                },),
            ),
            SizedBox(height: height*.01,),
            Text("Friends (10)",style: Theme.of(context).textTheme.bodyLarge,),
            SizedBox(height: height*.01,),
            ListView.builder(
              itemCount: 15,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Get.to(()=>ChatScreen());
                  },
                  child: ListTile(
                    leading: Container(
                      height: height*.06,
                      width: width*.09,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        reverse: true,
                        physics: AlwaysScrollableScrollPhysics(),
                        itemCount: imagesList.length >= 3 ? 3 : imagesList.length,
                        itemBuilder: (context, index) {
                          return Align(
                            alignment: Alignment.centerRight,
                            widthFactor: 0.4,
                            child: CircleAvatar(
                              radius: 18,
                              backgroundColor: AppColors.white,
                              child: CircleAvatar(
                                radius: 16,
                                backgroundImage: NetworkImage(imagesList[index]),
                              ),
                            ),
                          );
                        },),
                    ),
                    title: Text("Name, Name & Name",style: Theme.of(context).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600,fontSize: 14),),
                    subtitle: Text("Hey! How's it going?",style: Theme.of(context).textTheme.labelSmall?.copyWith(fontWeight: FontWeight.w300,color: Color(0xff777777)),),
                    trailing: Text("10:30PM",style: Theme.of(context).textTheme.labelSmall?.copyWith(fontWeight: FontWeight.w300,color: Color(0xff777777)),),
                  ),
                );
              },),
          ],
        ),
      ),
    );
  }
}
