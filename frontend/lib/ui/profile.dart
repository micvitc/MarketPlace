import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:floating_snackbar/floating_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vitmarketplace/modals/colors.dart';
import 'package:vitmarketplace/services/apiFunctions.dart';
import 'package:vitmarketplace/services/services.dart';
import 'package:vitmarketplace/ui/signinscreens.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  apiCalls myApi = apiCalls();

  Map<String,dynamic> userData= {};
  Future<void> readProfile() async{
    User? user = FirebaseAuth.instance.currentUser;
    String userId= user?.uid as String;
    String temp=await myApi.getUserProfile(userId) as String;
    setState(() {
      userData=json.decode(temp) as Map<String,dynamic>;
    });

  }

  @override
  void initState(){
    readProfile();
    super.initState();
  }

  final searchcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    myColors mcol = myColors();

    return Scaffold(
      body: SafeArea(
        child: Column(
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
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Settings()));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          'assets/setting-2.png',
                          width: 30,
                        ),
                      ),
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
                      child: Image.asset(
                        'assets/notification.png',
                        width: 30,
                      ),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        userData["name"]!=null?userData["name"]:"Loading..",
                                        style: GoogleFonts.montserrat(
                                          fontSize: 24,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Text(
                                        userData["userType"]!=null?userData["userType"].toString().capitalize():"Loading..",
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
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ProfileDetails(userData: userData,)));
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.asset(
                                    'assets/Edit.png',
                                    width: 40,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),

                        // block 2
                        Container(
                          width: size.width,
                          height: 100,
                          decoration: BoxDecoration(
                            color: mcol.lightblue,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(24.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  width: size.width * 0.32,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 36),
                                    child: Column(
                                      children: [
                                        Text(
                                          userData["favourites"]!=null?userData["favourites"].length.toString():"Loading",
                                          style: GoogleFonts.montserrat(
                                            fontSize: 24,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        FittedBox(
                                          child: Text(
                                            'Favourites',
                                            style: GoogleFonts.montserrat(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 2,
                                  height: 50,
                                  color: Colors.black,
                                ),
                                Container(
                                  width: size.width * 0.32,
                                  child: Column(
                                    children: [
                                      Text(
                                        '5',
                                        style: GoogleFonts.montserrat(
                                          fontSize: 24,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      FittedBox(
                                        child: Text(
                                          'Finds',
                                          style: GoogleFonts.montserrat(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ],
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
                          child: GestureDetector(
                            onTap: (){
                              showDialog(context: context, builder: (context){
                                return AlertDialog(
                                  backgroundColor: mcol.lightblue,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30)
                                  ),
                                  title: Text("Log Out?",style: GoogleFonts.montserrat(fontSize: 32,color: mcol.darkblueteal,fontWeight: FontWeight.w400),),
                                  content: Container(
                                    width: size.width*0.8,
                                    child: Text("Are you sure want to log out?",style: GoogleFonts.montserrat(fontSize: 24,color: Colors.grey),),
                                  ),
                                  actions: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                                      child: SizedBox(
                                        width: size.width * 0.3,
                                        height: 40,
                                        child: ElevatedButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text(
                                            "Cancel",
                                            style: GoogleFonts.barlow(
                                                fontSize: 28, fontWeight: FontWeight.bold),
                                          ),
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor: mcol.darkblueteal,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(10))),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 10),
                                      child: SizedBox(
                                        width: size.width * 0.3,
                                        height: 40,
                                        child: ElevatedButton(
                                          onPressed: () async{
                                            await FirebaseAuth.instance.signOut().then((value) {

                                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
                                            FloatingSnackBar(
                                                message: "Successfully Signed Out",
                                                context: context,
                                                textStyle: GoogleFonts.barlow(
                                                  fontSize: 28,
                                                ));
                                            });
                                            
                                          },
                                          child: Text(
                                            "Log Out",
                                            style: GoogleFonts.barlow(
                                                fontSize: 28, fontWeight: FontWeight.bold),
                                          ),
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor: mcol.orange,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(10))),
                                        ),
                                      ),
                                    )
                                  ],
                                );
                              });
                            },
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
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileDetails extends StatefulWidget {
  const ProfileDetails({super.key,required this.userData});

  final Map<String,dynamic> userData;

  @override
  State<ProfileDetails> createState() => _ProfileDetailsState();
}

class _ProfileDetailsState extends State<ProfileDetails> {

  bool editName= false;
  bool editPhoneno= false;
  final namecontroller = TextEditingController();
  final phnocontroller = TextEditingController();
  apiCalls myApi = apiCalls();

  @override
  Widget build(BuildContext context) {
    setState(() {
      namecontroller.text= widget.userData["name"];
      phnocontroller.text= widget.userData["phoneNo"]!=null?widget.userData["phoneNo"].toString():"";
    });
    Size size = MediaQuery.of(context).size;
    myColors mcol = myColors();
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: size.width,
          height: size.height,
          child: Column(
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
                          "Profile",
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
                padding: const EdgeInsets.only(top: 20.0, bottom: 20),
                child: Container(
                  width: size.width,
                  child: Center(
                    child: Stack(
                      children: [
                        Image.asset(
                          "assets/profile-circle.png",
                          width: 120,
                        ),
                        Positioned(
                            bottom: 0,
                            right: 0,
                            child: Image.asset(
                              "assets/Edit-photo.png",
                              width: 50,
                            ))
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                width: size.width * 0.9,
                height: 270,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: mcol.lightblue),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 10),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Name",
                                    style: GoogleFonts.barlow(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  Visibility(
                                    visible: !editName,
                                    child: Text(
                                      widget.userData["name"],
                                      style: GoogleFonts.montserrat(
                                          fontSize: 25,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                  Visibility(
                                      visible: editName,
                                      child: SizedBox(width: size.width*0.5,height: 35,
                                        child: TextField(
                                          controller: namecontroller,
                                          style: GoogleFonts.montserrat(fontSize: 25,fontWeight: FontWeight.w600),
                                          decoration: InputDecoration(

                                            border: UnderlineInputBorder(),

                                          ),

                                        ),))
                                ],
                              ),
                            ),
                            Visibility(
                              visible: !editName,
                              child: GestureDetector(
                                onTap: (){
                                  setState(() {
                                    editName= !editName;
                                  });
                                },
                                child: Image.asset(
                                  "assets/Edit.png",
                                  width: 40,
                                ),
                              ),
                            ),
                            Visibility(
                              visible: editName,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                child: GestureDetector(
                                    onTap: ()async{
                                      String jsonParam = jsonEncode({"name": namecontroller.text});
                                        int statusCode = await myApi.updateUser(jsonParam, widget.userData["_id"]);
                                        if(statusCode==200){
                                          FloatingSnackBar(
                                              message: "Name Updated",
                                              context: context,
                                              textStyle: GoogleFonts.barlow(
                                                fontSize: 28,
                                              ));
                                          setState(() {
                                            editName=false;
                                            widget.userData["name"]=namecontroller.text;
                                          });

                                        }else{
                                          FloatingSnackBar(
                                              message: "An error has occured",
                                              context: context,
                                              textStyle: GoogleFonts.barlow(
                                                fontSize: 28,
                                              ));
                                        }
                                    },
                                    child: Icon(Icons.task_alt,size: 40,color: mcol.darkblueteal,)
                                ),
                              ),
                            ),
                            Visibility(
                              visible: editName,
                              child: GestureDetector(
                                onTap: (){
                                  setState((){
                                    editName=false;
                                  });
                                },
                                child: Icon(Icons.cancel,size: 40,color: mcol.darkblueteal,)
                              ),
                            ),

                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Email-id",
                              style: GoogleFonts.barlow(
                                  fontSize: 20, fontWeight: FontWeight.w400),
                            ),
                            Text(
                              widget.userData["emailId"],
                              style: GoogleFonts.montserrat(
                                  fontSize: 25, fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "PhoneNo",
                                    style: GoogleFonts.barlow(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  Visibility(
                                    visible: !editPhoneno,
                                    child: Text(
                                      widget.userData["phoneNo"]!=null?widget.userData["phoneNo"].toString():"Not yet set",
                                      style: GoogleFonts.montserrat(
                                          fontSize: 25,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                  Visibility(
                                      visible: editPhoneno,
                                      child: SizedBox(width: size.width*0.5,height: 35,
                                        child: TextField(
                                          controller: phnocontroller,
                                          style: GoogleFonts.montserrat(fontSize: 25,fontWeight: FontWeight.w600),
                                          decoration: InputDecoration(

                                            border: UnderlineInputBorder(),

                                          ),

                                        ),))
                                ],
                              ),
                            ),
                            Visibility(
                              visible: !editPhoneno,
                              child: GestureDetector(
                                onTap: (){
                                  setState(() {
                                    editPhoneno= !editPhoneno;
                                  });
                                },
                                child: Image.asset(
                                  "assets/Edit.png",
                                  width: 40,
                                ),
                              ),
                            ),
                            Visibility(
                              visible: editPhoneno,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                child: GestureDetector(
                                    onTap: ()async{
                                      String jsonParam = jsonEncode({"phoneNo": phnocontroller.text});
                                      int statusCode = await myApi.updateUser(jsonParam, widget.userData["_id"]);
                                      if(statusCode==200){
                                        FloatingSnackBar(
                                            message: "Phone-Number Updated",
                                            context: context,
                                            textStyle: GoogleFonts.barlow(
                                              fontSize: 28,
                                            ));
                                        setState(() {
                                          editPhoneno=false;
                                          widget.userData["phoneNo"]=phnocontroller.text;
                                        });

                                      }else{
                                        FloatingSnackBar(
                                            message: "An error has occured",
                                            context: context,
                                            textStyle: GoogleFonts.barlow(
                                              fontSize: 28,
                                            ));
                                      }
                                    },
                                    child: Icon(Icons.task_alt,size: 40,color: mcol.darkblueteal,)
                                ),
                              ),
                            ),
                            Visibility(
                              visible: editPhoneno,
                              child: GestureDetector(
                                  onTap: () {
                                    setState((){
                                      editPhoneno=false;
                                    });
                                  },
                                  child: Icon(Icons.cancel,size: 40,color: mcol.darkblueteal,)
                              ),
                            ),

                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Account Type",
                              style: GoogleFonts.barlow(
                                  fontSize: 20, fontWeight: FontWeight.w400),
                            ),
                            Text(
                                widget.userData["userType"].toString().capitalize(),
                              style: GoogleFonts.montserrat(
                                  fontSize: 25, fontWeight: FontWeight.w600),
                            )
                          ],
                        )
                      ]),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
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
                          "Settings",
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
                padding:
                    const EdgeInsets.symmetric(vertical: 30.0, horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SettingsListTile(
                        Imageurl: "assets/service.png",
                        Title: "Customer Service",
                        page: Container()),
                    Divider(
                      color: Colors.black45,
                    ),
                    SettingsListTile(
                        Imageurl: "assets/translate.png",
                        Title: "Change Language",
                        page: Container()),
                    Divider(
                      color: Colors.black45,
                    ),
                    SettingsListTile(
                        Imageurl: "assets/notificationbell.png",
                        Title: "Notification Settings",
                        page: Container()),
                    Divider(
                      color: Colors.black45,
                    ),
                    SettingsListTile(
                        Imageurl: "assets/service.png",
                        Title: "Privacy Policy",
                        page: Container()),
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

class SettingsListTile extends StatelessWidget {
  const SettingsListTile(
      {super.key,
      required this.Imageurl,
      required this.Title,
      required this.page});
  final String Imageurl;
  final String Title;
  final Widget page;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            Imageurl,
            width: 40,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Text(
              Title,
              style: GoogleFonts.montserrat(
                  fontSize: 24, fontWeight: FontWeight.w500),
            ),
          ),
          Expanded(child: Container()),
          Icon(
            Icons.keyboard_arrow_right,
            size: 40,
          )
        ],
      ),
    );
  }
}
