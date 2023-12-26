import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
                      onPressed: () {},
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
                    onPressed: () {
                      print(emailcontroller.text + " " + pwdcontroller.text);
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomeScreen(
                                    startingpage: 0,
                                  )));
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
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(top: size.height * 0.1),
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
                    onPressed: () {
                      print(emailcontroller.text + " " + pwdcontroller.text);
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
                padding: EdgeInsets.only(top: size.height * 0.1),
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
