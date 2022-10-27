import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:vespa/UI/DetailPage/detailVespa.dart';

import '../Model/allVespaModel.dart';

class LimitedVespaList extends StatefulWidget {
  const LimitedVespaList({Key? key}) : super(key: key);

  @override
  State<LimitedVespaList> createState() => _LimitedVespaListState();
}

class _LimitedVespaListState extends State<LimitedVespaList> {
  Future<List> getAllVespaDatas(BuildContext context) async {
    String jsonString = await DefaultAssetBundle.of(context)
        .loadString("assets/datas/limitedVespaDatas.json");
    List<dynamic> raw = jsonDecode(jsonString);
    return raw.map((f) => Vespas.fromJson(f)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getAllVespaDatas(context),
        builder: (context, data) {
          if (data.hasData) {
            List<Vespas> vespas = data.data as List<Vespas>;
            return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: vespas.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return DetailVespa(vespa: vespas[index]);
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
                                            color: Colors.amber,
                                          ),
                                        ),
                                        Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: 160,
                                          child: Image.network(vespas[index]
                                              .imgthumbnail
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
                                            vespas[index].name.toString(),
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Text(
                                          "\$${vespas[index].harga.toString()}",
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
        });
  }
}
