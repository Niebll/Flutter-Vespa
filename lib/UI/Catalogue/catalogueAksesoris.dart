import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vespa/Model/aksesorisModel.dart';

import '../../widget/navigationDrawer.dart' as drawer;
import '../DetailPage/detailAksesoris.dart';

class CatalogueAksesoris extends StatefulWidget {
  const CatalogueAksesoris({Key? key}) : super(key: key);

  @override
  State<CatalogueAksesoris> createState() => _CatalogueAksesorisState();
}

class _CatalogueAksesorisState extends State<CatalogueAksesoris> {
  Future<List> getAksesorisList(BuildContext context) async {
    String jsonString = await DefaultAssetBundle.of(context)
        .loadString("assets/datas/aksesorisDatas.json");
    List<dynamic> raw = jsonDecode(jsonString);
    return raw.map((f) => Aksesoris.fromJson(f)).toList();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: drawer.NavigationDrawer(),
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
        body: FutureBuilder(
            future: getAksesorisList(context),
            builder: (context, data) {
              if (data.hasData) {
                List<Aksesoris> aksesoris = data.data as List<Aksesoris>;
                return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      // crossAxisCount: 2,
                      // childAspectRatio: MediaQuery.of(context).size.width/(MediaQuery.of(context).size.height/1.6) ,
                      crossAxisCount: 2,
                      crossAxisSpacing: 0,
                      mainAxisSpacing: 10,
                      mainAxisExtent: 230,

                    ),
                    scrollDirection: Axis.vertical,
                    itemCount: aksesoris.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                                return AksesorisDetail(aksesoris: aksesoris[index]);
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
                                                color: Colors.white,
                                              ),
                                            ),
                                            Container(
                                              width:
                                              MediaQuery.of(context).size.width,
                                              height: 160,
                                              child: Hero(
                                                tag: aksesoris[index].name.toString(),
                                                child: Image.network(aksesoris[index].img.toString()),
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
                                              child: Text(aksesoris[index].name.toString(),
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold),
                                              ),
                                            ),
                                            Text(
                                              "${aksesoris[index].harga.toString()} \€",
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