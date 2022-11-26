import 'package:configurable_expansion_tile_null_safety/configurable_expansion_tile_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import '../../widget/Colors/colors.dart';
import '../../widget/navigationDrawer.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/mdi.dart';
import 'package:iconify_flutter/icons/uil.dart';
import 'package:iconify_flutter/icons/ic.dart';
import 'package:iconify_flutter/icons/emojione_monotone.dart';

class OutletPage extends StatefulWidget {
  const OutletPage({Key? key}) : super(key: key);

  @override
  State<OutletPage> createState() => _OutletPageState();
}

final Uri _url = Uri.parse('https://www.google.com/maps/place/Scooterin+Concessionario/@45.6500779,13.7777245,18z/data=!4m5!3m4!1s0x477b6b8dd32215c1:0x65529908a68e08f2!8m2!3d45.6500521!4d13.7785495');

class _OutletPageState extends State<OutletPage> {
  @override
  Widget build(BuildContext context) {
    final paneHeightClosed = MediaQuery.of(context).size.height * 0.58;
    final paneHeightOpen = MediaQuery.of(context).size.height * 1;
    return Scaffold(
        drawer: NavigationDrawer(),
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          shadowColor: Colors.transparent,
          backgroundColor: Colors.white,
          actions: [Image.asset("assets/images/vespa_logo.jpg")],
          title: Text(
            "Outlet",
            style: GoogleFonts.bebasNeue(letterSpacing: 5, color: Colors.black),
          ),
          centerTitle: true,
        ),
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            SlidingUpPanel(
              minHeight: paneHeightClosed,
              maxHeight: paneHeightOpen,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30), topLeft: Radius.circular(30)),
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Container(
                        padding: EdgeInsets.zero,
                        child: Center(
                          child: ImageSlideshow(
                            indicatorBackgroundColor: Colors.transparent,
                            indicatorColor: Colors.transparent,
                            // width: MediaQuery.of(context).size.width * 10,
                            height: MediaQuery.of(context).size.height / 3.25,
                            // height: 325,
                            initialPage: 0,
                            children: [
                              Image.network(
                                  "https://lh5.googleusercontent.com/p/AF1QipPzMPb53r7K73hImSW1Y6GtwjgO1ZA5wv2TRQi6=s547-k-no"),
                              Image.network(
                                  "https://lh5.googleusercontent.com/p/AF1QipOUx7fq2N-VAAgXTOjf7BSwXMl6huWs6FbN5o5D=s547-k-no"),
                              Image.network(
                                  "https://lh5.googleusercontent.com/p/AF1QipP4oE3mlb9NoLG3t3RZ4sKJ8mfr1XGyMtIEApg5=w449-h298-k-no"),
                            ],
                            onPageChanged: (value) {
                              print('Page changed: $value');
                            },
                            autoPlayInterval: 3000,
                            isLoop: true,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              panelBuilder: (controller) => PanelWidgetOutlet(
                controller: controller,
              ),
            ),
          ],
        )
    );
  }
}

class PanelWidgetOutlet extends StatefulWidget {
  final ScrollController controller;

  const PanelWidgetOutlet({
    Key? key,
    required this.controller,
  }) : super(key: key);

//
  @override
  State<PanelWidgetOutlet> createState() => _PanelWidgetOutletState();
}

class _PanelWidgetOutletState extends State<PanelWidgetOutlet>
    with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 30, left: 30, top: 10),
          child: Container(
            height: 50,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20)),
            child: TabBar(
              controller: tabController,
              // labelPadding: EdgeInsets.symmetric(horizontal: 5),
              labelColor: Colors.black,
              indicatorWeight: 3,
              indicatorColor: MainColor(),
              unselectedLabelColor: Colors.black,
              indicatorSize: TabBarIndicatorSize.label,
              tabs: [
                Text(
                  'Overview',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Gallery',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        Container(
          width: double.maxFinite,
          height: double.maxFinite,
          child: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            controller: tabController,
            children: [
              Overview(),
              Container(),
            ],
          ),
        ),
      ],
    );
  }
}

class Overview extends StatelessWidget {
  const Overview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Scooterin Concessionario",
            style: GoogleFonts.bebasNeue(fontSize: 20),
          ),
          SizedBox(
            height: 20,
          ),
          DetailOutlet(text: "Via Emo Tarabochia, 1, 34125 Trieste TS, Italy", icon: Mdi.map_marker),
          ConfigurableExpansionTile(
            headerExpanded: Flexible(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Iconify(Uil.clock, color: MainColor()),
                SizedBox(
                  width: 10,
                ),
                Text("Open at"),
                SizedBox(
                  width: 10,
                ),
                Iconify(Ic.baseline_keyboard_arrow_up) // widget
              ],
            )),
            header: Flexible(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Iconify(Uil.clock, color: MainColor()),
                SizedBox(
                  width: 10,
                ),
                Text("Open at"),
                SizedBox(
                  width: 10,
                ),
                Iconify(Ic.baseline_keyboard_arrow_down) // widget
              ],
            )),
            childrenBody: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  OpensAt(hari: "Monday", open: "9AM – 5PM"),
                  OpensAt(hari: "Tuesday", open: "9AM – 5PM"),
                  OpensAt(hari: "Wednesday", open: "9AM – 5PM"),
                  OpensAt(hari: "Thursday", open: "9AM – 5PM"),
                  OpensAt(hari: "Friday", open: "9AM – 5PM"),
                  OpensAt(hari: "Saturday", open: "Closed"),
                  OpensAt(hari: "Sunday", open: "Closed"),
                ],
              ),
            ),
          ),
          SizedBox(height: 10,),
          DetailOutlet(text: "http://www.piaggiotrieste.com", icon: EmojioneMonotone.globe_showing_europe_africa),
          DetailOutlet(text: "+39 040 349 0092", icon: Ic.baseline_phone),
          Image.asset("assets/images/mapsss.png")
        ],
      ),
    );
  }
}

// Future<void> _launchUrl() async {
//   if (!await launchUrl(_url)) {
//     throw 'Could not launch $_url';
//   }
// }

Widget DetailOutlet(
{
  required String text,
  required String icon
}
    ) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 10),
    child: Row(
      children: [
        Iconify(icon, color: MainColor(),),
        SizedBox(
          width: 10,
        ),
        Text(text)
      ],
    ),
  );
}

Widget OpensAt(
    {required String hari, required String open, BuildContext? context}) {
  return Padding(
    padding: const EdgeInsets.only(left: 20, top: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(hari),
        Text(open),
      ],
    ),
  );
}
