import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vitmarketplace/modals/colors.dart';
import 'package:vitmarketplace/products.dart';
import 'package:vitmarketplace/ui/homescreen.dart';

class ProductView extends StatefulWidget {
  const ProductView({super.key, required this.selectedproduct});

  final Product selectedproduct;
  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  int quantityselected = 1;
  bool descexpanded = false;
  int currentimage = 0;
  final searchcontroller = TextEditingController();
  final _pagecontroller = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    List quantitylist =
        List.generate(widget.selectedproduct.quantity, (index) => index + 1);
    Size size = MediaQuery.of(context).size;
    myColors mcol = myColors();
    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: SizedBox(
              width: size.width,
              height: size.height,
              child: Stack(children: [
                SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15.0, horizontal: 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Icon(
                                  Icons.arrow_back_ios,
                                  size: 30,
                                ),
                              ),
                              Container(
                                height: 60,
                                decoration: BoxDecoration(
                                    color: mcol.lightblue,
                                    borderRadius: BorderRadius.circular(60)),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                          width: size.width * 0.5,
                                          child: TextField(
                                            controller: searchcontroller,
                                            style: GoogleFonts.montserrat(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w400),
                                            decoration: InputDecoration(
                                                border: InputBorder.none,
                                                hintText:
                                                    "What are you looking for?",
                                                hintStyle:
                                                    GoogleFonts.montserrat(
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.w400)),
                                          ),
                                        ),
                                        Image.asset(
                                          "assets/search-normal.png",
                                          width: 35,
                                        )
                                      ]),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              HomeScreen(startingpage: 2)));
                                },
                                child: Image.asset(
                                  "assets/cart.png",
                                  width: 40,
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          height: 300,
                          child: PageView(
                            controller: _pagecontroller,
                            onPageChanged: (value) {
                              setState(() {
                                currentimage = value;
                              });
                            },
                            children: widget.selectedproduct.imagepath
                                .map((e) => Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(
                                                  color: mcol.lightblue,
                                                  blurRadius: 10,
                                                  spreadRadius: 10)
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            image: DecorationImage(
                                                image: NetworkImage(e),
                                                fit: BoxFit.cover),
                                            color: mcol.lightblue),
                                      ),
                                    ))
                                .toList(),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: widget.selectedproduct.imagepath
                              .map((e) => Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10.0, horizontal: 6),
                                    child: Container(
                                      height: 15,
                                      width: 15,
                                      decoration: BoxDecoration(
                                          color: widget
                                                      .selectedproduct.imagepath
                                                      .indexOf(e) ==
                                                  currentimage
                                              ? mcol.lightblue
                                              : mcol.darkblueteal,
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                    ),
                                  ))
                              .toList(),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 0.0, vertical: 10),
                                  child: Text(
                                    "Brand: ",
                                    style: GoogleFonts.barlow(
                                        fontSize: 18,
                                        color: Colors.grey.shade700),
                                  ),
                                ),
                                Text(
                                  "Apple",
                                  style: GoogleFonts.barlow(
                                      fontSize: 18,
                                      color: mcol.darkblueteal,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  widget.selectedproduct.liked =
                                      !widget.selectedproduct.liked;
                                });
                              },
                              child: Icon(
                                widget.selectedproduct.liked
                                    ? Icons.favorite
                                    : Icons.favorite_outline,
                                size: 40,
                              ),
                            )
                          ],
                        ),
                        Text(
                          widget.selectedproduct.name,
                          style: GoogleFonts.barlow(
                            fontSize: 30,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Row(
                            children: [
                              Text(
                                "Size: ",
                                style: GoogleFonts.montserrat(
                                    fontSize: 25, color: Colors.grey.shade700),
                              ),
                              Text(
                                "256 GB",
                                style: GoogleFonts.montserrat(
                                    fontSize: 25,
                                    color: mcol.darkblueteal,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20.0),
                          child: Text(
                            widget.selectedproduct.price,
                            style: GoogleFonts.barlow(
                                fontSize: 40, fontWeight: FontWeight.w700),
                          ),
                        ),
                        Text(
                          "Offers",
                          style: GoogleFonts.barlow(
                              fontSize: 30, fontWeight: FontWeight.w500),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0),
                                  child: Container(
                                    width: size.width * 0.35,
                                    height: 80,
                                    decoration: BoxDecoration(
                                        color: mcol.lightblue,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0),
                                  child: Container(
                                    width: size.width * 0.35,
                                    height: 80,
                                    decoration: BoxDecoration(
                                        color: mcol.lightblue,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0),
                                  child: Container(
                                    width: size.width * 0.35,
                                    height: 80,
                                    decoration: BoxDecoration(
                                        color: mcol.lightblue,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Text(
                          "Quantity",
                          style: GoogleFonts.barlow(
                              fontSize: 30, fontWeight: FontWeight.w500),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20.0),
                          child: Container(
                            width: 100,
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all()),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: DropdownButton<int>(
                                isExpanded: true,
                                value: quantityselected,
                                items: quantitylist
                                    .map((e) => DropdownMenuItem<int>(
                                        value: e,
                                        child: Text(
                                          e.toString(),
                                          style: GoogleFonts.barlow(
                                              fontSize: 24,
                                              fontWeight: FontWeight.w500),
                                        )))
                                    .toList(),
                                icon: Icon(Icons.arrow_downward),
                                onChanged: (int? newValue) {
                                  setState(() {
                                    quantityselected = newValue!;
                                  });
                                },
                              ),
                            ),
                          ),
                        ),
                        Text(
                          "Shipping Information",
                          style: GoogleFonts.barlow(
                              fontSize: 30, fontWeight: FontWeight.w500),
                        ),
                        Row(
                          children: [
                            Text(
                              "Shipping From: ",
                              style: GoogleFonts.barlow(
                                  fontSize: 24, color: Colors.grey.shade700),
                            ),
                            Text(
                              "Chennai",
                              style: GoogleFonts.barlow(
                                  fontSize: 24,
                                  color: mcol.darkblueteal,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "ETA: ",
                              style: GoogleFonts.barlow(
                                  fontSize: 24, color: Colors.grey.shade700),
                            ),
                            Text(
                              "01 Jan - 04 Jan",
                              style: GoogleFonts.barlow(
                                  fontSize: 24,
                                  color: mcol.darkblueteal,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20.0),
                          child: Text(
                            "Seller Information",
                            style: GoogleFonts.barlow(
                                fontSize: 30, fontWeight: FontWeight.w500),
                          ),
                        ),
                        Container(
                          height: 100,
                          decoration: BoxDecoration(
                              color: mcol.lightblue,
                              borderRadius: BorderRadius.circular(20)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 30),
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(60),
                                    child: Image.network(
                                      "https://akm-img-a-in.tosshub.com/indiatoday/images/story/media_bank/202309/elon-musk-252648408-16x9.jpg?VersionId=9KYZpqpoY3WvH8eVZg54mmkpTGfvPCWj&size=690:388",
                                      width: 80,
                                      height: 80,
                                      fit: BoxFit.cover,
                                    )),
                              ),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Elon Musk",
                                    style: GoogleFonts.montserrat(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "User Since: 18 Nov 2021",
                                    style: GoogleFonts.montserrat(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  Text(
                                    "98% Positive Feedback",
                                    style: GoogleFonts.montserrat(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w400),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20.0),
                          child: Text(
                            "Description",
                            style: GoogleFonts.barlow(
                                fontSize: 30, fontWeight: FontWeight.w500),
                          ),
                        ),
                        Container(
                          width: size.width,
                          height: descexpanded ? 500 : 200,
                          decoration: BoxDecoration(
                            color: mcol.lightblue,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  descexpanded
                                      ? widget.selectedproduct.description
                                      : widget.selectedproduct.description
                                          .substring(0, 250),
                                  style: GoogleFonts.barlow(
                                    fontSize: 23,
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    setState(() {
                                      descexpanded = !descexpanded;
                                    });
                                  },
                                  child: Text(
                                    "Show more ~",
                                    style: GoogleFonts.barlow(
                                        fontSize: 24,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20.0),
                          child: Text(
                            "Reviews",
                            style: GoogleFonts.barlow(
                                fontSize: 30, fontWeight: FontWeight.w500),
                          ),
                        ),
                        Container(
                          width: size.width,
                          height: 80,
                          decoration: BoxDecoration(
                            color: mcol.lightblue,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(
                              child: Text(
                            "Review No.1",
                            style: GoogleFonts.barlow(
                                fontSize: 28, fontWeight: FontWeight.bold),
                          )),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20.0),
                          child: Container(
                            width: size.width,
                            height: 80,
                            decoration: BoxDecoration(
                              color: mcol.lightblue,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(
                                child: Text(
                              "Review No.2",
                              style: GoogleFonts.barlow(
                                  fontSize: 28, fontWeight: FontWeight.bold),
                            )),
                          ),
                        ),
                        Container(
                          width: size.width,
                          height: 80,
                          decoration: BoxDecoration(
                            color: mcol.lightblue,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(
                              child: Text(
                            "Review No.3",
                            style: GoogleFonts.barlow(
                                fontSize: 28, fontWeight: FontWeight.bold),
                          )),
                        ),
                        SizedBox(
                          height: 100,
                        )
                      ],
                    ),
                  ),
                ),
                Positioned(
                    bottom: 0,
                    child: Container(
                      height: 80,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20)),
                          color: mcol.lightblue),
                      width: size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: size.width * 0.45,
                            height: 60,
                            child: ElevatedButton(
                              onPressed: () {},
                              child: Text(
                                "Add to Cart",
                                style: GoogleFonts.barlow(
                                    fontSize: 28, fontWeight: FontWeight.bold),
                              ),
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: mcol.darkblueteal,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20))),
                            ),
                          ),
                          SizedBox(
                            width: size.width * 0.45,
                            height: 60,
                            child: ElevatedButton(
                              onPressed: () {},
                              child: Text(
                                "Buy Now",
                                style: GoogleFonts.barlow(
                                    fontSize: 28, fontWeight: FontWeight.bold),
                              ),
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: mcol.orange,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20))),
                            ),
                          )
                        ],
                      ),
                    ))
              ]))),
    );
  }
}
