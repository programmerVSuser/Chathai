import 'package:auto_size_text/auto_size_text.dart';
import 'package:chathai/controll_login-regitter/connext_login-regiter_fribase.dart';
import 'package:chathai/models/getPoint_user_modal.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';


class scenQR extends StatefulWidget {
  const scenQR({Key key}) : super(key: key);

  @override
  _scenQRState createState() => _scenQRState();
}
class _scenQRState extends State<scenQR> {
  String _scanBarcode = 'Unknown';
  String _stringCha = 'chathai';
  String _pointController;
 //List<ProductpointUser> productpointUserModals = [];
  List<ProductpointUser> productpointUserModals2 = [];

  
  @override
  void initState() {
    super.initState();
  }
  Future<void> getPointUser()async{
    final data = await Firebase.initializeApp().then((value) async {
      final User user = auth.currentUser;
      final Uid = user.uid;
      print("Uid $Uid");
      await FirebaseFirestore.instance
          .collection('PointUser')
          .doc(Uid)
          .collection('Point')
          .snapshots()
          .listen((event) {
        int indexsPointUsera = 0;
        for (var snap in event.docs) {
          Map<String, dynamic> map = snap.data();
          print('map = ${map}');
          ProductpointUser modal = ProductpointUser.fromMap(map);
          productpointUserModals2.add(modal);
          String point = modal.point;
          indexsPointUsera++;
          print(point);
          print("indexsPointUser==$indexsPointUsera");
        }
        if (indexsPointUsera++ == 10) {
          var indexsPointUserrr = 0;
          print(indexsPointUserrr);
          if (indexsPointUserrr == 0) {
            print("Ok");
            scanBarcodeNormal();
          }
        }else{
         // showAlert3('*Your score is not enough', 'Press the OK button to add the score..');
        }
      });
    });
  }

  Future<void> scanBarcodeNormal() async {
    String barcodeScanRes;
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.BARCODE);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }
    if (!mounted) return;
    setState(() {
      _scanBarcode = barcodeScanRes;
      print("######################$_scanBarcode");
      if(_stringCha == _scanBarcode){
        print("OKKKKKKKK");
        DELETEPOINTUSER();
      }else{
        print("Not OKKKKKKKK");
      }
    });
  }

  Future<void> DELETEPOINTUSER()async{
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    final User user = auth.currentUser;
    final Uid = user.uid;
    print("Uid $Uid");
    final data = await Firebase.initializeApp().then((value) async {
      await FirebaseFirestore.instance
          .collection('PointUser')
          .doc(Uid)
          .collection('Point')
          .snapshots()
          .listen((event) {
        int indexs = 0;
        for (var snap in event.docs) {
          print(snap);
          Map<String, dynamic> map = snap.data();
          ProductpointUser modalAddpoint = ProductpointUser.fromMap(map);
          productpointUserModals2.add(modalAddpoint);
          var C = modalAddpoint;
          var docc = C.point;
          _pointController = docc;
          print("docc$_pointController");
          print("point${C.point}");
          indexs++;
          if (C.point == _pointController) {
            print("OK");
            FirebaseFirestore.instance
                .collection('PointUser')
                .doc(Uid)
                .collection('Point')
                .where("point", isEqualTo : _pointController.toString())
                .get().then((value){
              value.docs.forEach((element) {
                FirebaseFirestore.instance
                    .collection("PointUser")
                    .doc(Uid)
                    .collection("Point")
                    .doc(element.id).delete().then((value){
                  print("Success!");
                  // FFpoint();
                });
              });
            });
          }
        }
      });
    });
  }

  // void FFpoint() {
  //   MaterialPageRoute route =
  //   MaterialPageRoute(builder: (value) => dashboard());
  //   Navigator.of(context).pushReplacement(
  //     route,
  //   );
  // }

  Future<void> showAlert3(String title, String message) async {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title),
            content: Text(message),
            actions: <Widget>[
              FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'OK',
                    style: TextStyle(color: Colors.green),
                  ))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    Size A = MediaQuery.of(context).size;
    return Scaffold(backgroundColor: Colors.white,
        appBar: AppBar(
            backgroundColor: Colors.white,
            centerTitle: true,
            iconTheme: IconThemeData(color: Colors.black),
            title: Text(
              'Sceen Point',
              style: TextStyle(color: Colors.black, fontSize: 18),
            )),
        body: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
              height: 100,
              width: 100,
              child: Image.asset("image/Cha.png"),
            ),
            SizedBox(
              height: 20,
            ),
            //Conditions for redeeming points
            Container(
              padding: EdgeInsets.only(left: 40, right: 40),
              child: Expanded(
                child: AutoSizeText(
                  "- You can redeem your points if your point equals ten points.",
                  style: TextStyle(color: Colors.red[900], fontSize: 16),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.only(left: 40, right: 40),
              child: Expanded(
                child: AutoSizeText(
                  "- You can press the button below to redeem points, if your points equals ten points.",
                  style: TextStyle(color: Colors.red[900], fontSize: 16),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Container(
                padding: EdgeInsets.only(top: 5),
                width: A.width * 0.8,
                child: ElevatedButton(
                  child: Text("Scanner Point"),
                   onPressed: () {getPointUser();},
                  style: ElevatedButton.styleFrom(
                    primary: Colors.deepOrange[800],
                    onPrimary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32.0),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
