import 'package:auto_size_text/auto_size_text.dart';
import 'package:chathai/models/product_modal.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'exten_home_click/show_conten.dart';

class menuInHome extends StatefulWidget {
  @override
  _menuInHomeState createState() => _menuInHomeState();
}

class _menuInHomeState extends State<menuInHome> {

  List<Widget> wid = [];
  List<ProductModal> productModals = [];
  List<ProductModal> productModals2 = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readData();
  }

//=================================================================================================
  void readData() async {
    final data = await Firebase.initializeApp().then((value) async {
      print('OK');
      await FirebaseFirestore.instance
          .collection('Product')
          .orderBy('name')
          .snapshots()
          .listen((event) {
        print('Snap = ${event.docs}');
        int indexs = 0;

        for (var snap in event.docs) {
          Map<String, dynamic> map = snap.data();
          print('map = ${map}');
          ProductModal modal = ProductModal.fromMap(map);
          productModals.add(modal);
          //nane product
           var A = modal;
           print('modal$modal');
          print('product$productModals');
          print('name product = ${modal.name}');
          print('name  = ${A.name}');
          print('price${modal.price}');
          setState(() {
            wid.add(creatWid(modal, indexs));
          });
          indexs++;
        }
      });
    }); //get the data
  }
//==================================================================================================
  Widget creatWid(ProductModal modal, int indexs) => GestureDetector(
        onTap: () {
          print('Click $indexs');
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => showConten(
                        productModal: productModals[indexs],
                      )));
        },
        child: Card(
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 15,
                ),
                Container(
                    width: 100, height: 100, child: Image.network(modal.path)),
                SizedBox(
                  height: 10,
                ),
                Expanded(child: AutoSizeText("${modal.name}")),
                SizedBox(
                  height: 5,
                ),
                Expanded(child: AutoSizeText("฿ ${modal.price}",style:TextStyle(color: Colors.green[400],fontSize: 16),)),
                SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          centerTitle: true,
          title: Text(
            'Product Chathai Club',
            style: TextStyle(color: Colors.black, fontSize: 18),
          )),
      body: Container(
        color: Colors.grey[400],
        child: Container(
          child: wid.length == 0
              ? Center(child: CircularProgressIndicator())
              : GridView.extent(maxCrossAxisExtent: 300, children: wid),
        ),
      ),
    );
  }

  // void Search() async {
  //   final data = await Firebase.initializeApp().then((value) async {
  //     await FirebaseFirestore.instance
  //         .collection('Product')
  //         .orderBy('name')
  //         .snapshots()
  //         .listen((event) {
  //       int indexs = 0;
  //
  //       for (var snap in event.docs) {
  //         Map<String, dynamic> map = snap.data();
  //         ProductModal modal2 = ProductModal.fromMap(map);
  //         productModals2.add(modal2);
  //         //nane product
  //         var A = modal2;
  //         print('name  = ${A.name}');
  //         showDialog(
  //             context: context,
  //             builder: (_) => AlertDialog(
  //               title: Text(modal2.name),
  //             )
  //         );
  //         setState(() {
  //           wid.add(creatWid(modal2, indexs));
  //         });
  //         indexs++;
  //       }
  //     });
  //   }
  //   ); //get the data
  // }
}
