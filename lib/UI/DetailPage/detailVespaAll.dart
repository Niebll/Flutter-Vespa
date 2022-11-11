import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:vespa/Model/allVespaModel.dart';
import 'package:vespa/widget/HexColor.dart';
import 'package:iconify_flutter/icons/mdi.dart';
import 'package:iconify_flutter/icons/nimbus.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';


class DetailVespaAll extends StatefulWidget {
  DetailVespaAll({Key? key, required this.vespas, required this.index})
      : super(key: key);
  Vespas vespas;
  int index;

  @override
  State<DetailVespaAll> createState() => _DetailVespaAll();
}

class _DetailVespaAll extends State<DetailVespaAll> {
  @override
  Widget build(BuildContext context) {
    final paneHeightClosed = MediaQuery.of(context).size.height * 0.425;
    final paneHeightOpen = MediaQuery.of(context).size.height * 1;
    return Scaffold(
        body: SafeArea(
          child: SlidingUpPanel(
            minHeight: paneHeightClosed,
            maxHeight: paneHeightOpen,
            borderRadius: BorderRadius.only(topRight: Radius.circular(30), topLeft: Radius.circular(30)),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      child: IconButton(
                        onPressed: () => Navigator.of(context).pop(),
                        icon: Icon(Icons.arrow_back_ios),
                        color: Color.fromRGBO(109, 203, 176, 1),
                      )),
                  Container(
                    color: HexColor(widget.vespas.all[widget.index].primarycolor.toString()),
                    child: Center(
                      child: ImageSlideshow(
                        width: 325,
                        height: 325,
                        initialPage: 0,
                        children: [
                          Image.network(widget.vespas.all[widget.index].img.toString()),
                          Image.network(widget.vespas.all[widget.index].img2.toString()),
                          Image.network(widget.vespas.all[widget.index].img3.toString()),
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
                all: widget.vespas.all[widget.index]
            ),
          ),
        ));
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
        padding: EdgeInsets.all(20),
        controller: controller,
        children: <Widget>[
          Container(
            // padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.65,
                  child: Text(
                      all.name,
                      style: GoogleFonts.bebasNeue(
                          fontSize: 20
                      )
                  ),
                ),
                SizedBox(height: 10,),
                Text(
                  all.tagline,
                  style: TextStyle(
                      color: Colors.grey,
                      fontStyle: FontStyle.italic
                  ),
                ),
                SizedBox(height: 20,),
                Text(
                  all.judulDescription,
                  style: GoogleFonts.bebasNeue(
                      fontSize: 20,
                      color: Colors.grey
                  ),
                ),
                SizedBox(height: 10,),
                Text(all.descripstion),
                SizedBox(height: 20,),
                Text(
                    "Specification",
                    style: GoogleFonts.bebasNeue(
                        fontSize: 20,
                        color: Colors.grey
                    )
                ),
                SizedBox(height: 20,),
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
                            border: Border.all(color: HexColor("E6E6E6"))
                        ),
                        padding: EdgeInsets.all(10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Iconify(
                              Mdi.engine,
                              size: 50,
                            ),
                            Text("Engine"),
                            SizedBox(height: 10,),
                            Text(
                              all.cc.toString() + " CC",
                              style: GoogleFonts.bebasNeue(
                                  fontSize: 16
                              ),
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
                            border: Border.all(color: HexColor("E6E6E6"))
                        ),
                        padding: EdgeInsets.all(10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Iconify(
                              Nimbus.size_width,
                              size: 50,
                            ),
                            Text("Lenght/Width", textAlign: TextAlign.center,),
                            SizedBox(height: 10,),

                            Text(
                              all.lengthWidth.toString() + " ", textAlign: TextAlign.center,
                              style: GoogleFonts.bebasNeue(
                                  fontSize: 16
                              ),
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
                            border: Border.all(color: HexColor("E6E6E6"))
                        ),
                        padding: EdgeInsets.all(10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Iconify(
                              MaterialSymbols.speed_outline,
                              size: 50,
                            ),
                            Text("Power"),
                            SizedBox(height: 10,),
                            Container(
                              width: 80,
                              child: Text(
                                all.power.toString(),textAlign: TextAlign.center,
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
            ),
          )
        ]
    ),
  );
}