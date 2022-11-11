import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:vespa/Model/aksesorisModel.dart';

import '../../widget/panelWidgetAksesoris.dart';

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
    final paneHeightOpen = MediaQuery.of(context).size.height * 0.55;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            SlidingUpPanel(
            minHeight: paneHeightClosed,
            maxHeight: paneHeightOpen,
            boxShadow: [BoxShadow(
              color: Colors.white
            )],
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
            bottom: 7,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10),
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.black,
                    ),
                    child: Center(
                      child: Icon(Icons.shop_outlined, color: Colors.white,)
                    ),
                  ),
                ),
                Container(
                  width: 260  ,
                  height: 60 ,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white
                  ),
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(width: 20,),
                        Text("£ ${widget.aksesoris.harga.toString()}.00", style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),),
                        Spacer(),
                        Text("|", style: TextStyle(
                          fontSize: 18
                        ),),
                        Spacer(),
                        Text(
                          "Buy Now",
                          style: TextStyle(
                              fontSize: 20,
                          ),
                        ),
                        SizedBox(width: 20,)
                      ],
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
