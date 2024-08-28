import 'dart:developer';
import 'package:ecommerce/utilities/input_text_field.dart';
import 'package:ecommerce/utilities/text/greytextstyle.dart';
import 'package:ecommerce/utilities/widgets/sl_button.dart';
import 'package:ecommerce/view/authorization/signup_screen.dart';
import 'package:ecommerce/view/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;

    return SafeArea(
        child: Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: height * 0.06,
            ),
            Text(
              "Log In",
              style: blackTextStyle(28, weight: FontWeight.bold),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            InputTextField(
              label: "Email",
              hint: "Enter your Email",
              // icon: Icons.email,
              preIcon: Icons.email,
              widthField: width * 0.9,
              keyboardtype: TextInputType.emailAddress,
            ),
            InputTextField(
              label: "Password",
              hint: "Enter your Password",
              keyboardtype: TextInputType.visiblePassword,
              // icon: Icons.email,
              preIcon: Icons.key,
              widthField: width * 0.9,
            ),
            SizedBox(
              height: height * 0.04,
            ),
            SlButton(
              text: "Log In",
              onTap: () {
                
                log("login btn");
              },
              widthbtn: width * 0.9,
            ),
            SizedBox(
              height: height * 0.02,
            ),
            // google sign in
            InkWell(
              onTap: () {
                signInGoogle().then((value) {
                  if (value != null) {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return const HomeScreen();
                      },
                    ));
                    log("Google Sign-In Successful: ${value.user!.displayName}");
                  } else {
                    log("Google Sign-In Failed");
                  }
                });
              },
              child: Container(
                width: width * 0.4,
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  border: Border.all(
                    color: Colors.grey,
                    width: 2,
                  ),
                ),
                child: Row(
                  
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset('assets/icons/google_icon.svg', width: 25,),
                    const SizedBox(width: 10,),
                    const Text(
                      "Google Sign In",
                    ),
                  ],
                ),
              ),
            ),
            // sign up
            TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return const SignupScreen();
                    },
                  ));
                  log("Already btn");
                },
                child: Text(
                  "Create New Account, Sign Up",
                  style: blackTextStyle(18),
                )),
            const SizedBox(
                // height: height * 0.08,
                ),
          ],
        ),
      ),
    ));
  }
  Future<UserCredential?> signInGoogle() async {
    try {
      GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        // User canceled the sign-in process or some error occurred
        log("google user null");
        return null;
      }

      GoogleSignInAuthentication? googleAuth = await googleUser.authentication;

      final credentail = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      return await FirebaseAuth.instance.signInWithCredential(credentail);
    } catch (e) {
      log("Error during Google Sign-In: $e");
      // You might want to rethrow the error or handle it according to your needs.
      return null;
    }
    // return null;
  }






}
