import 'dart:io';
import 'package:path/path.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  @override
  void initState() {
    super.initState();
    getDataUser();
  }

  File _image;
  String imageDelete = 'Null';
  String image = 'Null';
  String fname = 'Null';
  String lname = 'Null';
  String telephone = 'Null';
  String dateofbirth = 'Null';
  String gender = 'Null';

  void getDataUser() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    var authUser = auth.currentUser.uid;
    FirebaseFirestore firebaseUser = FirebaseFirestore.instance;
    await firebaseUser
        .collection('UserProfiles')
        .doc(authUser)
        .get()
        .then((value) {
      Map<String, dynamic> data = value.data();
      String images = data['image'].toString();
      String fnames = data['fname'].toString();
      String lnames = data['lname'].toString();
      String telephones = data['telephone'].toString();
      String dateofbirths = data['dateofbirth'].toString();
      String genders = data['gender'].toString();

      setState(() {
        image = images;
        imageDelete = images;
        fname = fnames;
        lname = lnames;
        telephone = telephones;
        dateofbirth = dateofbirths;
        gender = genders;
      });
    }).catchError((onError) => {print(onError)});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Profile Setting',
            style: TextStyle(color: Colors.black),
          ),
          leading: IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: Icon(Icons.arrow_back_ios)),
        ),
        body: Container(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: CircleAvatar(
                    radius: 80,
                    backgroundColor: Color(0xff476cfb),
                    child: ClipOval(
                      child: Stack(
                        children: [
                          SizedBox(
                            height: 150,
                            width: 150,
                            child: (_image != null)
                                ? Image.file(
                                    _image,
                                    fit: BoxFit.cover,
                                  )
                                : Image.network(
                                    image,
                                    fit: BoxFit.cover,
                                  ),
                          ),
                          Positioned(
                              top: 0,
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: IconButton(
                                  onPressed: () {
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: Text("What You Want"),
                                            content: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    FlatButton(
                                                      onPressed: () => {
                                                        openCamera(),
                                                        Navigator.of(context)
                                                            .pop()
                                                      },
                                                      padding:
                                                          EdgeInsets.all(10.0),
                                                      child: Row(
                                                        // Replace with a Row for horizontal icon + text
                                                        children: <Widget>[
                                                          Icon(
                                                              Icons.camera_alt),
                                                          Text(
                                                            "Camera",
                                                            style: TextStyle(
                                                                fontSize: 20),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    FlatButton(
                                                      onPressed: () => {
                                                        getImage(),
                                                        Navigator.of(context)
                                                            .pop()
                                                      },
                                                      padding:
                                                          EdgeInsets.all(10.0),
                                                      child: Row(
                                                        // Replace with a Row for horizontal icon + text
                                                        children: <Widget>[
                                                          Icon(Icons.image),
                                                          Text(
                                                            "Gallery",
                                                            style: TextStyle(
                                                                fontSize: 20),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                            actions: [
                                              TextButton(
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: Text('Close'))
                                            ],
                                          );
                                        });
                                    // getImage();
                                  },
                                  icon: Icon(
                                    Icons.camera_alt,
                                    size: 50,
                                  )))
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.person,
                      color: Colors.blue,
                      size: 30,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Account',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                buildAccountOption(context, 'fname', 'Name', fname),
                buildAccountOption(context, 'lname', 'LastName', lname),
                buildAccountOption(
                    context, 'dateofbirth', 'DateOfBirth', dateofbirth),
                buildAccountOption(context, 'gender', 'Gender', gender),
                buildAccountOption(
                    context, 'telephone', 'Telephone', telephone),
                SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FlatButton(
                      onPressed: () =>
                          {saveData().then((value) => Navigator.pop(context))},
                      color: Colors.green,
                      padding: EdgeInsets.all(10.0),
                      child: Row(
                        // Replace with a Row for horizontal icon + text
                        children: <Widget>[
                          Icon(Icons.save),
                          Text(
                            "Save",
                            style: TextStyle(fontSize: 20),
                          )
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ));
  }

  GestureDetector buildAccountOption(
      BuildContext context, String type, String text, String title) {
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("$text"),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Text('Enter $text'),
                    TextField(
                      onChanged: (value) {
                        if (type == 'fname') {
                          setState(() {
                            fname = value;
                          });
                        }
                        if (type == 'lname') {
                          setState(() {
                            lname = value;
                          });
                        }
                        if (type == 'dateofbirth') {
                          setState(() {
                            dateofbirth = value;
                          });
                        }
                        if (type == 'gender') {
                          setState(() {
                            gender = value;
                          });
                        }
                        if (type == 'telephone') {
                          setState(() {
                            telephone = value;
                          });
                        }
                      },
                    )
                  ],
                ),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('OK'))
                ],
              );
            });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            Row(
              children: [
                Text(
                  title,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey[500]),
                ),
                Padding(padding: EdgeInsets.all(10)),
                Icon(
                  Icons.edit,
                  color: Colors.blue[400],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Future<void> saveData() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    var authUser = auth.currentUser.uid;
    String imageName = basename(_image.path);
    if (image == "Null") {
      Reference _ref =
          FirebaseStorage.instance.ref().child(authUser).child(imageName);
      UploadTask uploadTask = _ref.putFile(_image);
      String _imageUrl = await (await uploadTask).ref.getDownloadURL();

      setState(() {
        print('Upload Image Success$_imageUrl');
        image = _imageUrl;
      });
    } else {
      Reference storageRef = FirebaseStorage.instance.refFromURL(image);
      storageRef.delete().then((value) async {
        print('Delete Image Success');
        Reference _ref =
            FirebaseStorage.instance.ref().child(authUser).child(imageName);
        UploadTask uploadTask = _ref.putFile(_image);
        String _imageUrl = await (await uploadTask).ref.getDownloadURL();

        setState(() {
          print('Upload Image Success$_imageUrl');
          image = _imageUrl;
        });
      });
    }

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    Map<String, dynamic> map = Map();
    map['image'] = image.trim();
    map['fname'] = fname.trim();
    map['lname'] = lname.trim();
    map['dateofbirth'] = dateofbirth.trim();
    map['gender'] = gender.trim();
    map['telephone'] = telephone.trim();
    await firebaseFirestore
        .collection('UserProfiles')
        .doc(authUser)
        .set(map)
        .then((value) {
      print('Save Edit');
    });
  }

  void getImage() async {
    var images = await ImagePicker().getImage(source: ImageSource.gallery);
    final File file = File(images.path);
    setState(() {
      _image = file;
    });
  }

  void openCamera() async {
    var images = await ImagePicker().getImage(source: ImageSource.camera);
    final File file = File(images.path);
    setState(() {
      _image = file;
    });
  }

  void delete() {
    Reference storageRef = FirebaseStorage.instance.refFromURL(image);
    storageRef.delete().then((value) => print("Delete Photo"));
  }
}
