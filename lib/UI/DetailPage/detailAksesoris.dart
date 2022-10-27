import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
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
      backgroundColor: Color.fromRGBO(109, 203, 176, 1),
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      //   elevation: 0.0,
      //   leading: IconButton(
      //     onPressed: () => Navigator.of(context).pop(),
      //     icon: Icon(Icons.arrow_back_ios),
      //   )
      // ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 20),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: Icon(Icons.arrow_back_ios),
                    color: Colors.white,
                  ),
                  Spacer(),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.add_shopping_cart),
                    color: Colors.white,
                  )
                ],
              )
            ),
            ListView(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              children: <Widget> [
                Container(
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.network(
                          widget.aksesoris.img.toString(),
                          width: 200,
                          height: 200,
                        ),
                      ),
                      Container(
                        color: Colors.white,
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.57,
                        child: Column(
                          children: [
                            Text(widget.aksesoris.name.toString()),

                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
