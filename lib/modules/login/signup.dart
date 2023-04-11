import 'package:croshez/modules/login/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:croshez/constants.dart';
import 'package:croshez/components/rounded_button.dart';
import 'package:croshez/modules/login/signup.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: size.height,
        child: Stack(alignment: Alignment.center, children: <Widget>[
          Positioned(
              top: 0,
              child: Image.asset(
                "assets/images/signup_top.png",
              )),
          Positioned(
            top: 0.05 * size.height,
            left: 0.075 * size.height,
            child: Image.asset(
              "assets/images/logo.png",
              // fit: BoxFit.fil,
              height: 0.1 * size.height,
            ),
          ),
          Positioned(
            top: size.height * 0.25,
            child: Text("CREATE ACCOUNT",
                style: GoogleFonts.urbanist(
                    textStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: kPrimaryColor,
                        fontSize: 20))),
          ),
          Positioned(
            // top: 0.3 * size.height,
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 0, bottom: 150),
              // padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    prefixIcon: const Icon(
                      Icons.person,
                      color: kPrimaryColor,
                    ),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.5),
                    labelText: 'Full Name',
                    hintText: 'Enter full name'),
              ),
            ),
          ),
          Padding(
            //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: TextField(
              decoration: InputDecoration(
                  hoverColor: kPrimaryColor,
                  focusColor: kPrimaryColor,
                  border: const OutlineInputBorder(),
                  prefixIcon: const Icon(
                    Icons.email,
                    color: kPrimaryColor,
                  ),
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.5),
                  labelText: 'Email',
                  hintText: 'Enter valid email id as abc@gmail.com'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 15.0, right: 15.0, top: 150, bottom: 0),
            //padding: EdgeInsets.symmetric(horizontal: 15),
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  prefixIcon: const Icon(
                    Icons.password,
                    color: kPrimaryColor,
                  ),
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.5),
                  labelText: 'Password',
                  hintText: 'Enter secure password'),
            ),
          ),
          Positioned(
            top: size.height * 0.7,
            child: RoundedButton(
              text: "CREATE ACCOUNT",
              press: () {},
              color: kPrimaryColor,
            ),
          ),
          Positioned(
            bottom: 40,
            child: TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginScreen()));
                },
                child: Text(
                  "Already have an account? Log in.",
                  style: GoogleFonts.urbanist(color: kPrimaryColor),
                )),
          )
        ]),
      ),
    );
  }
}
