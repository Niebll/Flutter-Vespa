import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:vespa/Model/allVespaModel.dart';


class DetailVespa extends StatefulWidget {
  DetailVespa({Key? key, required this.vespa}) : super(key: key);
  Vespas vespa;

  @override
  State<DetailVespa> createState() => _DetailVespaState();
}

class _DetailVespaState extends State<DetailVespa> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(109, 203, 176, 1),
      body: Container(
    child: ImageSlideshow(
      width:  250,
      height: 200,
    initialPage: 0,

      children: [
        Image.network(widget.vespa.img.toString()),
        Image.network(widget.vespa.img2.toString()),
        Image.network(widget.vespa.img3.toString()),
      ],
      onPageChanged: (value) {
        print('Page changed: $value');
      },
      autoPlayInterval: 3000,
      isLoop: true,
    ),
    ));
  }
}
