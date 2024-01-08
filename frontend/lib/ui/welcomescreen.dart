import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vitmarketplace/ui/signinscreens.dart';

import '../modals/colors.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    myColors mcol = myColors();
    return SafeArea(
      child: Scaffold(
          body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Welcome to,",
                  style: GoogleFonts.montserrat(
                      fontSize: 20, fontWeight: FontWeight.w400),
                ),
                Text(
                  "VIT MarketPlace",
                  style: GoogleFonts.barlow(
                      fontSize: 38,
                      fontWeight: FontWeight.w700,
                      color: mcol.darkblueteal),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
              child: Center(
                child: Container(
                  width: size.width * 0.7,
                  height: size.height * 0.5,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      image: const DecorationImage(
                          image: AssetImage(
                            "assets/welcome.png",
                          ),
                          fit: BoxFit.fill),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.shade300,
                            blurRadius: 10,
                            offset: const Offset(2, 4))
                      ]),
                ),
              ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginScreen()));
                },
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        vertical: 16.0, horizontal: 46.0),
                    backgroundColor: mcol.orange,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
                child: Text(
                  "Get Started",
                  style: GoogleFonts.montserrat(
                      fontSize: 29,
                      fontWeight: FontWeight.w500,
                      color: mcol.white),
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
