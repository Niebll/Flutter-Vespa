  import 'dart:async';

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
                padding: EdgeInsets.all(25),
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Align(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Find your",
                          style: TextStyle(color: Colors.white, fontSize: 28)),
                      SizedBox(height: 5),
                      Text("favorite Hotel to stay",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 28,
                              fontWeight: FontWeight.w900)),
                      SizedBox(height: 20),
                      Spacer(),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 55,
                        margin: EdgeInsets.only(top: 50),
                        padding: EdgeInsets.only(left: 35, right: 35),
                      ),
                    ],
                  ),
                )),
          ]),
        ),
      );
      ;
    }
  }
