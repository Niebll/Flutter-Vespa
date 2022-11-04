import 'package:flutter/material.dart';
import 'package:vespa/Model/aksesorisModel.dart';

class PanelWidget extends StatelessWidget {
  final ScrollController controller;
  final Aksesoris aksesoris;

  const PanelWidget({
    Key? key,
    required this.controller,
    required this.aksesoris
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.only(topRight: Radius.circular(30), topLeft: Radius.circular(30)),
      color: Color.fromRGBO(109, 203, 176, 1),
    ),
    child: ListView(
      padding: EdgeInsets.zero,
      controller: controller,
      children: <Widget>[
        SizedBox(height: 36,),
        buildAboutText(),
        SizedBox(width: 24,)
      ],
    ),
  );

  Widget buildAboutText() => Container(
    padding: EdgeInsets.symmetric(horizontal: 24),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
            aksesoris.name.toString(),
            style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontStyle: FontStyle.italic
              ),
        ),
        SizedBox(height: 12),
        Text(
          aksesoris.description.toString(),
            style: TextStyle(
                color: Colors.white,
                fontStyle: FontStyle.italic
            )
        ),
        Container(
            width: 400,
            height: 80,
            child: CustomRadio()
        ),
      ],
    ),
  );
}



class CustomRadio extends StatefulWidget {
  @override
  createState() {
    return CustomRadioState();
  }
}

class CustomRadioState extends State<CustomRadio> {
  List<RadioModel> sampleData = <RadioModel>[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    sampleData.add(RadioModel(false, 'S'));
    sampleData.add(RadioModel(false, 'M'));
    sampleData.add(RadioModel(false, 'L'));
    sampleData.add(RadioModel(false, 'XL'));
    sampleData.add(RadioModel(false, 'XXL'));
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: sampleData.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          splashColor: Colors.blueAccent,
          onTap: () {
            setState(() {
              sampleData.forEach((element) => element.isSelected = false);
              sampleData[index].isSelected = true;
            });
          },
          child: RadioItem(sampleData[index]),
        );
      },
    );
  }
}

class RadioItem extends StatelessWidget {
  final RadioModel _item;
  RadioItem(this._item);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            height: 30,
            child: Center(
              child: Text(_item.buttonText,
                  style: TextStyle(
                      color:
                      _item.isSelected ? Color.fromRGBO(109, 203, 176, 1) : Colors.white,
                      //fontWeight: FontWeight.bold,
                      fontSize: 15.0)),
            ),
            decoration: BoxDecoration(
              color: _item.isSelected
                  ? Colors.white
                  : Colors.transparent,
              border: Border.all(
                  width: 1.0,
                  color: _item.isSelected
                      ? Colors.grey
                      : Colors.white),

                borderRadius: BorderRadius.circular(10)
            ),
          ),
        ],
      ),
    );
  }
}

class RadioModel {
  bool isSelected;
  final String buttonText;

  RadioModel(this.isSelected, this.buttonText);
}