import 'dart:developer';
import 'package:ecommerce/utilities/input_text_field.dart';
import 'package:ecommerce/utilities/text/greytextstyle.dart';
import 'package:ecommerce/utilities/widgets/sl_button.dart';
import 'package:ecommerce/view/authorization/login_screen.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

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
              height: height * 0.05,
            ),
            Text(
              "Sign Up",
              style: blackTextStyle(28, weight: FontWeight.bold),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            InputTextField(
              label: "Full Name",
              hint: "Enter your Full name",
              // icon: Icons.email,
              preIcon: Icons.man,
              widthField: width * 0.9,
              keyboardtype: TextInputType.name,
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
            InputTextField(
              label: "Phone Number",
              hint: "Enter your Number",
              keyboardtype: TextInputType.phone,
              // icon: Icons.email,
              preIcon: Icons.phone,
              widthField: width * 0.9,
            ),
            SizedBox(
              height: height * 0.04,
            ),
            SlButton(
              text: "Sign Up",
              onTap: () {
                log("Signup btn");
              },
              widthbtn: width * 0.9,
            ),
            TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ));
                  log("Already btn");
                },
                child: Text(
                  "Already hava a Account, Login",
                  style: blackTextStyle(18),
                )),
            SizedBox(
                // height: height * 0.08,
                ),
          ],
        ),
      ),
    ));
  }
}
