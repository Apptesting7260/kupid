import 'package:cupid_match/match_maker/Tab_view.dart';
import 'package:cupid_match/match_maker/home_screen_maker.dart';
import 'package:cupid_match/match_seeker/home_screen.dart';
import 'package:cupid_match/match_seeker/tab_screen.dart';
import 'package:cupid_match/views/sign_up/choose_profile.dart';
import 'package:cupid_match/views/sign_up/signup_screen.dart';
import 'package:cupid_match/views/user/forgot_password.dart';
import 'package:cupid_match/widgets/my_button.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailmobilecontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();
  @override
  void initState() {
    _passwordVisible = false;
    // TODO: implement initState
    super.initState();
  }

  bool isValid = true;
  bool _passwordVisible = true;
  bool isEmail(String input) => EmailValidator.validate(input);

  bool isPhone(String input) =>
      RegExp(r'^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$')
          .hasMatch(input);
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Text(
                "Login",
                style: Theme.of(context).textTheme.headline1,
              ),
              SizedBox(
                height: height * .01,
              ),
              Text(
                "Welcome Back!",
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: Colors.grey),
              ),
              SizedBox(height: height * .04),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: emailmobilecontroller,
                validator: (value) {
                  if (!isEmail(value!) && !isPhone(value!)) {
                    return 'Please enter a valid email or phone number.';
                  }
                  return null;
                },
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(35.0)),
                        borderSide: BorderSide(color: Color(0xffBABABA))),
                    hintStyle:
                        TextStyle(fontSize: 16, color: Color(0xffBABABA)),
                    contentPadding: EdgeInsets.all(18),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(35.0)),
                        borderSide: BorderSide(color: Color(0xffBABABA))),
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(35.0)),
                        borderSide: BorderSide(color: Color(0xffBABABA))),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(35.0)),
                      borderSide: BorderSide(color: Color(0xffBABABA)),
                    ),
                    hintText: "Enter email/Mobile no.",
                    filled: true,
                    fillColor: Colors.white),
              ),
              SizedBox(height: height * .03),
              TextFormField(
                obscureText: !_passwordVisible,
                keyboardType: TextInputType.emailAddress,
                controller: passwordcontroller,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please Enter Password";
                  } else {
                    return null;
                  }
                },
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(35.0)),
                        borderSide: BorderSide(color: Color(0xffBABABA))),
                    hintStyle:
                        TextStyle(fontSize: 16, color: Color(0xffBABABA)),
                    contentPadding: EdgeInsets.all(18),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(35.0)),
                      borderSide: BorderSide(color: Color(0xffBABABA)),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(35.0)),
                      borderSide: BorderSide(color: Color(0xffBABABA)),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(35.0)),
                      borderSide: BorderSide(color: Color(0xffBABABA)),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(35.0)),
                      borderSide: BorderSide(color: Color(0xffBABABA)),
                    ),
                    hintText: "Enter your password",
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _passwordVisible = !_passwordVisible;
                          });
                        },
                        icon: Icon(
                          _passwordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                        )),
                    filled: true,
                    fillColor: Colors.white),
              ),
              SizedBox(height: height * .01),
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {
                    Get.to(() => ForgotPassword());
                  },
                  child: Text(
                    "Forgot Password?",
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(color: Color(0xff000CAA)),
                  ),
                ),
              ),
              SizedBox(height: height * .03),
              Center(
                child: MyButton(
                  title: "Login",
                  onTap: () {
                    checkvalidate();
                  },
                ),
              ),
              SizedBox(height: height * .02),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Divider(
                      height: 100,
                      indent: 5.0,
                      endIndent: 10.0,
                      thickness: 1,
                    ),
                  ),
                  Text(
                    'Or login up With',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  Expanded(
                      child: Divider(
                    indent: 5.0,
                    endIndent: 10.0,
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
              SizedBox(height: height * .18),
              Center(
                child: GestureDetector(
                  onTap: () {
                    Get.to(() => SignUp());
                  },
                  child: RichText(
                    text: const TextSpan(
                        text: "Don\'t have an account yet?",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                            color: Colors.grey),
                        children: [
                          TextSpan(
                              text: " Sign Up",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                  color: Color(0xffFE0091))),
                        ]),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  checkvalidate() {
    print("send");
    if (!_formKey.currentState!.validate()) {
      return;
    } else {
      Get.to(() => TabView(index: 0,));
    }
  }
}