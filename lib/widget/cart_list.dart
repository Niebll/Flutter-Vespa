import 'package:flutter/material.dart';
import 'package:vespa/Sqflite/cart_vespa.dart';
import 'package:vespa/Sqflite/database_helper.dart';

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
      appBar: AppBar(
        title: Text("Cart"),
      ),
      body: ListView.builder(
          itemCount: dataCartVespaList.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.all(10),
                height: 100,
                width: MediaQuery.of(context).size.width,
                child: Card(
                  color: Colors.white,
                  child: Row(
                    children: [
                      // Container(
                      //   padding: EdgeInsets.all(10),
                      //   child: Center(
                      //       child: Image.network(
                      //           dataCartVespaList[index].imgthumbnail.toString())),
                      // ),
                      Container(
                        child: Text(
                          dataCartVespaList[index].title.toString(),
                          style: TextStyle(color: Colors.black, fontSize: 12),
                        ),
                      ),
                      Spacer(),
                      IconButton(onPressed: (){
                        showDeleteDialog(context, index);
                      }, icon: Icon(Icons.delete, color: Colors.red))
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
