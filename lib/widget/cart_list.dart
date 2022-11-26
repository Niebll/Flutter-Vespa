import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vespa/Sqflite/cart_vespa.dart';
import 'package:vespa/Sqflite/database_helper.dart';
import 'HexColor.dart';
import 'navigationDrawer.dart';

class CartList extends StatefulWidget {
  const CartList({Key? key}) : super(key: key);

  @override
  State<CartList> createState() => _CartListState();
}

class _CartListState extends State<CartList> {
  List<VespaCart> dataCartVespaList = [];
  bool isLoading = false;
  bool checkExist = false;

  Future read() async {
    setState(() {
      isLoading = true;
      print(dataCartVespaList);
    });
    dataCartVespaList = await VespaDatabase.instance.readAll();
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    dataCartVespaList;
    super.initState();
    read();
  }

  showDeleteDialog(BuildContext context, int Index) {
    // set up the button
    Widget cancelButton = TextButton(
      child: Text("Tidak"),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    Widget okButton = TextButton(
      child: Text("Hapus"),
      onPressed: () async {
        setState(() {
          isLoading = true;
        });
        await VespaDatabase.instance.delete(dataCartVespaList[Index].title!);
        read();
        setState(() {
          isLoading = false;
        });
        Navigator.of(context, rootNavigator: true).pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      content: Text("Apakah anda yakin ingin menghapus?"),
      actions: [cancelButton, okButton],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: NavigationDrawer(),
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          shadowColor: Colors.transparent,
          backgroundColor: Colors.white,
          actions: [Image.asset("assets/images/vespa_logo.jpg")],
          title: Text(
            "Cart",
            style: GoogleFonts.bebasNeue(letterSpacing: 5, color: Colors.black),
          ),
          centerTitle: true,
        ),
        backgroundColor: Colors.white,
        body: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 0,
                      mainAxisSpacing: 10,
                      mainAxisExtent: 230,
                    ),
                    scrollDirection: Axis.vertical,
                    itemCount: dataCartVespaList.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        // onTap: () {
                        //   Navigator.push(context,
                        //       MaterialPageRoute(builder: (context) {
                        //         return DetailVespaAll(
                        //           vespas: vespas.data!,
                        //           index: index,
                        //         );
                        //       })
                        //     );
                        // },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 1,
                                  blurRadius: 1,
                                )
                              ]),
                          margin: EdgeInsets.all(10),
                          width: 160,
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  child: Stack(
                                    children: [
                                      Container(
                                        width: MediaQuery.of(context).size.width,
                                        height: 140,
                                        // color: Colors.amber,
                                        child: Stack(
                                          children: [
                                            Container(
                                              height: 115,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                BorderRadius.circular(20),
                                                color: HexColor(dataCartVespaList[index].primaryColor.toString()),
                                                // color: Colors.white,
                                              ),
                                            ),
                                            Container(
                                              width:
                                              MediaQuery.of(context).size.width,
                                              height: 160,
                                              child: Image.network(dataCartVespaList[index].imgthumbnail.toString())
                                            )
                                          ],
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.symmetric(horizontal: 5),
                                        child: Column(
                                          children: [
                                            SizedBox(
                                              height: 120,
                                            ),
                                            Container(
                                              width:
                                              MediaQuery.of(context).size.width,
                                              height: 70,
                                              padding: const EdgeInsets.all(10.0),
                                              child: Text( dataCartVespaList[index].title.toString(),
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold),
                                              ),
                                            ),
                                            Text(
                                              "${dataCartVespaList[index].harga} \€",
                                            )
                                          ],
                                        ),
                                      ),
                                      Positioned(
                                        right: 0,
                                        child: IconButton(onPressed: (){
                                          showDeleteDialog(context, index);
                                        }, icon: Icon(Icons.delete, color: Colors.red)),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }
                    )

    );
  }
}