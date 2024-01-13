import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vitmarketplace/modals/colors.dart';
import 'package:vitmarketplace/products.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final searchcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    myColors mcol = myColors();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: Container(
            height: 60,
            width: double.infinity,
            decoration: BoxDecoration(
              color: mcol.lightblue,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // settings icon
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset('assets/setting-2.png'),
                ),

                // title
                Center(
                  child: Text(
                    'My Account',
                    style: GoogleFonts.barlow(
                      fontSize: 29,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),

                // settings icon
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Image.asset('assets/notification.png'),
                ),
              ],
            ),
          ),
        ),
        // header

        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // user info (both blocks)
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    // block 1
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          // profile image
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              'assets/profile-circle.png',
                              width: 40,
                            ),
                          ),

                          // name info
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Name of User',
                                    style: GoogleFonts.montserrat(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    'Student/Faculty',
                                    style: GoogleFonts.montserrat(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xFF757575)),
                                  )
                                ],
                              ),
                            ),
                          ),

                          // sizedbox
                          Expanded(
                            child: SizedBox(
                              height: 50,
                              child: Container(
                                  // The SizedBox will take all the remaining width
                                  ),
                            ),
                          ),

                          // edit profile info
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset('assets/Edit.png'),
                          )
                        ],
                      ),
                    ),

                    // block 2
                    Container(
                      decoration: BoxDecoration(
                        color: mcol.lightblue,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              decoration: const BoxDecoration(
                                  border: Border(
                                      right: BorderSide(color: Colors.black))),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 36),
                                child: Column(
                                  children: [
                                    Text(
                                      '5',
                                      style: GoogleFonts.montserrat(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Text(
                                      'Favourites',
                                      style: GoogleFonts.montserrat(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 36),
                              child: Container(
                                child: Column(
                                  children: [
                                    Text(
                                      '5',
                                      style: GoogleFonts.montserrat(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Text(
                                      'Favourites',
                                      style: GoogleFonts.montserrat(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // OPTIONS
              Container(
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // My Orders
                    Container(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: 16),
                            child: Image.asset('assets/orders.png'),
                          ),
                          Text(
                            'My orders',
                            style: GoogleFonts.montserrat(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Expanded(child: Container()),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.chevron_right_rounded,
                              size: 30,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Change Password
                    Container(
                      decoration: const BoxDecoration(
                        border: Border(
                            top: BorderSide(
                          color: Color.fromARGB(255, 165, 165, 165),
                        )),
                      ),
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: 16),
                            child: Image.asset('assets/key.png'),
                          ),
                          Text(
                            'Change Password',
                            style: GoogleFonts.montserrat(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Expanded(child: Container()),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.chevron_right_rounded,
                              size: 30,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Payment Methods
                    Container(
                      decoration: BoxDecoration(
                        border: Border(
                          top: BorderSide(
                              color: Color.fromARGB(255, 165, 165, 165)),
                        ),
                      ),
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: 16),
                            child: Image.asset('assets/payment.png'),
                          ),
                          Text(
                            'Payment Methods',
                            style: GoogleFonts.montserrat(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Expanded(child: Container()),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.chevron_right_rounded,
                              size: 30,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Logout
                    Container(
                      decoration: BoxDecoration(
                        border: Border(
                            top: BorderSide(
                          color: Color.fromARGB(255, 165, 165, 165),
                        )),
                      ),
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: 16),
                            child: Image.asset('assets/logout.png'),
                          ),
                          Text(
                            'Logout',
                            style: GoogleFonts.montserrat(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Expanded(child: Container()),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.chevron_right_rounded,
                              size: 30,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
