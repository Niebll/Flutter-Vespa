import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:vespa/widget/aksesorisList.dart';
import 'package:vespa/widget/limitedVespaList.dart';
import 'package:vespa/widget/navigationDrawer.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 4, vsync: this);
    return Scaffold(
        drawer: NavigationDrawer(),
        appBar: AppBar(
        iconTheme: IconThemeData(
        color: Colors.black
        ),
        shadowColor: Colors.transparent,
        backgroundColor: Colors.white,
        actions: [
        Image.asset("assets/images/vespa_logo.jpg")
        ],
        title: Text("Welcome",style: GoogleFonts.bebasNeue(
        letterSpacing: 5,
        color: Colors.black
        ),),
        centerTitle: true,
        ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.only(top: 20),
              child: Text(
                'Discover Models',
                style: TextStyle(fontSize: 30),
              ),
            ),
            Container(
              child: Align(
                alignment: Alignment.centerLeft,
                child: TabBar(
                  controller: _tabController,
                  labelPadding: EdgeInsets.symmetric(horizontal: 5),
                  isScrollable: true,
                  labelColor: Colors.white,
                  unselectedLabelColor: Color.fromRGBO(86,194,159,100),
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicator: BubbleTabIndicator(
                    indicatorHeight: 33,
                    indicatorColor: Color.fromRGBO(86,194,159, 100),
                    tabBarIndicatorSize: TabBarIndicatorSize.tab,
                    indicatorRadius: 10,
                  ),
                  tabs: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Color.fromRGBO(86,194,159, 100))),
                      child: Text(
                        'Limited',
                        style: TextStyle(fontSize: 14, fontFamily: 'OpenSans'),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Color.fromRGBO(86,194,159, 100))),
                      child: Text(
                        'GTS',
                        style: TextStyle(fontSize: 14, fontFamily: 'OpenSans'),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Color.fromRGBO(86,194,159, 100))),
                      child: Text(
                        'Sprint',
                        style: TextStyle(fontSize: 14, fontFamily: 'OpenSans'),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Color.fromRGBO(86,194,159, 100))),
                      child: Text(
                        'Primavera',
                        style: TextStyle(fontSize: 14, fontFamily: 'OpenSans'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Container(
            //   width: double.maxFinite,
            //   height: 250,
            //   child: TabBarView(
            //     controller: _tabController,
            //     children: [
            //       Icon(Icons.menu),
            //       Spacer(),
            //       Text(
            //         'Welcome',
            //         style: GoogleFonts.kronaOne(fontSize: 16),
            //       ),
            //       Spacer(),
            //       ClipRRect(
            //         borderRadius: BorderRadius.circular(25.0),
            //         child: Image.asset("assets/images/account.png",
            //           width: 40.0,
            //           height: 40.0,
            //         ),
            //       )
            //     ],
            //   ),
              // Container(
              //   child: Align(
              //     alignment: Alignment.centerLeft,
              //     child: TabBar(
              //       controller: _tabController,
              //       labelPadding: EdgeInsets.symmetric(horizontal: 5),
              //       isScrollable: true,
              //       labelColor: Colors.white,
              //       unselectedLabelColor: Color.fromRGBO(86, 194, 159, 100),
              //       indicatorSize: TabBarIndicatorSize.tab,
              //       indicator: BubbleTabIndicator(
              //         indicatorHeight: 33,
              //         indicatorColor: Color.fromRGBO(86, 194, 159, 100),
              //         tabBarIndicatorSize: TabBarIndicatorSize.tab,
              //         indicatorRadius: 10,
              //       ),
              //       tabs: [
              //         Container(
              //           padding:
              //               EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              //           decoration: BoxDecoration(
              //               borderRadius: BorderRadius.circular(10),
              //               border: Border.all(
              //                   color: Color.fromRGBO(86, 194, 159, 100))),
              //           child: Text(
              //             'Limited',
              //             style:
              //                 TextStyle(fontSize: 14, fontFamily: 'OpenSans'),
              //           ),
              //         ),
              //         Container(
              //           padding:
              //               EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              //           decoration: BoxDecoration(
              //               borderRadius: BorderRadius.circular(10),
              //               border: Border.all(
              //                   color: Color.fromRGBO(86, 194, 159, 100))),
              //           child: Text(
              //             'GTS',
              //             style:
              //                 TextStyle(fontSize: 14, fontFamily: 'OpenSans'),
              //           ),
              //         ),
              //         Container(
              //           padding:
              //               EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              //           decoration: BoxDecoration(
              //               borderRadius: BorderRadius.circular(10),
              //               border: Border.all(
              //                   color: Color.fromRGBO(86, 194, 159, 100))),
              //           child: Text(
              //             'Sprint',
              //             style:
              //                 TextStyle(fontSize: 14, fontFamily: 'OpenSans'),
              //           ),
              //         ),
              //         Container(
              //           padding:
              //               EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              //           decoration: BoxDecoration(
              //               borderRadius: BorderRadius.circular(10),
              //               border: Border.all(
              //                   color: Color.fromRGBO(86, 194, 159, 100))),
              //           child: Text(
              //             'Primavera',
              //             style:
              //                 TextStyle(fontSize: 14, fontFamily: 'OpenSans'),
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              Container(
                width: double.maxFinite,
                height: 250,
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    LimitedVespaList(),
                    Text("GTS"),
                    Text("Sprint"),
                    Text("Primavera"),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10, left: 10),
                child: Row(
                  children: [
                    Text(
                      "Featured Accesories",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    Spacer(),
                    Text(
                      "View More",
                      style: TextStyle(color: Colors.grey),
                    )
                  ],
                ),
              ),
              Container(child: AksesorisList())
            ],
          ),
        ),
      ),
    );
  }
}
