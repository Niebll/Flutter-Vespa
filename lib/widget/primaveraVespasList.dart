import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vespa/UI/DetailPage/detailVespasLimited.dart';
import 'package:vespa/UI/DetailPage/detailVespasPrimavera.dart';

import '../Model/allVespaModel.dart';

class PrimaveraVespasList extends StatefulWidget {
  const PrimaveraVespasList({Key? key}) : super(key: key);

  @override
  State<PrimaveraVespasList> createState() => _PrimaveraVespasList();
}

class _PrimaveraVespasList extends State<PrimaveraVespasList> {
  Future<Vespas> getAllVespaDatas(BuildContext context) async {
    String jsonString = await DefaultAssetBundle.of(context)
        .loadString("assets/datas/allVespaDatas.json");
    return vespasFromJson(jsonString);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Vespas>(
        future: getAllVespaDatas(context),
        builder: (context, vespas) {
          if (vespas.hasData) {
            return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: vespas.data?.primavera.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                            return DetailVespaPrimavera(
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
                                                .primavera[index].primarycolor),
                                          ),
                                        ),
                                        Container(
                                          width:
                                          MediaQuery.of(context).size.width,
                                          height: 160,
                                          child: Image.network(vespas
                                              .data!.primavera[index].imgthumbnail
                                              .toString()),
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
                                            vespas.data!.primavera[index].name
                                                .toString(),
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Text(
                                          NumberFormat.simpleCurrency(locale: "EUR", decimalDigits: 0).format(vespas.data!.primavera[index].harga),
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
                  );
                });
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
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
