import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../widget/Colors/colors.dart';

class PaymentPage extends StatefulWidget {
  PaymentPage({Key? key, required this.harga}) : super(key: key);
  int harga;
  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  TextEditingController _addressController = new TextEditingController();
  TextEditingController _mastercardController = new TextEditingController();
  DateTime? _dateTime;

  void _bukaCalendar() {
    showDatePicker(
            builder: (context, child) {
              return Theme(
                  data: Theme.of(context).copyWith(
                    colorScheme: ColorScheme.light(
                      primary: MainColor()!,
                      onPrimary: Colors.white,
                      onSurface: Colors.black,
                    ),
                    textButtonTheme: TextButtonThemeData(
                      style: TextButton.styleFrom(primary: MainColor()),
                    ),
                  ),
                  child: child!);
            },
            context: context,
            initialDate: DateTime.now().add(new Duration(days: 3)),
            firstDate: DateTime.now().add(new Duration(days: 3)),
            fieldHintText: "dd/yy/mm",
            lastDate: DateTime.now().add(new Duration(days: 14)))
        .then((value) {
      setState(() {
        _dateTime = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        shadowColor: Colors.transparent,
        backgroundColor: Colors.white,
        leading: BackButton(
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "Payment",
          style: GoogleFonts.bebasNeue(letterSpacing: 5, color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 30.0),
            child: Text("Address"),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Container(
              padding: EdgeInsets.only(left: 10),
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: TextFieldColor(),
              ),
              child: TextField(
                keyboardType: TextInputType.streetAddress,
                controller: _addressController,
                decoration: InputDecoration(border: InputBorder.none),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30.0),
            child: Text("Delivery Date"),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: GestureDetector(
              onTap: () {
                return _bukaCalendar();
              },
              child: Container(
                padding: EdgeInsets.only(left: 10),
                height: 50,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: TextFieldColor(),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Text(DateFormat.yMMMMd('eng').format(_dateTime!)),
                    Text(_dateTime == null
                        ? 'Nothing has been picked yet'
                        : DateFormat.yMMMMd('eng').format(_dateTime!)),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30.0),
            child: Text("Card Number"),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Container(
              padding: EdgeInsets.only(left: 10),
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: TextFieldColor(),
              ),
              child: TextField(
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  CardNumberFormatter(),
                  LengthLimitingTextInputFormatter(19)
                ],
                controller: _mastercardController,
                decoration: InputDecoration(
                    icon: Image.asset(
                      "assets/images/mastercard.png",
                      height: 20,
                    ),
                    border: InputBorder.none),
              ),
            ),
          ),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 30, top: 10),
                    child: Text(
                      "Expiration",
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 30.0, right: 30, top: 10),
                    child: Container(
                      padding: EdgeInsets.only(left: 10),
                      height: 50,
                      width: MediaQuery.of(context).size.width / 4,
                      decoration: BoxDecoration(
                          color: TextFieldColor(),
                          borderRadius: BorderRadius.circular(8)),
                      child: TextField(
                        inputFormatters: [
                          CardExpirationFormatter(),
                          LengthLimitingTextInputFormatter(5)
                        ],
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "MM/YY",
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Text(
                      "CVV",
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 30, top: 10),
                    child: Container(
                      padding: EdgeInsets.only(left: 10),
                      height: 50,
                      width: MediaQuery.of(context).size.width / 4,
                      decoration: BoxDecoration(
                          color: TextFieldColor(),
                          borderRadius: BorderRadius.circular(8)),
                      child: TextField(
                        inputFormatters: [LengthLimitingTextInputFormatter(3)],
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "XXX",
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Row(
              children: [
                Text("Subtotal"),
                Spacer(),
                Text(widget.harga.toString()+ "\€"),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              children: [
                Text("Taxes"),
                Spacer(),
                Text("100\€"),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              children: [
                Text(
                  "Total",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Spacer(),
                Text(
                  "${widget.harga + 100}\€",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ],
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 14),
              height: 70,
              decoration: BoxDecoration(
                  color: MainColor(), borderRadius: BorderRadius.circular(15)),
              child: Center(
                child: Row(
                  children: [
                    Text(
                      "Place Order",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white),
                    ),
                    Spacer(),
                    Text(
                      ">",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    )
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 40,
          )
        ],
      ),
    );
  }
}

class CardNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue previousValue,
    TextEditingValue nextValue,
  ) {
    var inputText = nextValue.text;

    if (nextValue.selection.baseOffset == 0) {
      return nextValue;
    }

    var bufferString = new StringBuffer();
    for (int i = 0; i < inputText.length; i++) {
      bufferString.write(inputText[i]);
      var nonZeroIndexValue = i + 1;
      if (nonZeroIndexValue % 4 == 0 && nonZeroIndexValue != inputText.length) {
        bufferString.write('-');
      }
    }

    var string = bufferString.toString();
    return nextValue.copyWith(
      text: string,
      selection: new TextSelection.collapsed(
        offset: string.length,
      ),
    );
  }
}

class CardExpirationFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final newValueString = newValue.text;
    String valueToReturn = '';

    for (int i = 0; i < newValueString.length; i++) {
      if (newValueString[i] != '/') valueToReturn += newValueString[i];
      var nonZeroIndex = i + 1;
      final contains = valueToReturn.contains(RegExp(r'\/'));
      if (nonZeroIndex % 2 == 0 &&
          nonZeroIndex != newValueString.length &&
          !(contains)) {
        valueToReturn += '/';
      }
    }
    return newValue.copyWith(
      text: valueToReturn,
      selection: TextSelection.fromPosition(
        TextPosition(offset: valueToReturn.length),
      ),
    );
  }
}
