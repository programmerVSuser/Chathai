import 'package:auto_size_text/auto_size_text.dart';
import 'package:chathai/controll_login-regitter/connext_login-regiter_fribase.dart';
import 'package:chathai/models/getPoint_user_modal.dart';
import 'package:chathai/models/point_modal.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class useraddpoint extends StatefulWidget {
  const useraddpoint({Key key}) : super(key: key);

  @override
  _useraddpointState createState() => _useraddpointState();
}

class _useraddpointState extends State<useraddpoint> {
  List<ProductpointUser> productModals = [];
  List<AddMinPointModal> productModals2 = [];
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  //final TextEditingController _pointController = TextEditingController();
  String _pointController;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'User Add Point',
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Form(
            key: _formkey,
            child: Container(
              child: Column(
                children: <Widget>[
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
                  Container(
                    padding: EdgeInsets.only(left: 40, right: 40),
                    child: Expanded(
                      child: AutoSizeText(
                        "Fill in points from the products of the shop. in the box below",
                        style: TextStyle(color: Colors.red[900], fontSize: 16),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 40, right: 50),
                    child: TextFormField(
                      onChanged: (String string) {
                        _pointController = string.trim();
                      },
                      cursorColor: Theme.of(context).cursorColor,
                      decoration: InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.deepOrange[800], width: 2.0)),
                        icon: Icon(
                          Icons.add_box_outlined,
                          color: Colors.black,
                        ),
                        labelText: 'Point',
                        labelStyle: TextStyle(
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 5.0),
                    height: 45,
                    width: size.width * 0.3,
                    child: ElevatedButton(
                      onPressed: () async {
                        if (_pointController == null ||
                            _pointController.isEmpty) {
                          showAlert('*Non Choohe', 'there is a gap');
                        } else {
                          Dpoint();
                         // _ADDPOINT();
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          primary: Colors.deepOrange[900],
                          onPrimary: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      child: Expanded(
                        child: Text('Save Point'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> showAlert(String title, String message) async {
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

  Future<void> showAlert2(String title, String message) async {
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

  void Dpoint() async {
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
        int indexsPointUser = 0;
        for (var snap in event.docs) {
          Map<String, dynamic> map = snap.data();
          print('map = ${map}');
          ProductpointUser modal = ProductpointUser.fromMap(map);
          productModals.add(modal);
          String point = modal.point;
          indexsPointUser++;
          print(point);
          print("indexsPointUser==$indexsPointUser");
        }
        if (indexsPointUser++ == 10) {
          var indexsPointUserr = 0;
          print(indexsPointUserr);
          if (indexsPointUserr == 0) {
            showAlert2('*full score', 'Press the OK button to redeem points.');
          }
        } else if(indexsPointUser++ <= 10){
          print("point != 10");
          _ADDPOINT();
        }
      });
    });
  }

  Future<void> _ADDPOINT() async {
    final data = await Firebase.initializeApp().then((value) async {
      await FirebaseFirestore.instance
          .collection('ProductPoint')
          .snapshots()
          .listen((event) {
        print('Snap = ${event.docs}');
        for (var snap in event.docs) {
          Map<String, dynamic> map = snap.data();
          AddMinPointModal modalAddpoint = AddMinPointModal.fromMap(map);
          productModals2.add(modalAddpoint);
          var B = modalAddpoint;
          print("Test$B");
          print('PointName  = ${B.Productpoint}');
            if (B.Productpoint == _pointController.toString()) {
              print("${B.Productpoint}+$_pointController");
              print("OKKKKKKKKKKKKK");
              inputData();
            } else {}
        }
      });
    });
  }

  void inputData() async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    final User user = auth.currentUser;
    final Uid = user.uid;
    print("Uid $Uid");
    Map<String, dynamic> map = Map();
    map['point'] = _pointController;
    await firebaseFirestore
        .collection('PointUser')
        .doc(Uid)
        .collection('Point')
        .doc()
        .set(map)
        .then((value) {
      //?????????????????????????????????????????????????????????????????????????????????
      DELETEDOC();
    });
  }

  Future<void> DELETEDOC() async {
    final data = await Firebase.initializeApp().then((value) async {
      await FirebaseFirestore.instance
          .collection('ProductPoint')
          .snapshots()
          .listen((event) {
        print('Snap = ${event.docs}');
        int indexs = 0;
        print("$indexs");
        for (var snap in event.docs) {
          Map<String, dynamic> map = snap.data();
          AddMinPointModal modalAddpoint = AddMinPointModal.fromMap(map);
          productModals2.add(modalAddpoint);
          var C = modalAddpoint;
          indexs++;
          if (C.Productpoint == _pointController) {
            FirebaseFirestore.instance
                .collection("ProductPoint")
                .where("Productpoint", isEqualTo: _pointController.toString())
                .get()
                .then((value) {
              value.docs.forEach((element) {
                FirebaseFirestore.instance
                    .collection("ProductPoint")
                    .doc(element.id)
                    .delete()
                    .then((value) {
                  print("Success!");
                  Fpoint();
                });
              });
            });
          }
        }
      });
    });
  }

  void Fpoint() {
    MaterialPageRoute route =
        MaterialPageRoute(builder: (value) => useraddpoint());
    Navigator.of(context).pushReplacement(
      route,
    );
  }
}
