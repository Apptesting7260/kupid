import 'package:cupid_match/controllers/controller/FetchSubcriptionController/FetchSubcriptionController.dart';
import 'package:cupid_match/data/response/status.dart';
import 'package:cupid_match/match_maker/create_plan_Monthly.dart';
import 'package:cupid_match/res/components/internet_exceptions_widget.dart';
import 'package:cupid_match/widgets/my_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../res/components/general_exception.dart';

class CreateMonthlySubcription extends StatefulWidget {
  const CreateMonthlySubcription({Key? key}) : super(key: key);

  @override
  State<CreateMonthlySubcription> createState() => _CreateMonthlySubcriptionState();
}

class _CreateMonthlySubcriptionState extends State<CreateMonthlySubcription> {
   final FetchSubcriptionControllerinstance=Get.put(FetchSubcriptionController());
  List<Map<String, String>> listItems = [
    {"count": "1", "price": "6"},
    {"count": "3", "price": "12"},
    {"count": "6", "price": "18"},
  ];

  final _NewValue = "";

  TextEditingController counterController = TextEditingController();
  TextEditingController priceController = TextEditingController();

@override
  void initState() {
    FetchSubcriptionControllerinstance.SubcriptionListApi();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(Icons.arrow_back, color: Color(0xff5A5A5A), size: 27)),
        title: Text("Subscriptions"),
        centerTitle: true,
        actions: [Padding(
          padding: const EdgeInsets.only(top: 20,right:20),
          child: Text("Skip",style: TextStyle(color:Colors.pink),),
        )],
      ),
      body: Obx(() {
          switch (FetchSubcriptionControllerinstance.rxRequestStatus.value) {
            case Status.LOADING:
              return const Center(child: CircularProgressIndicator());
            case Status.ERROR:
              if (FetchSubcriptionControllerinstance.error.value == 'No internet') {
                return InterNetExceptionWidget(
                  onPress: () {},
                );
              } else {
                return  SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                              height: height * .06,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: width * .02),
                              child: Text(
                  'Monthly Subscriptions',
                  style: Theme.of(context).textTheme.titleSmall,
                              ),
                            ),
                      Container(
                        height: Get.height*0.4,
                        child: Center(child: Text("Data is Empty",style: TextStyle(color:Colors.black),)),),
                      Center(
                        
                              child: MyButton(
                      width: width * .8,
                      title: '+ Create New Plan',
                      onTap: () {
                         Get.to(ApplyMonthlyPlan());
                      },
                              ),
                            ),
                    ],
                  ),
                );
              }
              
            case Status.COMPLETED:
              return Padding(
        padding: EdgeInsets.symmetric(horizontal: width * .02),
        child: ListView(
          children: [
            SizedBox(
              height: height * .06,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * .02),
              child: Text(
                'Monthly Subscriptions',
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
            Container(
              height: height * .4,
              child: ListView.builder(
                itemCount: FetchSubcriptionControllerinstance.SubcriptionList.value.SubscriptionDat!.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.all(12),
                    child: Container(
                      height: height * .07,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(35),
                          color: Color(0xffFFFFFF),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xffBABABA),
                              blurRadius: 2.0,
                              spreadRadius: .4,
                              offset: Offset(0.0, 0.0),
                            ),
                          ]),
                      child: ListTile(
                        title: RichText(
                            text: TextSpan(
                                text: FetchSubcriptionControllerinstance.SubcriptionList.value.SubscriptionDat![index].intervalCount.toString()+" "+FetchSubcriptionControllerinstance.SubcriptionList.value.SubscriptionDat![index].interval.toString(),
                                style: Theme.of(context).textTheme.titleSmall,
                                children: [
                              TextSpan(
                                  text: '  \$'+FetchSubcriptionControllerinstance.SubcriptionList.value.SubscriptionDat![index].amount.toString(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall
                                      ?.copyWith(color: Color(0xffFE008F))),
                            ])),
                        trailing: Wrap(
                          spacing: -10,
                          children: [
                           Transform.scale(
                        scale: 0.8,
                             child: CupertinoSwitch(
                              activeColor: Colors.pink,
                              thumbColor:FetchSubcriptionControllerinstance.SubcriptionList.value.SubscriptionDat![index].switchValue==true ?Colors.white: Colors.pink,
                                         value: FetchSubcriptionControllerinstance.SubcriptionList.value.SubscriptionDat![index].switchValue,
                                         onChanged: (value) {
                                           setState(() {
                                             FetchSubcriptionControllerinstance.SubcriptionList.value.SubscriptionDat![index].switchValue = value;
                                           });
                                         },
                                       ),
                           ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: height * .07,
            ),
            Center(
              child: MyButton(
                width: width * .8,
                title: '+ Create New Plan',
                onTap: () {
                     Get.to(ApplyMonthlyPlan());
                },
              ),
            ),
          ],
        ),
      );}}
    ));
  }
}
