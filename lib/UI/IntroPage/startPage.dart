import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';

class Startpage extends StatefulWidget {
  const Startpage({Key? key}) : super(key: key);

  @override
  State<Startpage> createState() => _StartpageState();
}

class _StartpageState extends State<Startpage> {
  static const images = <String>[
    'assets/images/vespa_start1.jpg',
    'assets/images/vespa_start2.jpg',
    'assets/images/vespa_start3.jpg',
    'assets/images/vespa_start4.jpg',
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    timer = Timer.periodic(Duration(milliseconds: 3500), (timer) {
      if (index < images.length) {
        if (mounted) {
          setState(() {
            index++;
            print(index);
          });
        }
      }

      if (index == images.length) {
        if (mounted) {
          setState(() {
            index = 0;
          });
        }
      }
    });

  }

  Timer? timer;
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(fit: StackFit.passthrough, children: [
          AnimatedSwitcher(
            duration: Duration(seconds: 1),
            child: Image.asset(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              key: ValueKey(images[index]),
              images[index],
              fit: BoxFit.cover,
            ),
          ),
          Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Align(
                child: Column(
                  children: [
                    Container(
                      color: Colors.black38,
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                    )
                  ],
                ),
              )),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                child: Image.asset(
                  "assets/images/vespa_logo_putih.png",
                  width: 150,
                  height: 100,
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Container(
                  width: 300,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color.fromRGBO(109, 203, 176, 1),
                  ),
                  child: Center(
                      child: Text(
                          "Login",
                        style: TextStyle(
                          color: Colors.white
                        ),
                      )
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 45),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Not a member? ", style: TextStyle(color: Colors.white),),
                    Text("Register now",
                        style: TextStyle(
                            color: Color.fromRGBO(109, 203, 176, 1),
                            fontWeight: FontWeight.bold
                        ))
                  ],
                ),
              )
            ],
          )
        ]),
      ),
    );
    ;
  }
}