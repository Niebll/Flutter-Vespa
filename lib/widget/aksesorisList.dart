import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:vespa/Model/aksesorisModel.dart';
import 'package:vespa/UI/DetailPage/detailAksesoris.dart';

class AksesorisList extends StatefulWidget {
  const AksesorisList({Key? key}) : super(key: key);

  @override
  State<AksesorisList> createState() => _AksesorisListState();
}

class _AksesorisListState extends State<AksesorisList> {
  // String dollar = "$";

  Future<List> getAksesorisList(BuildContext context) async {
    String jsonString = await DefaultAssetBundle.of(context)
        .loadString("assets/datas/aksesorisDatas.json");
    List<dynamic> raw = jsonDecode(jsonString);
    return raw.map((f) => Aksesoris.fromJson(f)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getAksesorisList(context),
        builder: (context, data) {
          if (data.hasData) {
            List<Aksesoris> aksesoris = data.data as List<Aksesoris>;
            return ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 3,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return AksesorisDetail(aksesoris: aksesoris[index]);
                      }));
                    },
                    child: Container(
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.only(bottom: 10, left: 10, right: 10),
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
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Image.network(
                              aksesoris[index].img.toString(),
                              width: 60,
                              height: 60,
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width / 1.75,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  child: Text(
                                    aksesoris[index].name.toString(),
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Text('\$${aksesoris[index].harga.toString()}'),
                              ],
                            ),
                          ),
                          Spacer(),
                          Icon(Icons.favorite_border)
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
