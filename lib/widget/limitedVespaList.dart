import 'dart:convert';

import 'package:flutter/material.dart';

import '../Model/allVespaModel.dart';

class LimitedVespaList extends StatefulWidget {
  const LimitedVespaList({Key? key}) : super(key: key);

  @override
  State<LimitedVespaList> createState() => _LimitedVespaListState();
}

class _LimitedVespaListState extends State<LimitedVespaList> {
  Future<List> getAllVespaDatas(BuildContext context) async{
    String jsonString = await DefaultAssetBundle.of(context).loadString("assets/datas/limitedVespaDatas.json");
    List<dynamic> raw = jsonDecode(jsonString);
    return raw.map((f) => Vespas.fromJson(f)).toList();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(241, 241, 241, 5gi,
      child: FutureBuilder(
          future: getAllVespaDatas(context),
          builder: (context, data){
            if(data.hasData){
              List<Vespas> vespas = data.data as List<Vespas>;
              return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: vespas.length,
                  itemBuilder: (context, index){
                    return InkWell(
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.blueAccent)
                        ),
                        margin: EdgeInsets.all(10),
                        width: 180,
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                Image.network(vespas[index].imgthumbnail.toString())
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  }
              );
            }else{
              return Center(child: CircularProgressIndicator(),);
            }
          }
      ),
    );
  }
}
