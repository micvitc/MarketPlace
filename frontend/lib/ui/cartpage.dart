import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vitmarketplace/modals/colors.dart';
import 'package:vitmarketplace/products.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  final searchcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    myColors mcol = myColors();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 0),
            child: Container(
              height: 60,
              decoration: BoxDecoration(
                  color: mcol.lightblue,
                  borderRadius: BorderRadius.circular(60)),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: size.width * 0.6,
                        child: TextField(
                          controller: searchcontroller,
                          style: GoogleFonts.montserrat(
                              fontSize: 20, fontWeight: FontWeight.w400),
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "What are you looking for?",
                              hintStyle: GoogleFonts.montserrat(
                                  fontSize: 20, fontWeight: FontWeight.w400)),
                        ),
                      ),
                      Image.asset(
                        "assets/search-normal.png",
                        width: 35,
                      )
                    ]),
              ),
            ),
          ),
          Text(
            "Cart",
            style:
                GoogleFonts.barlow(fontSize: 35, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: SizedBox(
              height: size.height * 0.55,
              child: ListView.builder(
                  itemCount: samples.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: Container(
                        width: size.width,
                        height: 150,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: mcol.lightblue),
                        child: FittedBox(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 4),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Image.network(
                                      samples[index].imagepath[0],
                                      height: 120,
                                      width: 120,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: size.width - 220,
                                          child: SingleChildScrollView(
                                            scrollDirection: Axis.horizontal,
                                            child: Text(
                                              samples[index].name,
                                              style: GoogleFonts.barlow(
                                                  fontSize: 24,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ),
                                        ),
                                        Text(
                                          samples[index].price,
                                          style: GoogleFonts.barlow(
                                              fontSize: 30,
                                              fontWeight: FontWeight.w700),
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              "Get it By: ",
                                              style: GoogleFonts.barlow(
                                                  fontSize: 24,
                                                  color: Colors.grey.shade700),
                                            ),
                                            Text(
                                              "01 Jan",
                                              style: GoogleFonts.barlow(
                                                  fontSize: 24,
                                                  color: mcol.darkblueteal,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Container(
                                                width: 50,
                                                height: 50,
                                                decoration: BoxDecoration(
                                                    color: mcol.darkblueteal,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50)),
                                                child: Center(
                                                    child: Text(
                                                  "-",
                                                  style: GoogleFonts.poppins(
                                                      fontSize: 45,
                                                      color: Colors.white),
                                                ))),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 20.0),
                                              child: Text(
                                                "1",
                                                style: GoogleFonts.barlow(
                                                    fontSize: 32,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                            Container(
                                                width: 50,
                                                height: 50,
                                                decoration: BoxDecoration(
                                                    color: mcol.darkblueteal,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50)),
                                                child: Center(
                                                    child: Text(
                                                  "+",
                                                  style: GoogleFonts.poppins(
                                                      fontSize: 45,
                                                      color: Colors.white),
                                                )))
                                          ],
                                        ),
                                        SizedBox(
                                          width: size.width - 220,
                                          child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                GestureDetector(
                                                  onTap: () {
                                                    setState(() {
                                                      samples[index].liked =
                                                          !samples[index].liked;
                                                    });
                                                  },
                                                  child: Icon(
                                                    samples[index].liked
                                                        ? Icons.favorite
                                                        : Icons
                                                            .favorite_outline,
                                                    size: 26,
                                                  ),
                                                )
                                              ]),
                                        )
                                      ],
                                    ),
                                  )
                                ]),
                          ),
                        ),
                      ),
                    );
                  }),
            ),
          ),
          Row(
            children: [
              Text(
                "SubTotal:",
                style: GoogleFonts.barlow(
                    fontSize: 35,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey.shade600),
              ),
              Text(
                "\$4,39,000",
                style: GoogleFonts.barlow(
                    fontSize: 35, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: SizedBox(
              width: size.width,
              height: 60,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CheckoutPage()));
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: mcol.orange,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
                child: Text(
                  "CheckOut",
                  style: GoogleFonts.barlow(
                      fontSize: 40, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    myColors mcol = myColors();
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: size.width,
          height: size.height,
          child: Column(
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
                          "Checkout",
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
                padding: const EdgeInsets.only(left: 20.0),
                child: Text(
                  "Your Items",
                  style: GoogleFonts.barlow(
                      fontSize: 35, fontWeight: FontWeight.w500),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20),
                child: SizedBox(
                  height: size.height * 0.4,
                  child: ListView.builder(
                      itemCount: samples.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5.0),
                          child: Container(
                            width: size.width,
                            height: 150,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: mcol.lightblue),
                            child: FittedBox(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0, vertical: 4),
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: Image.network(
                                          samples[index].imagepath[0],
                                          height: 120,
                                          width: 120,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 10.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              width: size.width - 220,
                                              child: SingleChildScrollView(
                                                scrollDirection:
                                                    Axis.horizontal,
                                                child: Text(
                                                  samples[index].name,
                                                  style: GoogleFonts.barlow(
                                                      fontSize: 24,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                              ),
                                            ),
                                            Text(
                                              samples[index].price,
                                              style: GoogleFonts.barlow(
                                                  fontSize: 30,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  "Get it By: ",
                                                  style: GoogleFonts.barlow(
                                                      fontSize: 24,
                                                      color:
                                                          Colors.grey.shade700),
                                                ),
                                                Text(
                                                  "01 Jan",
                                                  style: GoogleFonts.barlow(
                                                      fontSize: 24,
                                                      color: mcol.darkblueteal,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Container(
                                                    width: 50,
                                                    height: 50,
                                                    decoration: BoxDecoration(
                                                        color:
                                                            mcol.darkblueteal,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(50)),
                                                    child: Center(
                                                        child: Text(
                                                      "-",
                                                      style:
                                                          GoogleFonts.poppins(
                                                              fontSize: 45,
                                                              color:
                                                                  Colors.white),
                                                    ))),
                                                Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 20.0),
                                                  child: Text(
                                                    "1",
                                                    style: GoogleFonts.barlow(
                                                        fontSize: 32,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                                Container(
                                                    width: 50,
                                                    height: 50,
                                                    decoration: BoxDecoration(
                                                        color:
                                                            mcol.darkblueteal,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(50)),
                                                    child: Center(
                                                        child: Text(
                                                      "+",
                                                      style:
                                                          GoogleFonts.poppins(
                                                              fontSize: 45,
                                                              color:
                                                                  Colors.white),
                                                    )))
                                              ],
                                            ),
                                            SizedBox(
                                              width: size.width - 220,
                                              child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    GestureDetector(
                                                      onTap: () {
                                                        setState(() {
                                                          samples[index].liked =
                                                              !samples[index]
                                                                  .liked;
                                                        });
                                                      },
                                                      child: Icon(
                                                        samples[index].liked
                                                            ? Icons.favorite
                                                            : Icons
                                                                .favorite_outline,
                                                        size: 26,
                                                      ),
                                                    )
                                                  ]),
                                            )
                                          ],
                                        ),
                                      )
                                    ]),
                              ),
                            ),
                          ),
                        );
                      }),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20),
                child: Text(
                  "Order Summary",
                  style: GoogleFonts.barlow(
                      fontSize: 35, fontWeight: FontWeight.w500),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(
                      left: 20.0, right: 20, top: 15, bottom: 15),
                  child: Container(
                    width: size.width,
                    height: size.height * 0.2,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: mcol.lightblue),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "SubTotal ",
                                  style: GoogleFonts.montserrat(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w400),
                                ),
                                Text(
                                  "₹4,49,000",
                                  style: GoogleFonts.barlow(
                                      fontSize: 28,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Delivery",
                                  style: GoogleFonts.montserrat(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w400),
                                ),
                                Text(
                                  "₹0",
                                  style: GoogleFonts.barlow(
                                      fontSize: 28,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Discount",
                                  style: GoogleFonts.montserrat(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w400),
                                ),
                                Text(
                                  "-₹49,000",
                                  style: GoogleFonts.barlow(
                                      fontSize: 28,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Total ",
                                  style: GoogleFonts.montserrat(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w800),
                                ),
                                Text(
                                  "₹4,00,000",
                                  style: GoogleFonts.barlow(
                                      fontSize: 28,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            )
                          ]),
                    ),
                  )),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: SizedBox(
                  width: size.width,
                  height: 60,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CheckoutPage()));
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: mcol.orange,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                    child: Text(
                      "Proceed To Pay",
                      style: GoogleFonts.barlow(
                          fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
