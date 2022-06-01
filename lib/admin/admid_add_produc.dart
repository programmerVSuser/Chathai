import 'dart:io';
import 'dart:math';
import 'package:chathai/controll_login-regitter/connext_login-regiter_fribase.dart';
import 'package:chathai/home_login-regitter/home_login_and_regitter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:path/path.dart' as Path;
import 'AddminHome_login_And_delete.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(addproduc());
}

// final _nameController = new TextEditingController();
// final _detailController = new TextEditingController();
// final _image = new TextEditingController();

final CollectionReference collectionReference =
    FirebaseFirestore.instance.collection('Produc');
class addproduc extends StatefulWidget {
  @override
  _addproducState createState() => _addproducState();
}

class _addproducState extends State<addproduc> {
  File imageFile;
  String _nameController;
  String _detailController;
  String _priceController;
  String Url;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          title: Text(
            'Add Product',
            style: TextStyle(fontSize: 20),
          ),
          backgroundColor: Colors.deepPurple),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 32,
              ),
              Center(
                child: GestureDetector(
                  onTap: () {
                    _showPicker(context);
                  },
                  child: CircleAvatar(
                    radius: 100,
                    backgroundColor: Colors.white,
                    child: imageFile != null
                        ? Container(
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(50)),
                            child: Image.file(
                              imageFile,
                              width: 170,
                              height: 170,
                              fit: BoxFit.fitHeight,
                            ),
                          )
                        : Container(
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(50)),
                            width: 170,
                            height: 170,
                            child: Icon(
                              Icons.panorama,
                              color: Colors.grey[800],
                              size: 25,
                            ),
                          ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              _widgetTetxName(context),
              SizedBox(
                height: 5,
              ),
              _widgetTetxdetail(context),
              SizedBox(
                height: 20,
              ),
              _widgetTetxprice(context),
              SizedBox(
                height: 20,
              ),
              _widgetBottonAddToFirebzse(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _widgetTetxName(context) {
    return Container(
      padding: EdgeInsets.only(left: 40, right: 50),
      child: TextFormField(
        // controller: _nameController,
        onChanged: (String string) {
          _nameController = string.trim();
        },
        cursorColor: Theme.of(context).cursorColor,
        decoration: InputDecoration(
          focusedBorder: UnderlineInputBorder(
              borderSide:
                  BorderSide(color: Colors.deepOrange[800], width: 2.0)),
          icon: Icon(
            Icons.emoji_food_beverage,
            color: Colors.black,
          ),
          labelText: 'Name Product',
          labelStyle: TextStyle(
            color: Colors.black54,
          ),
        ),
      ),
    );
  }

  Widget _widgetTetxdetail(context) {
    return Container(
      padding: EdgeInsets.only(left: 40, right: 50),
      child: TextFormField(
        onChanged: (value) {
          _detailController = value.trim();
        },
        cursorColor: Theme.of(context).cursorColor,
        decoration: InputDecoration(
          focusedBorder: UnderlineInputBorder(
              borderSide:
                  BorderSide(color: Colors.deepOrange[800], width: 2.0)),
          icon: Icon(
            Icons.list_alt,
            color: Colors.black,
          ),
          labelText: 'Detail Produt',
          labelStyle: TextStyle(
            color: Colors.black54,
          ),
        ),
      ),
    );
  }

  Widget _widgetTetxprice(context) {
    return Container(
      padding: EdgeInsets.only(left: 40, right: 50),
      child: TextFormField(
        // controller: _nameController,
        onChanged: (String string) {
          _priceController = string.trim();
        },
        cursorColor: Theme.of(context).cursorColor,
        decoration: InputDecoration(
          focusedBorder: UnderlineInputBorder(
              borderSide:
              BorderSide(color: Colors.deepOrange[800], width: 2.0)),
          icon: Icon(
            Icons.attach_money,
            color: Colors.black,
          ),
          labelText: 'Price Product',
          labelStyle: TextStyle(
            color: Colors.black54,
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

  Widget _widgetBottonAddToFirebzse() {
    return Container(
      child: Center(
        child: Column(
          children: [
            RaisedButton(
                color: Colors.white,
                onPressed: () async {
                  // await collectionReference.add({
                  //   'name': _nameController.text,
                  //   'detail': _detailController.text,
                  //   'image': _image.text,
                  // }).then((value) => _nameController.clear());
                  if (imageFile == null) {
                    showAlert('Non Choohe', 'Please Click Gallery');
                  } else if (_nameController == null || _nameController.isEmpty ||
                             _detailController == null || _detailController.isEmpty
                  ||_priceController==null || _priceController.isEmpty ){
                    showAlert('Have Space', 'Please Fill Every Blank');
                  } else {
                    uploaddata();

                  }
                },
                child: new Text(
                  "Add Product",
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

  Future<void> uploaddata() async {
    Random random = Random();
    int i = random.nextInt(100000);
    FirebaseStorage firebaseStorage = FirebaseStorage.instance;
    Reference reference = FirebaseStorage.instance.ref().child('images/$i');
    UploadTask uploadTask = reference.putFile(imageFile);

    Url = await (await uploadTask).ref.getDownloadURL();
    print(Url);
    uploadToName_detelAddfirestore();
  }

  Future<void> uploadToName_detelAddfirestore() async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    Map<String, dynamic> map = Map();
    map['name'] = _nameController;
    map['detail'] = _detailController;
    map['path'] = Url;
    map['price']=_priceController;
    await firebaseFirestore
        .collection('Product')
        .doc()
        .set(map)
        .then((value) {
          print('Add product OK');
        });
    MaterialPageRoute route = MaterialPageRoute(builder:(value) => HomeAddminAddpro());
    Navigator.of(context).pushAndRemoveUntil( route, (value) => false);
  }

  _getFromGallery() async {
    PickedFile pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Photo Library'),
                      onTap: () {
                        _getFromGallery();
                        Navigator.of(context).pop();
                      }),
                ],
              ),
            ),
          );
        });
  }
}
