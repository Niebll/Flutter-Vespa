import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vespa/UI/Catalogue/catalogueAksesoris.dart';
import 'package:vespa/UI/ProfilePage/profilepage.dart';
import 'package:vespa/widget/aksesorisList.dart';
import 'package:vespa/widget/gtsVespasList.dart';
import 'package:vespa/widget/limitedVespaList.dart';
import 'package:vespa/widget/navigationDrawer.dart' as drawer;
import 'package:vespa/widget/primaveraVespasList.dart';
import 'package:vespa/widget/sprintVespaList.dart';

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
      drawer: drawer.NavigationDrawer(),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        shadowColor: Colors.transparent,
        backgroundColor: Colors.white,
        actions: [
          GestureDetector(
            child: Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50)),
                child: Image.asset("assets/images/profile.jpg")),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ProfilePage()));
            },
          )
        ],
        title: Text(
          "Welcome",
          style: GoogleFonts.bebasNeue(letterSpacing: 5, color: Colors.black),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(left: 10),
              margin: EdgeInsets.only(top: 20, bottom: 10),
              child: Text(
                'Choose Your Vespa',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
                  unselectedLabelColor: Colors.black,
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicator: BubbleTabIndicator(
                    indicatorHeight: 35,
                    indicatorColor: Color.fromRGBO(86, 194, 159, 100),
                    tabBarIndicatorSize: TabBarIndicatorSize.tab,
                    indicatorRadius: 10,
                  ),
                  tabs: [
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.black12)),
                      child: Text(
                        'Limited',
                        style: TextStyle(fontSize: 14, fontFamily: 'OpenSans'),
                      ),
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.black12)),
                      child: Text(
                        'GTS',
                        style: TextStyle(fontSize: 14, fontFamily: 'OpenSans'),
                      ),
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.black12)),
                      child: Text(
                        'Sprint',
                        style: TextStyle(fontSize: 14, fontFamily: 'OpenSans'),
                      ),
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.black12)),
                      child: Text(
                        'Primavera',
                        style: TextStyle(fontSize: 14, fontFamily: 'OpenSans'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: double.maxFinite,
              height: 250,
              child: TabBarView(
                physics: NeverScrollableScrollPhysics(),
                controller: _tabController,
                children: [
                  LimitedVespaList(),
                  GtsVespaList(),
                  SprintVespasList(),
                  PrimaveraVespasList(),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  right: 10, left: 10, top: 20, bottom: 20),
              child: Row(
                children: [
                  Text(
                    "Featured Accesories",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CatalogueAksesoris(),
                          ));
                    },
                    child: Text(
                      "View More",
                      style: TextStyle(color: Colors.grey),
                    ),
                  )
                ],
              ),
            ),
            Container(child: AksesorisList())
          ],
        ),
      ),
    );
  }
}
