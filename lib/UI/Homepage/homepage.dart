import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:flutter/material.dart';

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
      body: Column(
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
                labelColor: Colors.black,
                unselectedLabelColor: Color(0xff2B976B),
                indicatorSize: TabBarIndicatorSize.tab,
                indicator: BubbleTabIndicator(
                  indicatorHeight: 33,
                  indicatorColor: Color(0xff2B976B),
                  tabBarIndicatorSize: TabBarIndicatorSize.tab,
                  indicatorRadius: 10,
                ),
                tabs: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Color(0xff2B976B))),
                    child: Text(
                      'Disektiarmu',
                      style: TextStyle(fontSize: 14, fontFamily: 'OpenSans'),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Color(0xff2B976B))),
                    child: Text(
                      'Disektiarmu',
                      style: TextStyle(fontSize: 14, fontFamily: 'OpenSans'),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Color(0xff2B976B))),
                    child: Text(
                      'Disektiarmu',
                      style: TextStyle(fontSize: 14, fontFamily: 'OpenSans'),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Color(0xff2B976B))),
                    child: Text(
                      'Disektiarmu',
                      style: TextStyle(fontSize: 14, fontFamily: 'OpenSans'),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: double.maxFinite,
            height: 300,
            child: TabBarView(
              controller: _tabController,
              children: [
                Text("Limited"),
                Text("GTS"),
                Text("Sprint"),
                Text("Primavera"),
              ],
            ),
          ),
          Container(
            child: Text("asw"),
          )
        ],
      ),
    );
  }
}
