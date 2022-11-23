import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vespa/Model/allVespaModel.dart';
import 'package:vespa/UI/DetailPage/detailVespaAll.dart';
import 'package:vespa/widget/navigationDrawer.dart';

class CatalogueVespa extends StatefulWidget {
  const CatalogueVespa({Key? key}) : super(key: key);

  @override
  State<CatalogueVespa> createState() => _CatalogueVespaState();
}

class _CatalogueVespaState extends State<CatalogueVespa> {
  Future<Vespas> getAllVespaDatas(BuildContext context) async {
    String jsonString = await DefaultAssetBundle.of(context)
        .loadString("assets/datas/allVespaDatas.json");
    return vespasFromJson(jsonString);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: NavigationDrawer(),
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          shadowColor: Colors.transparent,
          backgroundColor: Colors.white,
          actions: [Image.asset("assets/images/vespa_logo.jpg")],
          title: Text(
            "Catalogue",
            style: GoogleFonts.bebasNeue(letterSpacing: 5, color: Colors.black),
          ),
          centerTitle: true,
        ),
        backgroundColor: Colors.white,
        body: FutureBuilder<Vespas>(
            future: getAllVespaDatas(context),
            builder: (context, vespas) {
              if (vespas.hasData) {
                return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      // crossAxisCount: 2,
                      // childAspectRatio: MediaQuery.of(context).size.width/(MediaQuery.of(context).size.height/1.6) ,
                      crossAxisCount: 2,
                      crossAxisSpacing: 0,
                      mainAxisSpacing: 10,
                      // childAspectRatio: 1,
                      mainAxisExtent: 230,

                    ),
                    scrollDirection: Axis.vertical,
                    itemCount: vespas.data?.all.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                                return DetailVespaAll(
                                  vespas: vespas.data!,
                                  index: index,
                                );
                              }));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 1,
                                  blurRadius: 1,
                                )
                              ]),
                          margin: EdgeInsets.all(10),
                          width: 160,
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  child: Stack(
                                    children: [
                                      Container(
                                        width: MediaQuery.of(context).size.width,
                                        height: 140,
                                        // color: Colors.amber,
                                        child: Stack(
                                          children: [
                                            Container(
                                              height: 115,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                BorderRadius.circular(20),
                                                color: HexColor(vespas.data!
                                                    .all[index].primarycolor),
                                              ),
                                            ),
                                            Container(
                                              width:
                                              MediaQuery.of(context).size.width,
                                              height: 160,
                                              child: Hero(
                                                tag: "${vespas.data!.all[index].name}",
                                                child: Image.network(vespas
                                                    .data!.all[index].imgthumbnail
                                                    .toString()),
                                                transitionOnUserGestures: true,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Container(
                                        padding:
                                        EdgeInsets.symmetric(horizontal: 5),
                                        child: Column(
                                          children: [
                                            SizedBox(
                                              height: 120,
                                            ),
                                            Container(
                                              width:
                                              MediaQuery.of(context).size.width,
                                              height: 70,
                                              padding: const EdgeInsets.all(10.0),
                                              child: Text(
                                                vespas.data!.all[index].name
                                                    .toString(),
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold),
                                              ),
                                            ),
                                            Text(
                                              "\$${vespas.data!.all[index].harga.toString()}",
                                            )
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
                      );
                    });
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            }));
  }
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
