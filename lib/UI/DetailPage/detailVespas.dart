import 'package:flutter/material.dart';
import 'package:vespa/Model/allVespaModel.dart';

class DetailVespa extends StatefulWidget {
  // final String vespas;
  DetailVespa({Key? key, required this.vespas, required this.index}) : super(key: key);
  Vespas vespas;
  int index;
  @override
  State<DetailVespa> createState() => _DetailVespaState();
}

class _DetailVespaState extends State<DetailVespa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text(widget.vespas.all[widget.index].name.toString()),
    );
  }
}
