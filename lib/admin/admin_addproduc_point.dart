import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class addminaddproductpoint extends StatefulWidget {
  const addminaddproductpoint({Key key}) : super(key: key);

  @override
  _addminaddproductpointState createState() => _addminaddproductpointState();
}

class _addminaddproductpointState extends State<addminaddproductpoint> {

  String _pointController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          title: Text(
            " Add Product Point ",
            style: TextStyle(color: Colors.white, fontSize: 20),
          )),
      body: SingleChildScrollView(
        child: Container(
          child: Column(children: <Widget>[
            SizedBox(
              height: 50,
            ),
            _widgetTetxName(context),
            SizedBox(
              height: 25,
            ),
            _widgetBottonAddPoint()
          ]),
        ),
      ),
    );
  }

  Widget _widgetTetxName(context) {
    return Container(
      padding: EdgeInsets.only(left: 40, right: 50),
      child: TextFormField(
        onChanged: (String string) {
          _pointController = string.trim();
        },
        cursorColor: Theme.of(context).cursorColor,
        decoration: InputDecoration(
          focusedBorder: UnderlineInputBorder(
              borderSide:
              BorderSide(color: Colors.black, width: 2.0)),
          icon: Icon(
            Icons.add_box_rounded,
            color: Colors.black,
          ),
          labelText: 'Product Point',
          labelStyle: TextStyle(
            color: Colors.black54,
          ),
        ),
      ),
    );
  }

  Widget _widgetBottonAddPoint() {
    return Container(
      child: Center(
        child: Column(
          children: [
            RaisedButton(
                color: Colors.white,
                onPressed:()async {
                  if (_pointController == null||
                      _pointController.isEmpty) {
                    showAlert('Have Space', 'Please Fill Every Blank');
                  } else {
                    Savepoint();
                  }
                },
                child: new Text(
                  "Save Point",
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(18.0),
                  side: BorderSide(color: Colors.black),
                )),
          ],
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
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'OK',
                    style: TextStyle(color: Colors.green),
                  ))
            ],
          );
        });
  }

  Future<void> showAlert1(String title, String message) async {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title),
            content: Text(message),
            actions: <Widget>[
              FlatButton(
                  onPressed: () {
                    MaterialPageRoute route = MaterialPageRoute(builder:(value) => addminaddproductpoint());
                    Navigator.of(context).pushReplacement(route,);
                  },
                  child: Text(
                    'OK',
                    style: TextStyle(color: Colors.green),
                  ))
            ],
          );
        });
  }

  Future<void> Savepoint() async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    Map<String, dynamic> map = Map();
    map['Productpoint'] = _pointController;
    await firebaseFirestore
        .collection('ProductPoint')
        .doc()
        .set(map)
        .then((value) {
      //print('Add product OK');
      showAlert1('Add Point Succeed ',
          'Add data successfully, ''\npress OK button to continue adding data.');
    });
    // MaterialPageRoute route = MaterialPageRoute(builder:(value) => addminaddproductpoint());
    // Navigator.of(context).pushReplacement(route,);
  }
}
