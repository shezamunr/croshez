import 'package:croshez/constants.dart';
import 'package:flutter/material.dart';
import 'package:croshez/components/rounded_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:pinput/pinput.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:croshez/modules/home/admin_homescreen.dart';
import 'package:croshez/modules/home/user_homescreen.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class OTPScreen extends StatefulWidget {
  final String phone;
  OTPScreen(this.phone);
  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
  late String _verificationCode;

  final TextEditingController _pinPutController = TextEditingController();
  final defaultPinTheme = PinTheme(
    width: 56,
    height: 56,
    textStyle: const TextStyle(
        fontSize: 20,
        color: Color.fromRGBO(30, 60, 87, 1),
        fontWeight: FontWeight.w600),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.black),
      borderRadius: BorderRadius.circular(20),
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Container(
          margin: EdgeInsets.only(top: 80),
          child: Center(
              child: Text("Verify +92-${widget.phone}",
                  style: GoogleFonts.urbanist(
                      textStyle: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: kPrimaryColor,
                          fontSize: 20)))),
        ),
        Padding(
          padding: const EdgeInsets.all(30),
          child: Pinput(
            length: 6,
            defaultPinTheme: defaultPinTheme,
            controller: _pinPutController,
            pinAnimationType: PinAnimationType.fade,
            onSubmitted: (pin) async {
              try {
                print("first step");
                // if statement over here
                // if user is not in db
                // final role = "user"; // by default

                await FirebaseAuth.instance
                    .signInWithCredential(PhoneAuthProvider.credential(
                        verificationId: await _verificationCode, smsCode: pin))
                    .then((value) async {
                  final _val = value.user;
                  if (_val != null) {
                    final role_assign = await UserHelper.saveUser(_val);
                    print("role_assign $role_assign");
                    if (role_assign == 0) {
                      // new user
                      print("new user!");
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const UserHome()),
                          (route) => false);
                    } else {
                      // old user
                      final role_old = await UserHelper.getRole(_val);
                      print("assigned: ${role_old}");
                      if (role_old == "user") {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const UserHome()),
                            (route) => false);
                      } else {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const AdminHome()),
                            (route) => false);
                      }
                    }
                  }
                  // if (_val != null) {
                  //   print("passed, open home ${_val}");

                  //   Navigator.pushAndRemoveUntil(
                  //       context,
                  //       MaterialPageRoute(builder: (context) => const Home()),
                  //       (route) => false);
                  // }
                });
              } catch (e) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(e.toString())));
              }
            },
          ),
        )
      ]),
    );
  }

  _verifyPhone() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '+92${widget.phone}',
      verificationCompleted: (PhoneAuthCredential credential) async {
        await FirebaseAuth.instance
            .signInWithCredential(credential)
            .then((value) async {
          print('here1');
          final _val = value.user;
          if (_val != null) {
            print("logged in, ${_val}");

            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => UserHome()),
                (route) => false);
          }
        });
      },
      verificationFailed: (FirebaseAuthException e) {
        // if number is not in database -> signup and put it in database
        print("error msg ${e.message}");
      },
      codeSent: (String verificationID, int? resendToken) {
        setState(() async {
          _verificationCode = await verificationID;
        });
      },
      codeAutoRetrievalTimeout: (String verificationID) {
        setState(() async {
          _verificationCode = await verificationID;
        });
      },
      timeout: Duration(seconds: 60),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _verifyPhone();
  }
}

class UserHelper {
  static FirebaseFirestore _db = FirebaseFirestore.instance;

  static saveUser(User user) async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();

    Map<String, dynamic> userData = {
      "phone": user.phoneNumber,
      "role": "user",
    };

    // await _db.collection("users").doc(user.uid).set(userData);
    final userRef = _db.collection("users").doc(user.uid);
    if ((await userRef.get()).exists) {
      print("user already exists");
      return 1; // error saving bec user already exists
    } else {
      await _db.collection("users").doc(user.uid).set(userData);
      return 0; // no error, user saved
    }
  }

  static getRole(User user) async {
    DocumentSnapshot userSnapshot =
        await _db.collection('users').doc(user.uid).get();
    if (userSnapshot.exists) {
      return userSnapshot.get('role');
    } else {
      throw Exception('User not found in database');
    }
  }
}
