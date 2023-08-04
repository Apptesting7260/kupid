import 'package:cupid_match/views/sign_up/choose_profile.dart';
import 'package:cupid_match/widgets/my_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/controller/CreatePasswordController/CreatePasswordController.dart';

class CreatePassword extends StatefulWidget {
  const CreatePassword({Key? key}) : super(key: key);

  @override
  State<CreatePassword> createState() => _CreatePasswordState();
}

class _CreatePasswordState extends State<CreatePassword> {
  final CreatePasswordControllerInstance=Get.put(CreatePasswordController());
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  void initState() {
    _passwordVisible = false;
    _passwordVisiblee = false;
    // TODO: implement initState
    super.initState();
  }

  bool isValid = true;
  bool _passwordVisible = true;
  bool _passwordVisiblee = true;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Create Password",
                    style: Theme.of(context).textTheme.titleLarge),
                SizedBox(height: height * .02),
                Text("Please create a password",
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(color: Colors.grey)),
                SizedBox(height: height * .06),
                TextFormField(
                  obscureText: !_passwordVisible,
                  keyboardType: TextInputType.emailAddress,
                  controller: CreatePasswordControllerInstance.PasswordController.value,
                  validator: (value) {
                    RegExp regex =
                    RegExp( r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*(),.?":{}|<>])[A-Za-z\d!@#$%^&*(),.?":{}|<>]{8,}$',);
                    if (value!.isEmpty) {
                      return 'Please enter password';
                    } else {
                      if (!regex.hasMatch(value)) {
                        return 'Enter valid password';
                      } else {
                        return null;
                      }
                    }
                  },
                  // validator: (value) {
                  //   if (value!.isEmpty) {
                  //     return "Please Enter Password";
                  //   } else {
                  //     return null;
                  //   }
                  // },
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(35.0)),
                          borderSide: BorderSide(color: Colors.pinkAccent)),
                      hintStyle:
                          TextStyle(fontSize: 16, color: Color(0xffBABABA)),
                      contentPadding: EdgeInsets.all(18),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(35.0)),
                        borderSide: BorderSide(color: Color(0xffBABABA)),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(35.0)),
                        borderSide: BorderSide(color: Colors.red),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(35.0)),
                        borderSide: BorderSide(color: Color(0xffBABABA)),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(35.0)),
                        borderSide: BorderSide(color: Colors.pink),
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
                SizedBox(
                  height: height * .02,
                ),
                TextFormField(
                  obscureText: !_passwordVisiblee,
                  keyboardType: TextInputType.emailAddress,
                  controller: CreatePasswordControllerInstance.ConfirmPasswordController.value,
                  validator: (value) {
                    RegExp regex =
                    RegExp( r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*(),.?":{}|<>])[A-Za-z\d!@#$%^&*(),.?":{}|<>]{8,}$',);
                    if (value!.isEmpty) {
                      return 'Please enter password';
                    } else {
                      if (!regex.hasMatch(value)) {
                        return 'Enter valid password';
                      } else {
                        return null;
                      }
                    }
                  },
                  // validator: (value) {
                  //   if (value!.isEmpty) {
                  //     return "Please Enter Password";
                  //   } else if (value !=CreatePasswordControllerInstance.PasswordController.value .text) {
                  //     return "Not Matched";
                  //   } else {
                  //     return null;
                  //   }
                  // },
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(35.0)),
                          borderSide: BorderSide(color: Colors.pinkAccent)),
                      hintStyle:
                      TextStyle(fontSize: 16, color: Color(0xffBABABA)),
                      contentPadding: EdgeInsets.all(18),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(35.0)),
                        borderSide: BorderSide(color: Color(0xffBABABA)),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(35.0)),
                        borderSide: BorderSide(color: Colors.red),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(35.0)),
                        borderSide: BorderSide(color: Color(0xffBABABA)),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(35.0)),
                        borderSide: BorderSide(color: Colors.pink),
                      ),
                      hintText: "Enter your password",
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _passwordVisiblee = !_passwordVisiblee;
                            });
                          },
                          icon: Icon(
                            _passwordVisiblee
                                ? Icons.visibility
                                : Icons.visibility_off,
                          )),
                      filled: true,
                      fillColor: Colors.white),
                ),
                SizedBox(height: height * .02),
              Obx(() => Center(
                child: MyButton(loading: CreatePasswordControllerInstance.loading.value,
                  title: "Continue",
                  onTap: () {
                    validate();
                  },
                ),
              ))
              ],
            ),
          ),
        ),
      ),
    );
  }

  validate() {
    print("send");
    if (!_formKey.currentState!.validate()) {
      return;
    } else {
      CreatePasswordControllerInstance.CreatePasswordapiiHit();
    }
  }
}
