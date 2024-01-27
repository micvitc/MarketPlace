import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vitmarketplace/modals/colors.dart';
import 'package:vitmarketplace/ui/lostfoundpage.dart';

import 'cartpage.dart';
import 'mainpage.dart';
import 'profile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.startingpage});

  final int startingpage;
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    setState(() {
      selectedpage = widget.startingpage;
    });
    super.initState();
  }

  final List<Widget> pages = [
    const MainPage(),
    const LostFound(),
    const Cart(),
    const Profile(),
  ];
  int selectedpage = 0;
  @override
  Widget build(BuildContext context) {
    final _pagecontroller = PageController(initialPage: selectedpage);
    Size size = MediaQuery.of(context).size;
    myColors mcol = myColors();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Stack(children: [
            SizedBox(
              width: size.width,
              height: size.height,
              child: PageView(
                physics: NeverScrollableScrollPhysics(),
                onPageChanged: (value) {
                  setState(() {
                    selectedpage = value;
                  });
                },
                controller: _pagecontroller,
                children: pages,
              ),
            ),
            Positioned(
                bottom: 0,
                child: SizedBox(
                  width: size.width,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Container(
                        height: 80,
                        color: mcol.lightblue,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedpage = 0;
                                    _pagecontroller.jumpToPage(0);
                                  });
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 60,
                                      height: 30,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: selectedpage == 0
                                              ? mcol.darkblueteal
                                              : mcol.lightblue),
                                      child: Padding(
                                        padding: const EdgeInsets.all(2.0),
                                        child: Image.asset(
                                          selectedpage == 0
                                              ? "assets/homefocused.png"
                                              : "assets/home.png",
                                          width: 30,
                                          height: 30,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      "Home",
                                      style: GoogleFonts.barlow(
                                          fontSize: 16,
                                          color: mcol.darkblueteal,
                                          fontWeight: selectedpage == 0
                                              ? FontWeight.bold
                                              : FontWeight.w500),
                                    )
                                  ],
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedpage = 1;
                                    _pagecontroller.jumpToPage(1);
                                  });
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 60,
                                      height: 30,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: selectedpage == 1
                                              ? mcol.darkblueteal
                                              : mcol.lightblue),
                                      child: Padding(
                                        padding: const EdgeInsets.all(2.0),
                                        child: Image.asset(
                                          selectedpage == 1
                                              ? "assets/lostfocused.png"
                                              : "assets/lost.png",
                                          width: 30,
                                          height: 30,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      "Lost & Found",
                                      style: GoogleFonts.barlow(
                                          fontSize: 16,
                                          color: mcol.darkblueteal,
                                          fontWeight: selectedpage == 1
                                              ? FontWeight.bold
                                              : FontWeight.w500),
                                    )
                                  ],
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedpage = 2;
                                    _pagecontroller.jumpToPage(2);
                                  });
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 60,
                                      height: 30,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: selectedpage == 2
                                              ? mcol.darkblueteal
                                              : mcol.lightblue),
                                      child: Padding(
                                        padding: const EdgeInsets.all(2.0),
                                        child: Image.asset(
                                          selectedpage == 2
                                              ? "assets/cartfocused.png"
                                              : "assets/cart.png",
                                          width: 30,
                                          height: 30,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      "Cart",
                                      style: GoogleFonts.barlow(
                                          fontSize: 16,
                                          color: mcol.darkblueteal,
                                          fontWeight: selectedpage == 2
                                              ? FontWeight.bold
                                              : FontWeight.w500),
                                    )
                                  ],
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedpage = 3;
                                    _pagecontroller.jumpToPage(3);
                                  });
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 60,
                                      height: 30,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: selectedpage == 3
                                              ? mcol.darkblueteal
                                              : mcol.lightblue),
                                      child: Padding(
                                        padding: const EdgeInsets.all(2.0),
                                        child: Image.asset(
                                          selectedpage == 3
                                              ? "assets/profilefocused.png"
                                              : "assets/profile.png",
                                          width: 30,
                                          height: 30,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      "Profile",
                                      style: GoogleFonts.barlow(
                                          fontSize: 16,
                                          color: mcol.darkblueteal,
                                          fontWeight: selectedpage == 3
                                              ? FontWeight.bold
                                              : FontWeight.w500),
                                    )
                                  ],
                                ),
                              ),
                            ]),
                      ),
                    ),
                  ),
                ))
          ]),
        ),
      ),
    );
  }
}
