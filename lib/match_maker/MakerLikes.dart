import 'package:cupid_match/match_maker/invite_state.dart';
import 'package:cupid_match/widgets/MakerDrawer.dart';
import 'package:cupid_match/widgets/my_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class MakerLikes extends StatefulWidget {
  const MakerLikes({Key? key}) : super(key: key);

  @override
  State<MakerLikes> createState() => _MakerLikesState();
}

class _MakerLikesState extends State<MakerLikes> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
  
        title: Text("Likes",style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),),
        centerTitle: true,
actions: [
            Builder(
              builder: (context) {
                return GestureDetector(
                    onTap: () {
                      Scaffold.of(context).openEndDrawer();
                      MaterialLocalizations.of(context).openAppDrawerTooltip;
                    },
                    child: Image.asset("assets/icons/menu.png"));
              },
            )
          ],
        
      ),
      endDrawer: Drawer(
          child: MakerDrawer()
        ),
      body: ListView(
        children: [
          SizedBox(height: height*.02,),
          ListView.builder(
            itemCount: 15,
            scrollDirection: Axis.vertical,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return ListTile(
                visualDensity: VisualDensity(vertical: -3,horizontal: -2),
                leading: CircleAvatar(
                  radius: 16,
                  child: CircleAvatar(
                    radius: 18,
                    backgroundImage: NetworkImage('https://images.unsplash.com/photo-1534528741775-53994a69daeb?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjB8fHByb2ZpbGV8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=500&q=60'),
                  ),
                ),
                title: Text("Valentina, 20",style: Theme.of(context).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w600),),
                subtitle: Text("India",style: Theme.of(context).textTheme.labelSmall?.copyWith(fontWeight: FontWeight.w300,color: Color(0xff777777)),),
                trailing: MyButton(
                  width: width*.4,
                  title: 'View Profile', onTap: () {
                  // Get.to(()=> Videos());
                  Get.to(()=> Invite());
                },),
              );
            },)
        ],
      ),
    );
  }
}
