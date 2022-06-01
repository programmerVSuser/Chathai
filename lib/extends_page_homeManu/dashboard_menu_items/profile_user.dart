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
    Size A = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.black),
          title: Text(
            'Profile Setting',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Container(
          color: Colors.white,
          padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Align(
                //   alignment: Alignment.center,
                //   child: CircleAvatar(
                //     radius: 78,
                //     backgroundColor: Colors.black,
                //     child: ClipOval(
                //       child: Stack(
                //         children: [
                //           SizedBox(
                //             height: 150,
                //             width: 150,
                //             child: (_image != null)
                //                 ? Image.file(_image,
                //                     fit: BoxFit.cover,
                //                   )
                //                 : Image.network(image,
                //                     fit: BoxFit.cover,
                //                   ),
                //           ),
                //           Positioned(
                //               top: 100,
                //               bottom: 0,
                //               left: 0,
                //               right: 0,
                //               child: IconButton(
                //                   onPressed: () {
                //                     showDialog(
                //                         context: context,
                //                         builder: (BuildContext context) {
                //                           return AlertDialog(
                //                             title: Center(
                //                                 child:
                //                                     Text("Please select item")),
                //                             content: Column(
                //                               mainAxisSize: MainAxisSize.min,
                //                               children: [
                //                                 Row(
                //                                   mainAxisAlignment:
                //                                       MainAxisAlignment.center,
                //                                   children: [
                //                                     FlatButton(
                //                                       onPressed: () => {
                //                                         openCamera(),
                //                                         Navigator.of(context)
                //                                             .pop()
                //                                       },
                //                                       padding: EdgeInsets.only(
                //                                           top: 20),
                //                                       child: Container(
                //                                         padding:
                //                                             EdgeInsets.only(
                //                                                 right: 65),
                //                                         child: Row(
                //                                           children: <Widget>[
                //                                             Icon(
                //                                               Icons.camera_alt,
                //                                               size: 30.0,
                //                                             ),
                //                                             SizedBox(
                //                                               width: 10,
                //                                             ),
                //                                             Container(
                //                                               child: Text(
                //                                                 "Camera",
                //                                                 style: TextStyle(
                //                                                     fontSize:
                //                                                         20),
                //                                               ),
                //                                             )
                //                                           ],
                //                                         ),
                //                                       ),
                //                                     ),
                //                                   ],
                //                                 ),
                //                                 // Container(
                //                                 //   child: Row(
                //                                 //     mainAxisAlignment:
                //                                 //         MainAxisAlignment
                //                                 //             .center,
                //                                 //     children: [
                //                                 //       FlatButton(
                //                                 //         onPressed: () => {
                //                                 //           getImage(),
                //                                 //           Navigator.of(context)
                //                                 //               .pop()
                //                                 //         },
                //                                 //         padding:
                //                                 //             EdgeInsets.only(
                //                                 //                 top: 10),
                //                                 //         child: Container(
                //                                 //           padding:
                //                                 //               EdgeInsets.only(
                //                                 //                   right: 70),
                //                                 //           child: Row(
                //                                 //             children: <Widget>[
                //                                 //               Icon(
                //                                 //                 Icons.image,
                //                                 //                 size: 30.0,
                //                                 //               ),
                //                                 //               SizedBox(
                //                                 //                 width: 10,
                //                                 //               ),
                //                                 //               Container(
                //                                 //                 child: Text(
                //                                 //                   "Gallery",
                //                                 //                   style: TextStyle(
                //                                 //                       fontSize:
                //                                 //                           20),
                //                                 //                 ),
                //                                 //               )
                //                                 //             ],
                //                                 //           ),
                //                                 //         ),
                //                                 //       ),
                //                                 //     ],
                //                                 //   ),
                //                                 // )
                //                               ],
                //                             ),
                //                             // actions: [
                //                             //   // TextButton(
                //                             //   //     onPressed: () {
                //                             //   //       Navigator.of(context).pop();
                //                             //   //     },
                //                             //   //     child: Container(
                //                             //   //       child: Text(
                //                             //   //         'Close',
                //                             //   //         style: TextStyle(
                //                             //   //             fontSize: 18,
                //                             //   //             color: Colors
                //                             //   //                 .deepOrange[800]),
                //                             //   //       ),
                //                             //   //     ))
                //                             // ],
                //                           );
                //                         });
                //                   },
                //                   // icon: Icon(
                //                   //   Icons.camera_alt,
                //                   //   size: 40,
                //                   //   color: Colors.green,
                //                   // )
                //               ))
                //         ],
                //       ),
                //     ),
                //   ),
                // ),
                Container(
                  height: 120,
                  width: 120,
                  child: Image.asset("image/Cha.png"),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Container(
                        padding: EdgeInsets.only(left: 15),
                        child: Icon(
                          Icons.person,
                          color: Colors.black54,
                          size: 30,
                        )),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      child: Text(
                        'Account',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
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
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.only(top: 10),
                  width: A.width * 0.5,
                  child: ElevatedButton(
                    onPressed: () {
                      saveData().then((value) => Navigator.pop(context));
                    },
                    child: Text(
                      "Save",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                      onPrimary: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32.0),
                      ),
                    ),
                  ),
                ),
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
                title: Text(
                  "Fill in the information you want to edit.",
                  style: TextStyle(color: Colors.deepOrange, fontSize: 16),
                ),
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
                      // obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: text,
                      ),
                    )
                  ],
                ),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'OK',
                        style: TextStyle(color: Colors.green, fontSize: 16),
                      ))
                ],
              );
            });
      },
      child: Padding(
        // padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        padding: EdgeInsets.only(left: 20, right: 25, top: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: Colors.deepOrange[800]),
            ),
            Row(
              children: [
                Text(
                  title,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w300,
                      color: Colors.grey),
                ),
                Padding(padding: EdgeInsets.all(10)),
                Icon(
                  Icons.edit,
                  color: Colors.green[800],
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
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    Map<String, dynamic> map = Map();
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
}

