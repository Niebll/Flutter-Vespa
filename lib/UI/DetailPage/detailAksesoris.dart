import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:vespa/Model/aksesorisModel.dart';

import '../../widget/panelWidget.dart';

class AksesorisDetail extends StatefulWidget {
  AksesorisDetail({Key? key, required this.aksesoris}) : super(key: key);
  Aksesoris aksesoris;

  @override
  State<AksesorisDetail> createState() => _AksesorisDetailState();
}

class _AksesorisDetailState extends State<AksesorisDetail> {
  @override
  Widget build(BuildContext context) {
    final paneHeightClosed = MediaQuery.of(context).size.height * 0.5;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [SlidingUpPanel(
            minHeight: paneHeightClosed,
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () => Navigator.of(context).pop(),
                            icon: Icon(Icons.arrow_back_ios),
                            color: Color.fromRGBO(109, 203, 176, 1),
                          ),
                          Spacer(),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.add_shopping_cart),
                            color: Color.fromRGBO(109, 203, 176, 1),
                          )
                        ],
                      )
                  ),
                  ListView(
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    children: <Widget> [
                      Container(
                        child: Column(
                          children: [
                            Image.network(
                              widget.aksesoris.img.toString(),
                              width: 190,
                              height: 190,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            panelBuilder: (controller) => PanelWidget(
                controller: controller,
                aksesoris: widget.aksesoris
            ),
          ),
          Positioned(
            bottom: 0,
            child: Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 3,
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(topRight: Radius.circular(30)),
                    color: Color.fromRGBO(109, 203, 176, 1),
                  ),
                  child: Center(
                    child: Text(
                      "\$" + widget.aksesoris.harga.toString(),
                      style: TextStyle(
                          fontSize: 32,
                          // color: Color(0xffF88D11)
                        color: Colors.white
                      ),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width  ,
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(30)),
                    color: Colors.black
                  ),
                    child: Center(
                    child: Text(
                      "Buy Now",
                      style: TextStyle(
                          fontSize: 20,
                          fontStyle: FontStyle.italic,
                          color: Colors.white
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
          ]
        ),
      ),
    );
  }
}
