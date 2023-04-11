import 'package:flutter/material.dart';
import 'package:croshez/components/rounded_button.dart';
import 'package:croshez/constants.dart';
import 'package:croshez/modules/login/login.dart';
import 'package:croshez/modules/login/signup.dart';
import 'package:google_fonts/google_fonts.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            top: 0,
            child: Image.asset(
              "assets/images/welcome_bg.png",
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
            top: 0.2 * size.height,
            child: Image.asset(
              "assets/images/logo.png",
              fit: BoxFit.fill,
              height: 0.15 * size.height,
            ),
          ),
          Positioned(
              top: 0.42 * size.height,
              left: 0.2 * size.width,
              right: 0.2 * size.width,
              child: Text(
                "Hassle free food booking with regularly updating menu",
                style: GoogleFonts.urbanist(fontSize: 16),
                textAlign: TextAlign.center,
              )),
          Positioned(
            top: size.height * 0.6,
            child: RoundedButton(
              text: "LOGIN",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const LoginScreen();
                    },
                  ),
                );
              },
              color: kPrimaryColor,
            ),
          ),
          Positioned(
            top: size.height * 0.7,
            child: RoundedButton(
              text: "SIGNUP",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const SignUpScreen();
                    },
                  ),
                );
              },
              textColor: kPrimaryColor,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
