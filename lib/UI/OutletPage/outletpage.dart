import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OutletPage extends StatefulWidget {
  const OutletPage({Key? key}) : super(key: key);

  @override
  State<OutletPage> createState() => _OutletPageState();
}

class _OutletPageState extends State<OutletPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        shadowColor: Colors.transparent,
        backgroundColor: Colors.white,
        leading: BackButton(
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "Outlet",
          style: GoogleFonts.bebasNeue(letterSpacing: 5, color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Container(),
    );
  }
}
