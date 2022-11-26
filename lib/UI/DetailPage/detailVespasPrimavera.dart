import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:intl/intl.dart';
import 'package:vespa/Model/allVespaModel.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:vespa/Sqflite/cart_vespa.dart';
import 'package:vespa/Sqflite/database_helper.dart';
import 'package:vespa/widget/HexColor.dart';
import 'package:iconify_flutter/icons/mdi.dart';
import 'package:iconify_flutter/icons/nimbus.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';

import '../BuyingPage/payment.dart';

class DetailVespaPrimavera extends StatefulWidget {
  // final String vespas;
  DetailVespaPrimavera({Key? key, required this.vespas, required this.index})
      : super(key: key);
  Vespas vespas;
  int index;

  @override
  State<DetailVespaPrimavera> createState() => _DetailVespaPrimavera();
}

class _DetailVespaPrimavera extends State<DetailVespaPrimavera> {
  bool checkExist = false;

  Future read() async {
    checkExist = await VespaDatabase.instance.read(widget.vespas.primavera[widget.index].name.toString());
    setState(() {});
  }

  Future addData() async {
    var list;
    list = VespaCart(
        title: widget.vespas.primavera[widget.index].name.toString(),
        imgthumbnail: widget.vespas.primavera[widget.index].imgthumbnail.toString(),
        harga: widget.vespas.primavera[widget.index].harga.toString(),
        primaryColor: widget.vespas.primavera[widget.index].primarycolor.toString()
    );
    await VespaDatabase.instance.create(list);
    setState(() {
      checkExist = true;
    });
  }

  Future deleteData() async {
    await VespaDatabase.instance.delete(widget.vespas.primavera[widget.index].name.toString());
    setState(() {
      checkExist = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    read();
  }

  @override
  Widget build(BuildContext context) {
    final paneHeightClosed = MediaQuery.of(context).size.height * 0.5;
    final paneHeightOpen = MediaQuery.of(context).size.height * 1;
    return SafeArea(
      child: Scaffold(
          backgroundColor: HexColor(widget.vespas.primavera[widget.index].primarycolor.toString()),
          body: Stack(children: [
            SlidingUpPanel(
              minHeight: paneHeightClosed,
              maxHeight: paneHeightOpen,
              borderRadius: BorderRadius.only(topRight: Radius.circular(30), topLeft: Radius.circular(30)),
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      color: Colors.white,
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () => Navigator.of(context).pop(),
                            icon: Icon(Icons.arrow_back_ios),
                            color: Color.fromRGBO(109, 203, 176, 1),
                          ),
                          Spacer(),
                          Text(widget.vespas.primavera[widget.index].tipe,
                            style: GoogleFonts.bebasNeue(
                              fontSize: 20,
                              letterSpacing: 5,
                            ),
                          ),
                          Spacer(),
                          Text("MMMM", style: TextStyle(color: Colors.white),)
                        ],
                      ),
                    ),
                    Container(
                      color: HexColor(widget.vespas.primavera[widget.index].primarycolor.toString()),
                      child: Center(
                        child: ImageSlideshow(
                          width: MediaQuery.of(context).size.width / 1.3,
                          height: MediaQuery.of(context).size.height / 2.5,
                          // height: 325,
                          initialPage: 0,
                          children: [
                            Image.network(widget.vespas.primavera[widget.index].img.toString()),
                            Image.network(widget.vespas.primavera[widget.index].img2.toString()),
                            Image.network(widget.vespas.primavera[widget.index].img3.toString()),
                          ],
                          onPageChanged: (value) {
                            print('Page changed: $value');
                          },
                          autoPlayInterval: 3000,
                          isLoop: true,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              panelBuilder: (controller) => PanelWidgetVespas(
                  controller: controller,
                  all: widget.vespas.primavera[widget.index]
              ),
            ),
            Positioned(
                bottom: 0,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white,
                  height: 80,
                  child: Row(children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0, right: 10),
                      child: Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(color: Colors.grey, spreadRadius: 0.5)
                            ]),
                        child: Center(
                            child: Icon(
                              Icons.add_shopping_cart,
                              // color: Colors.white,
                            )),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PaymentPage(
                                  harga: widget.vespas.primavera[widget.index].harga),
                            ));
                      },
                      child: Container(
                        width: 260,
                        height: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Color.fromRGBO(109, 203, 176, 1),
                            boxShadow: [
                              BoxShadow(color: Colors.grey, spreadRadius: 0.5)
                            ]),
                        child: Row(
                          // mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              NumberFormat.simpleCurrency(locale: "EUR", decimalDigits: 0).format(widget.vespas.primavera[widget.index].harga),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22,
                                  color: Colors.white
                              ),
                            ),
                            Spacer(),
                            Text(
                              "|",
                              style: TextStyle(fontSize: 18),
                            ),
                            Spacer(),
                            Text(
                              "Buy Now",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            )
                          ],
                        ),
                      ),
                    )
                  ]),
                ))
          ],
          )
      ),
    );
  }
}

class PanelWidgetVespas extends StatelessWidget {
  final ScrollController controller;
  final All all;
  const PanelWidgetVespas({
    Key? key,
    required this.controller,
    required this.all
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
    child: ListView(
        padding: EdgeInsets.only(bottom: 100),
        controller: controller,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.65,
                      child: Text(all.name,
                          style: GoogleFonts.bebasNeue(fontSize: 20)),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      all.tagline,
                      style: TextStyle(
                          color: Colors.grey, fontStyle: FontStyle.italic),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      all.judulDescription,
                      style: GoogleFonts.bebasNeue(
                          fontSize: 20, color: Colors.grey),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(all.descripstion),
                    SizedBox(
                      height: 20,
                    ),
                    Text("Specification",
                        style: GoogleFonts.bebasNeue(
                            fontSize: 20, color: Colors.grey)),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 20),
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.275,
                            height: 160,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: HexColor("E6E6E6"))),
                            padding: EdgeInsets.all(10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Iconify(
                                  Mdi.engine,
                                  size: 50,
                                ),
                                Text("Engine"),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  all.cc.toString() + " CC",
                                  style: GoogleFonts.bebasNeue(fontSize: 16),
                                )
                              ],
                            ),
                          ),
                          Spacer(),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.275,
                            height: 160,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: HexColor("E6E6E6"))),
                            padding: EdgeInsets.all(10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Iconify(
                                  Nimbus.size_width,
                                  size: 50,
                                ),
                                Text(
                                  "Lenght/Width",
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  all.lengthWidth.toString() + " ",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.bebasNeue(fontSize: 16),
                                )
                              ],
                            ),
                          ),
                          Spacer(),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.275,
                            height: 160,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: HexColor("E6E6E6"))),
                            padding: EdgeInsets.all(10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Iconify(
                                  MaterialSymbols.speed_outline,
                                  size: 50,
                                ),
                                Text("Power"),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  width: 80,
                                  child: Text(
                                    all.power.toString(),
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.bebasNeue(
                                      fontSize: 16,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(top: 20),
                color: HexColor(all.primarycolor.toString()),
                child: Center(
                  child: Text(
                    "Features",
                    style: GoogleFonts.bebasNeue(
                        fontSize: 20,
                        color: Colors.white
                    ),
                  ),
                ),
              ),
              Container(
                color: HexColor(all.primarycolor.toString()),
                height: 200,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: all.fiture.length,
                    itemBuilder: (context, index) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Image.network(
                              all.fiture[index].fiturimg,
                              width: 80,
                              height: 80,
                            ),
                          ),
                          SizedBox(height: 10,),
                          Container(
                            width: 80,
                            child: Text(
                              all.fiture[index].fitur,
                              style: TextStyle(
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          )
                        ],
                      );
                    }),
              ),
            ],
          )
        ]
    ),
  );
}
