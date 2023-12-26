import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vitmarketplace/products.dart';
import 'package:vitmarketplace/ui/productview.dart';

import '../modals/colors.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final searchcontroller = TextEditingController();

  final List<String> imglist = [
    "https://store.storeimages.cdn-apple.com/4668/as-images.apple.com/is/iphone-15-pro-finish-select-202309-6-1inch-bluetitanium_AV3?wid=2560&hei=1440&fmt=p-jpg&qlt=80&.v=1693011636681",
    //"https://i0.wp.com/www.smartprix.com/bytes/wp-content/uploads/2021/03/rog-asus-1.png?fit=1200%2C630&ssl=1",
    //"https://images.puma.com/image/upload/f_auto,q_auto,b_rgb:fafafa,w_2000,h_2000/global/378790/02/bv/fnd/IND/fmt/png/PWRFrame-TR-2-Men's-Training-Shoes",
    //"https://www.lego.com/cdn/cs/set/assets/blt5761ec51cab6eb53/21336_alt1.png"
  ];

  @override
  Widget build(BuildContext context) {
    int current = 0;
    final carouselController = CarouselController();
    Size size = MediaQuery.of(context).size;
    myColors mcol = myColors();
    return SizedBox(
      width: size.width,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 15.0, horizontal: 6),
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
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: CarouselSlider(
                  carouselController: carouselController,
                  options: CarouselOptions(
                      enlargeCenterPage: true,
                      aspectRatio: 1.5,
                      onPageChanged: (value, reason) {
                        setState(() {
                          current = value;
                        });
                      },
                      autoPlay: true,
                      enableInfiniteScroll: true),
                  items: [
                    Container(
                      width: size.width,
                      height: 300,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                                color: mcol.lightblue,
                                offset: Offset(4, 4),
                                blurRadius: 10)
                          ],
                          image: DecorationImage(
                              image: NetworkImage(samples[0].imagepath[3]),
                              fit: BoxFit.cover)),
                    ),
                    Container(
                      width: size.width,
                      height: 300,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                                color: mcol.lightblue,
                                offset: Offset(4, 4),
                                blurRadius: 10)
                          ],
                          image: DecorationImage(
                              image: NetworkImage(samples[1].imagepath[2]),
                              fit: BoxFit.cover)),
                    ),
                  ],
                )),
            /*Container(
                height: 250,
                decoration: BoxDecoration(
                    color: mcol.lightblue,
                    borderRadius: BorderRadius.circular(20)),
              ), */
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
              child: Text(
                "Browse Categories",
                style: GoogleFonts.barlow(
                    fontSize: 24, fontWeight: FontWeight.w500),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    categories(
                      mcol: mcol,
                      imagepath: "assets/ElectronicsLogo.jpeg",
                      title: "Electronics",
                    ),
                    categories(
                        mcol: mcol,
                        imagepath: "assets/groceries.jpeg",
                        title: "Groceries"),
                    categories(
                        mcol: mcol,
                        imagepath: "assets/stationary.jpeg",
                        title: "Stationery"),
                    categories(
                        mcol: mcol,
                        imagepath: "assets/books.jpeg",
                        title: "Books")
                  ],
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
              child: Text(
                "New Arrivals",
                style: GoogleFonts.barlow(
                    fontSize: 24, fontWeight: FontWeight.w500),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 200,
                  width: size.width * 0.45,
                  decoration: BoxDecoration(
                      color: mcol.lightblue,
                      borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 15.0, left: 10, right: 10),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ProductView(
                                          selectedproduct: samples[0])));
                            },
                            child: Container(
                              height: 120,
                              //width: size.width * 0.35,
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  image: DecorationImage(
                                      image:
                                          NetworkImage(samples[0].imagepath[0]),
                                      fit: BoxFit.cover),
                                  borderRadius: BorderRadius.circular(15)),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              samples[0].name.substring(0, 15) + "...",
                              style: GoogleFonts.barlow(
                                  fontWeight: FontWeight.w500, fontSize: 24),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  samples[0].price,
                                  style: GoogleFonts.barlow(
                                      fontSize: 28,
                                      fontWeight: FontWeight.w500),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      samples[0].liked = !samples[0].liked;
                                    });
                                  },
                                  child: Icon(
                                    samples[0].liked
                                        ? Icons.favorite
                                        : Icons.favorite_outline,
                                    size: 30,
                                  ),
                                )
                              ],
                            ),
                          )
                        ]),
                  ),
                ),
                Container(
                  height: 200,
                  width: size.width * 0.45,
                  decoration: BoxDecoration(
                      color: mcol.lightblue,
                      borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 15.0, left: 10, right: 10),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ProductView(
                                          selectedproduct: samples[1])));
                            },
                            child: Container(
                              height: 120,
                              //width: size.width * 0.35,
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  image: DecorationImage(
                                      image:
                                          NetworkImage(samples[1].imagepath[0]),
                                      fit: BoxFit.cover),
                                  borderRadius: BorderRadius.circular(15)),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              samples[1].name.substring(0, 13) + "...",
                              style: GoogleFonts.barlow(
                                  fontWeight: FontWeight.w500, fontSize: 24),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  samples[1].price,
                                  style: GoogleFonts.barlow(
                                      fontSize: 28,
                                      fontWeight: FontWeight.w500),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      samples[1].liked = !samples[0].liked;
                                    });
                                  },
                                  child: Icon(
                                    samples[1].liked
                                        ? Icons.favorite
                                        : Icons.favorite_outline,
                                    size: 30,
                                  ),
                                )
                              ],
                            ),
                          )
                        ]),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class categories extends StatelessWidget {
  const categories(
      {super.key,
      required this.mcol,
      required this.imagepath,
      required this.title});

  final myColors mcol;
  final String imagepath;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
                color: mcol.lightblue,
                image: DecorationImage(
                    image: AssetImage(imagepath), fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(100)),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              title,
              style: GoogleFonts.montserrat(
                  fontSize: 16, fontWeight: FontWeight.w400),
            ),
          )
        ],
      ),
    );
  }
}
