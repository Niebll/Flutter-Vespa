import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:vespa/widget/Colors/colors.dart';
import 'package:iconify_flutter/icons/ic.dart';
import 'package:iconify_flutter/icons/icon_park_outline.dart';
import 'package:iconify_flutter/icons/carbon.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: MainColor()),
        shadowColor: Colors.transparent,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(Icons.arrow_back_ios),
          color: Color.fromRGBO(109, 203, 176, 1),
        ),
        title: Text(
          "Account",
          style: GoogleFonts.bebasNeue(letterSpacing: 5, color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                height: MediaQuery.of(context).size.height / 5,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Center(
                      child: Container(
                        width: MediaQuery.of(context).size.width / 2.6,
                        child: ClipRRect(
                          borderRadius: new BorderRadius.circular(100),
                          child: Image(
                            fit: BoxFit.fill,
                            image: AssetImage('assets/images/profile.jpg'),
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Container(
                        width: 2,
                        color: Colors.black,
                        height: MediaQuery.of(context).size.height / 10,
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 4,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [Text("Joined"), Text("1 Month")],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              "Nabil",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              "Rajankanz",
              style: TextStyle(fontSize: 30),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Info(icon: IconParkOutline.people, text: "Nabil Rajankanz"),
          Info(
              icon: Ic.sharp_alternate_email, text: "nabilrajankanz@gmail.com"),
          Info(icon: Ic.baseline_local_phone, text: "0812-5123-6543"),
          Spacer(),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Container(
              padding: EdgeInsets.only(left: 10, ),
              height: 60,
              width: MediaQuery.of(context).size.width / 2.2,
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(15)),
              child: Row(
                children: [
                  Iconify(
                    Carbon.logout,
                    color: Colors.pink,
                  ),
                  SizedBox(width: 20,),
                  Text("Sign Out", style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20
                  ),)

                ],
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 20,
          ),
        ],
      ),
    );
  }
}

Widget Info({
  required String icon,
  required String text,
}) {
  return Padding(
    padding: const EdgeInsets.only(left: 20.0, bottom: 10),
    child: Row(
      children: [
        Container(
            padding: EdgeInsets.all(6),
            height: 35,
            width: 35,
            decoration: BoxDecoration(
                color: MainColor(), borderRadius: BorderRadius.circular(30)),
            child: Iconify(
              icon,
              color: Colors.white,
            )),
        SizedBox(
          width: 10,
        ),
        Text(
          text,
          style: TextStyle(
            fontSize: 18,
          ),
        )
      ],
    ),
  );
}
