import 'package:flutter/material.dart';
import 'package:vespa/Model/aksesorisModel.dart';

class AksesorisDetail extends StatefulWidget {
  AksesorisDetail({Key? key, required this.aksesoris}) : super(key: key);
  Aksesoris aksesoris;

  @override
  State<AksesorisDetail> createState() => _AksesorisDetailState();
}

class _AksesorisDetailState extends State<AksesorisDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff867A73),
        actions: [
          // BackButton(
          //   onPressed: () {
          //     Navigator.pop(context);
          //   },
          // ),
        ],
      ),
      backgroundColor: Color.fromRGBO(109, 203, 176, 1),
      body: ListView(
        children: <Widget> [
          Container(
            child: Column(
              children: [
                Container(
                  child: Image.network(
                      widget.aksesoris.img.toString(),
                    width: 200,
                    height: 200,
                  ),
                ),
                Text(
                    widget.aksesoris.name.toString(),
                  // style: ,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
