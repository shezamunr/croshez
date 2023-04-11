import 'package:croshez/constants.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:croshez/components/rounded_button.dart';
import 'package:croshez/modules/login/signup.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                "assets/images/login_top.png",
              )),
          Positioned(
            top: 0.05 * size.height,
            child: Image.asset(
              "assets/images/logo.png",
              // fit: BoxFit.fil,
              height: 0.2 * size.height,
            ),
          ),
          Positioned(
            top: size.height * 0.35,
            child: Text("WELCOME BACK!",
                style: GoogleFonts.urbanist(
                    textStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: kPrimaryColor,
                        fontSize: 20))),
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
              text: "LOGIN",
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
                          builder: (context) => const SignUpScreen()));
                },
                child: Text(
                  "New to WeEat? Create Account",
                  style: GoogleFonts.urbanist(color: kPrimaryColor),
                )),
          )
        ]),
      ),
    );
  }
}
