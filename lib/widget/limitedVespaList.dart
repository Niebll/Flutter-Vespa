import 'package:flutter/material.dart';
import 'package:vespa/UI/DetailPage/detailVespas.dart';

import '../Model/allVespaModel.dart';

class LimitedVespaList extends StatefulWidget {
  const LimitedVespaList({Key? key}) : super(key: key);

  @override
  State<LimitedVespaList> createState() => _LimitedVespaListState();
}

class _LimitedVespaListState extends State<LimitedVespaList> {
  Future<Vespas> getAllVespaDatas(BuildContext context) async {
    String jsonString = await DefaultAssetBundle.of(context)
        .loadString("assets/datas/allVespaDatas.json");
    return vespasFromJson(jsonString);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(241, 241, 241, 5),
      child: FutureBuilder<Vespas>(
          future: getAllVespaDatas(context),
          builder: (context, vespas) {
            if (vespas.hasData) {
              return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: vespas.data?.limited.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return DetailVespa(vespas: vespas.data!, index: index,);
                        }));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)),
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
                                                color: HexColor(vespas.data!.limited[index].primarycolor),
                                                ),
                                          ),
                                          Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            height: 160,
                                            child: Image.network(vespas
                                                .data!.limited[index].imgthumbnail
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
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            height: 70,
                                            padding: const EdgeInsets.all(10.0),
                                            child: Text(
                                              vespas.data!.limited[index].name
                                                  .toString(),
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          Text(
                                            "\$${vespas.data!.limited[index].harga.toString()}",
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
          }),
    );
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

//ini mau merge
