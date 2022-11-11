import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:vespa/Model/allVespaModel.dart';

class DetailVespaPrimavera extends StatefulWidget {
  // final String vespas;
  DetailVespaPrimavera({Key? key, required this.vespas, required this.index})
      : super(key: key);
  Vespas vespas;
  int index;

  @override
  State<DetailVespaPrimavera> createState() => _DetailVespaPrimavera();
}

class _DetailVespaPrimavera extends State<DetailVespaPrimavera> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    child: IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: Icon(Icons.arrow_back_ios),
                      color: Color.fromRGBO(109, 203, 176, 1),
                    )),
                Center(
                  child: ImageSlideshow(
                    width: 325,
                    height: 325,
                    initialPage: 0,
                    children: [
                      Image.network(widget.vespas.primavera[widget.index].img.toString()),
                      Image.network(widget.vespas.primavera[widget.index].img2.toString()),
                      Image.network(widget.vespas.primavera[widget.index].img3.toString()),
                    ],
                    onPageChanged: (value) {
                      print('Page changed: $value');
                    },
                    autoPlayInterval: 3000,
                    isLoop: true,
                  ),
                ),
                Text(widget.vespas.primavera[widget.index].name.toString()),
                SizedBox(height: 10),
                Text(widget.vespas.primavera[widget.index].descripstion.toString()),
                Text("Features"),
                Container(
                  height: 150,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: widget.vespas.primavera[widget.index].fiture.length,
                      itemBuilder: (context, index) {
                        return Row(
                          children: [
                            Image.network(
                              widget.vespas.primavera[widget.index].fiture[index]
                                  .fiturimg
                                  .toString(),
                              width: 80,
                              height: 80,
                            ),
                            Text(widget
                                .vespas.primavera[widget.index].fiture[index].fitur
                                .toString())
                          ],
                        );
                      }),
                ),
              ],
            ),
          ),
        ));
  }
}
