import 'dart:convert';

import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:floating_snackbar/floating_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vitmarketplace/modals/modals.dart';
import 'package:vitmarketplace/services/apiFunctions.dart';
import 'package:vitmarketplace/ui/homescreen.dart';

import '../modals/colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailcontroller = TextEditingController();
  final pwdcontroller = TextEditingController();
  bool pwdvisible = false;
  apiCalls myapi = apiCalls();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    myColors mcol = myColors();
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SizedBox(
          width: size.width,
          height: size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(top: size.height * 0.1),
                child: Text(
                  "Login",
                  style: GoogleFonts.barlow(
                      fontSize: 40,
                      fontWeight: FontWeight.w700,
                      color: mcol.darkblueteal),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30.0),
                child: Container(
                  width: size.width * 0.9,
                  height: 70,
                  decoration: BoxDecoration(
                      color: mcol.lightblue,
                      borderRadius: BorderRadius.circular(15)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Center(
                      child: TextField(
                        controller: emailcontroller,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Email Address",
                            hintStyle: GoogleFonts.montserrat(
                                fontSize: 28, fontWeight: FontWeight.w400)),
                        style: GoogleFonts.montserrat(
                            fontSize: 28, fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                width: size.width * 0.9,
                height: 70,
                decoration: BoxDecoration(
                    color: mcol.lightblue,
                    borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: size.width * 0.65,
                        child: TextField(
                          obscureText: !pwdvisible,
                          controller: pwdcontroller,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Password",
                              hintStyle: GoogleFonts.montserrat(
                                  fontSize: 28, fontWeight: FontWeight.w400)),
                          style: GoogleFonts.montserrat(
                              fontSize: 28, fontWeight: FontWeight.w400),
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              pwdvisible = !pwdvisible;
                            });
                          },
                          icon: Icon(
                            pwdvisible
                                ? Icons.visibility_off
                                : Icons.visibility,
                            size: 30,
                            color: mcol.darkblueteal,
                          ))
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.05, vertical: 10),
                child: Row(
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ForgotPwdPage()));
                      },
                      child: Text(
                        "Forgot Password?",
                        style: GoogleFonts.montserrat(
                            fontSize: 20, color: mcol.darkblueteal),
                      ),
                    ),
                  ],
                ),
              ),
              Center(
                child: SizedBox(
                  width: size.width * 0.9,
                  height: 60,
                  child: ElevatedButton(
                    onPressed: () async {
                      print(emailcontroller.text + " " + pwdcontroller.text);
                      if (emailcontroller.text.isNotEmpty &&
                          pwdcontroller.text.isNotEmpty &&
                          EmailValidator.validate(emailcontroller.text)) {

                        await FirebaseAuth.instance
                            .signInWithEmailAndPassword(
                                email: emailcontroller.text,
                                password: pwdcontroller.text)
                            .then((value) async {
                          User? user = FirebaseAuth.instance.currentUser;
                          if (user!.emailVerified) {
                            String userID= user.uid!;
                            String userName = user.displayName!;
                            if(await myapi.userAvail(userID)==true){
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomeScreen(
                                        startingpage: 0,
                                      )));
                            }else{
                              UserClass currentUser = UserClass(userName: userName, userId: userID, emailId: emailcontroller.text);
                              String jsonData = jsonEncode(currentUser.toJson());
                              int statusCode = await myapi.addUser(jsonData);
                              if(statusCode==200){
                                Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomeScreen(
                                          startingpage: 0,
                                        )));
                              }else{
                                FloatingSnackBar(
                                    message: "An error has occured",
                                    context: context,
                                    textStyle: GoogleFonts.barlow(
                                      fontSize: 28,
                                    ));
                              }
                            }

                          } else {
                            FloatingSnackBar(
                                message: "Verify Your Email",
                                context: context,
                                textStyle: GoogleFonts.barlow(
                                  fontSize: 28,
                                ));
                            await FirebaseAuth.instance.currentUser!
                                .sendEmailVerification();
                            await FirebaseAuth.instance.signOut();
                          }
                        }).catchError((e) {
                          if (e.toString() ==
                              "[firebase_auth/invalid-credential] The supplied auth credential is incorrect, malformed or has expired.") {
                            FloatingSnackBar(
                                message: "Incorrect email/password",
                                context: context,
                                textStyle: GoogleFonts.barlow(
                                  fontSize: 28,
                                ));
                          }
                        });
                      } else {
                        FloatingSnackBar(
                            message: "Please fill all the details",
                            context: context,
                            textStyle: GoogleFonts.barlow(
                              fontSize: 28,
                            ));
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: mcol.orange,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                    child: Text(
                      "Login",
                      style: GoogleFonts.montserrat(
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                          color: mcol.white),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: size.height * 0.12, bottom: size.height * 0.05),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 4,
                      width: size.width * 0.3,
                      color: mcol.lightblue,
                    ),
                    Text(
                      "Or Login with",
                      style: GoogleFonts.barlow(
                          fontSize: 20, color: mcol.darkblueteal),
                    ),
                    Container(
                      height: 4,
                      width: size.width * 0.3,
                      color: mcol.lightblue,
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                        color: mcol.lightblue,
                        borderRadius: BorderRadius.circular(80)),
                    child: Center(
                        child: Image.asset(
                      "assets/applelogo.png",
                      width: 40,
                      height: 40,
                    )),
                  ),
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                        color: mcol.lightblue,
                        borderRadius: BorderRadius.circular(80)),
                    child: Center(
                        child: Image.asset(
                      "assets/googlelogo.png",
                      width: 40,
                      height: 40,
                    )),
                  ),
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                        color: mcol.lightblue,
                        borderRadius: BorderRadius.circular(80)),
                    child: Center(
                        child: Image.asset(
                      "assets/twitterlogo.png",
                      width: 40,
                      height: 40,
                    )),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: size.height * 0.1),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account?",
                      style: GoogleFonts.montserrat(
                          fontSize: 20,
                          color: mcol.darkblueteal,
                          fontWeight: FontWeight.w500),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignUpScreen()));
                        },
                        child: Text(
                          "Sign up",
                          style: GoogleFonts.montserrat(
                              fontSize: 20,
                              color: mcol.darkblueteal,
                              fontWeight: FontWeight.w700),
                        ))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final namecontroller = TextEditingController();
  final emailcontroller = TextEditingController();
  final pwdcontroller = TextEditingController();
  final cnfpwdcontroller = TextEditingController();
  bool pwdvisible = false;
  bool cnfvisible = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    myColors mcol = myColors();
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SizedBox(
          width: size.width,
          height: size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(top: size.height * 0.05),
                child: Text(
                  "SignUp",
                  style: GoogleFonts.barlow(
                      fontSize: 40,
                      fontWeight: FontWeight.w700,
                      color: mcol.darkblueteal),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30.0),
                child: Container(
                  width: size.width * 0.9,
                  height: 70,
                  decoration: BoxDecoration(
                      color: mcol.lightblue,
                      borderRadius: BorderRadius.circular(15)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Center(
                      child: TextField(
                        controller: namecontroller,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Username",
                            hintStyle: GoogleFonts.montserrat(
                                fontSize: 28, fontWeight: FontWeight.w400)),
                        style: GoogleFonts.montserrat(
                            fontSize: 28, fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 30.0),
                child: Container(
                  width: size.width * 0.9,
                  height: 70,
                  decoration: BoxDecoration(
                      color: mcol.lightblue,
                      borderRadius: BorderRadius.circular(15)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Center(
                      child: TextField(
                        controller: emailcontroller,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Email Address",
                            hintStyle: GoogleFonts.montserrat(
                                fontSize: 28, fontWeight: FontWeight.w400)),
                        style: GoogleFonts.montserrat(
                            fontSize: 28, fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                width: size.width * 0.9,
                height: 70,
                decoration: BoxDecoration(
                    color: mcol.lightblue,
                    borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: size.width * 0.65,
                        child: TextField(
                          obscureText: !pwdvisible,
                          controller: pwdcontroller,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Password",
                              hintStyle: GoogleFonts.montserrat(
                                  fontSize: 28, fontWeight: FontWeight.w400)),
                          style: GoogleFonts.montserrat(
                              fontSize: 28, fontWeight: FontWeight.w400),
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              pwdvisible = !pwdvisible;
                            });
                          },
                          icon: Icon(
                            pwdvisible
                                ? Icons.visibility_off
                                : Icons.visibility,
                            size: 30,
                            color: mcol.darkblueteal,
                          ))
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30.0),
                child: Container(
                  width: size.width * 0.9,
                  height: 70,
                  decoration: BoxDecoration(
                      color: mcol.lightblue,
                      borderRadius: BorderRadius.circular(15)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: size.width * 0.65,
                          child: TextField(
                            obscureText: !cnfvisible,
                            controller: cnfpwdcontroller,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Confirm Password",
                                hintStyle: GoogleFonts.montserrat(
                                    fontSize: 28, fontWeight: FontWeight.w400)),
                            style: GoogleFonts.montserrat(
                                fontSize: 28, fontWeight: FontWeight.w400),
                          ),
                        ),
                        IconButton(
                            onPressed: () {
                              setState(() {
                                cnfvisible = !cnfvisible;
                              });
                            },
                            icon: Icon(
                              cnfvisible
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              size: 30,
                              color: mcol.darkblueteal,
                            ))
                      ],
                    ),
                  ),
                ),
              ),
              Center(
                child: SizedBox(
                  width: size.width * 0.9,
                  height: 60,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (namecontroller.text.isNotEmpty &&
                          emailcontroller.text.isNotEmpty &&
                          pwdcontroller.text.isNotEmpty &&
                          pwdcontroller.text == cnfpwdcontroller.text &&
                          EmailValidator.validate(emailcontroller.text)) {

                        await FirebaseAuth.instance
                            .createUserWithEmailAndPassword(
                                email: emailcontroller.text,
                                password: pwdcontroller.text);
                        await FirebaseAuth.instance.currentUser!
                            .updateDisplayName(namecontroller.text);
                        await FirebaseAuth.instance.currentUser!
                            .sendEmailVerification();
                        await FirebaseAuth.instance.signOut().then((value) {
                          Navigator.pop(context);
                          FloatingSnackBar(
                              message:
                                  "User Registered.Please verify your email",
                              context: context,
                              textStyle: GoogleFonts.barlow(
                                fontSize: 18,
                              ));
                        });
                      } else {
                        FloatingSnackBar(
                            message: "Please fill all the details",
                            context: context,
                            textStyle: GoogleFonts.barlow(
                              fontSize: 28,
                            ));
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: mcol.orange,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                    child: Text(
                      "Sign Up",
                      style: GoogleFonts.montserrat(
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                          color: mcol.white),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 40, bottom: size.height * 0.05),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 4,
                      width: size.width * 0.3,
                      color: mcol.lightblue,
                    ),
                    Text(
                      "Or Login with",
                      style: GoogleFonts.barlow(
                          fontSize: 20, color: mcol.darkblueteal),
                    ),
                    Container(
                      height: 4,
                      width: size.width * 0.3,
                      color: mcol.lightblue,
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                        color: mcol.lightblue,
                        borderRadius: BorderRadius.circular(80)),
                    child: Center(
                        child: Image.asset(
                      "assets/applelogo.png",
                      width: 40,
                      height: 40,
                    )),
                  ),
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                        color: mcol.lightblue,
                        borderRadius: BorderRadius.circular(80)),
                    child: Center(
                        child: Image.asset(
                      "assets/googlelogo.png",
                      width: 40,
                      height: 40,
                    )),
                  ),
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                        color: mcol.lightblue,
                        borderRadius: BorderRadius.circular(80)),
                    child: Center(
                        child: Image.asset(
                      "assets/twitterlogo.png",
                      width: 40,
                      height: 40,
                    )),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: size.height * 0.05),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
                      style: GoogleFonts.montserrat(
                          fontSize: 20,
                          color: mcol.darkblueteal,
                          fontWeight: FontWeight.w500),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen()));
                        },
                        child: Text(
                          "Login Now",
                          style: GoogleFonts.montserrat(
                              fontSize: 20,
                              color: mcol.darkblueteal,
                              fontWeight: FontWeight.w700),
                        ))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ForgotPwdPage extends StatefulWidget {
  const ForgotPwdPage({super.key});

  @override
  State<ForgotPwdPage> createState() => _ForgotPwdPageState();
}

class _ForgotPwdPageState extends State<ForgotPwdPage> {
  final emailcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    myColors mcol = myColors();
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: size.height,
          width: size.width,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  child: Container(
                    width: size.width,
                    height: 70,
                    color: mcol.lightblue,
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Icon(
                                Icons.keyboard_arrow_left,
                                size: 40,
                              ),
                            ),
                          ),
                          Text(
                            "Forgot Password",
                            style: GoogleFonts.barlow(
                              fontSize: 29,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Container(
                            width: 50,
                          )
                        ]),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      Container(
                        width: size.width,
                        child: Center(
                          child: Text(
                            "If you need help resetting your password,we can help by sending you a link to reset it",
                            style: GoogleFonts.barlow(
                                color: mcol.darkblueteal, fontSize: 28),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 25.0),
                        child: Container(
                          width: size.width * 0.9,
                          height: 70,
                          decoration: BoxDecoration(
                              color: mcol.lightblue,
                              borderRadius: BorderRadius.circular(15)),
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 25.0),
                            child: Center(
                              child: TextField(
                                controller: emailcontroller,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Email Address",
                                    hintStyle: GoogleFonts.montserrat(
                                        fontSize: 28,
                                        fontWeight: FontWeight.w400)),
                                style: GoogleFonts.montserrat(
                                    fontSize: 28, fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 40),
                        child: SizedBox(
                          width: size.width * 0.4,
                          height: 60,
                          child: ElevatedButton(
                            onPressed: () {
                              emailcontroller.text.isNotEmpty
                                  ? FloatingSnackBar(
                                      message: "Email Sent",
                                      context: context,
                                      textStyle: GoogleFonts.barlow(
                                        fontSize: 24,
                                      ))
                                  : FloatingSnackBar(
                                      message: "Please enter a valid Email",
                                      context: context,
                                      textStyle: GoogleFonts.barlow(
                                        fontSize: 24,
                                      ));
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: mcol.orange,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20))),
                            child: Text(
                              "Send",
                              style: GoogleFonts.barlow(
                                  fontSize: 30, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}
