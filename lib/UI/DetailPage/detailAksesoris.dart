import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:vespa/Model/aksesorisModel.dart';

import '../../Sqflite/cart_vespa.dart';
import '../../Sqflite/database_helper.dart';
import '../../widget/panelWidgetAksesoris.dart';
import '../BuyingPage/payment.dart';

class AksesorisDetail extends StatefulWidget {
  AksesorisDetail({Key? key, required this.aksesoris}) : super(key: key);
  Aksesoris aksesoris;

  @override
  State<AksesorisDetail> createState() => _AksesorisDetailState();
}

class _AksesorisDetailState extends State<AksesorisDetail> {
  bool checkExist = false;

  Future read() async {
    checkExist = await VespaDatabase.instance.read(widget.aksesoris.name.toString());
    setState(() {});
  }

  Future addData() async {
    var list;
    list = VespaCart(
        title: widget.aksesoris.name.toString(),
        imgthumbnail: widget.aksesoris.img.toString(),
        harga: widget.aksesoris.harga.toString(),
        primaryColor: "ffffff"
    );
    await VespaDatabase.instance.create(list);
    setState(() {
      checkExist = true;
    });
  }

  Future deleteData() async {
    await VespaDatabase.instance.delete(widget.aksesoris.name.toString());
    setState(() {
      checkExist = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    read();
  }

  @override
  Widget build(BuildContext context) {
    final paneHeightClosed = MediaQuery.of(context).size.height * 0.5;
    final paneHeightOpen = MediaQuery.of(context).size.height * 0.6;
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
            child: Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              height: 80,
              child: Row(children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10),
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: checkExist
                            ? Colors.red
                            : Colors.grey,
                        boxShadow: [
                          BoxShadow(color: Colors.grey, spreadRadius: 0.5)
                        ]),
                    child: Center(
                        child: IconButton(onPressed: () {
                          checkExist ? deleteData() : addData();
                        },
                            icon: Icon(
                                Icons.add_shopping_cart,
                                color: Colors.white
                            )
                        )
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // Navigator.pushReplacement(
                    //     context,
                    //     MaterialPageRoute(
                    //       builder: (context) => PaymentPage(
                    //           harga: widget.aksesoris.harga),
                    //     ));
                  },
                  child: Container(
                    width: 260,
                    height: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color.fromRGBO(109, 203, 176, 1),
                        boxShadow: [
                          BoxShadow(color: Colors.grey, spreadRadius: 0.5)
                        ]),
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          NumberFormat.simpleCurrency(locale: "EUR", decimalDigits: 0).format(widget.aksesoris.harga),
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                              color: Colors.white
                          ),
                        ),
                        Spacer(),
                        Text(
                          "|",
                          style: TextStyle(fontSize: 18),
                        ),
                        Spacer(),
                        Text(
                          "Buy Now",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        )
                      ],
                    ),
                  ),
                )
              ]),
            )
        )
          ]
        ),
      ),
    );
  }
}
