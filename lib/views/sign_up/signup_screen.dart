
import 'package:cupid_match/views/sign_up/sign_up.dart';
import 'package:cupid_match/views/user/login_Screen.dart';
import 'package:cupid_match/widgets/my_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
@override
  void initState() {

    
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
          //backgroundColor: Color(0xffCACACA),
          //elevation: 0,
      //     leading: GestureDetector(
      //   onTap: () {
      //     Get.back();
      //   },
      //   child: Icon(
      //     Icons.arrow_back,
      //     size: 25,
      //     color: Colors.black,
      //   ),
      // )
      ),
      body: ListView(
        children: [
          Image.asset('assets/images/signup.png'),
          Center(
            child: Text(
              'Sign Up',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ),
          SizedBox(
            height: height * .03,
          ),
          Center(
            child: MyButton(
              width: width*.78,
              height: height*.06,
              bgColor: Color(0xffFE0091),
              title: "Continue with Email/Phone",
              onTap: () {
                Get.to(() => Sign());
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Divider(
                  height: 100,
                  indent: 20.0,
                  endIndent: 10.0,
                  thickness: 1,
                ),
              ),
              Text(
                'Or Sign In With',
                style: Theme.of(context).textTheme.bodySmall,
                // style: GoogleFonts.inter(
                //   color: Color(0xff000000),
                //   fontSize: 12,
                //   fontWeight: FontWeight.w400,
                // ),
              ),
              Expanded(
                  child: Divider(
                indent: 10.0,
                endIndent: 20.0,
                thickness: 1,
              )),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                  backgroundColor: Colors.grey.shade200,
                  child: Image.asset("assets/icons/facebook.png")),
              SizedBox(
                width: width * .04,
              ),
              CircleAvatar(
                  backgroundColor: Colors.grey.shade200,
                  child: Image.asset("assets/icons/google(1).png")),
              SizedBox(
                width: width * .04,
              ),
              CircleAvatar(
                  backgroundColor: Colors.grey.shade200,
                  child: Image.asset("assets/icons/apple.png")),
            ],
          ),
          SizedBox(
            height: height * .16,
          ),
          Center(
            child: GestureDetector(
              onTap: () {
                Get.to(() => LoginScreen());
              },
              child: RichText(
                text: const TextSpan(
                    text: "Already have an account?",
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.normal,
                        color: Colors.grey),
                    children: [
                      TextSpan(
                          text: " Login",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                              color: Color(0xffFE0091)))
                    ]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
