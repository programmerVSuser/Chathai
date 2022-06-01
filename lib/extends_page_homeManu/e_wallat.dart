import 'package:chathai/controll_login-regitter/connext_login-regiter_fribase.dart';
import 'package:chathai/models/getPoint_user_modal.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class eWallat extends StatefulWidget {
  const eWallat({Key key}) : super(key: key);

  @override
  _eWallatState createState() => _eWallatState();
}

class _eWallatState extends State<eWallat> {
  //String result;
  List<Widget> widd = [];
  List<ProductpointUser> productpointUserModals = [];
  List<ProductpointUser> productpointUserModals2 = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    inputData();
  }

  void inputData() async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    final User user = auth.currentUser;
    final Uid = user.uid;
    print("Uid $Uid");
    if (Uid == null) {
      //
    } else {
      final data = await Firebase.initializeApp().then((value) async {
        await FirebaseFirestore.instance
            .collection('PointUser')
            .doc(Uid)
            .collection('Point')
            .snapshots()
            .listen((event) {
          print('Snap = ${event.docs}');
          int indexs = 0;
          for (var snap in event.docs) {
            Map<String, dynamic> map = snap.data();
            print('map = ${map}');
            ProductpointUser modal = ProductpointUser.fromMap(map);
            productpointUserModals.add(modal);
            var A = modal;
            print('modal$modal');
            print('product$productpointUserModals');
            print('name product = ${modal.point}');
            print('name  = ${A.point}');

            setState(() {
              widd.add(creatWid(modal, indexs));
            });
            indexs++;
          }
        });
      });
    }
  }

  Widget creatWid(ProductpointUser modal, int indexs) => GestureDetector(
        child: Card(
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                    width: 80,
                    height: 80,
                    child: Image.asset("image/point.jpg")),
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
            'Point',
            style: TextStyle(color: Colors.black, fontSize: 18),
          )),
      body: Container(
        color: Colors.grey[400],
        child: Container(
          child: widd.length == 0
          //CircularProgressIndicator()
              ? Center(child: Container(
            padding: EdgeInsets.only(top: 200),
            child: Column(
              children: [
                Container(height: 30,width: 30,
                  child: CircularProgressIndicator(),
                ),
                SizedBox(height: 25,),
                Container(
                  child: Text("No Information Point",
                  style: TextStyle(fontSize: 16),),
                )
              ],
            ),
          ))
              : GridView.extent(maxCrossAxisExtent: 150, children: widd),
        ),
      ),
    );
  }
}
