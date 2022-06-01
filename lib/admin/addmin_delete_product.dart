import 'dart:ui';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:chathai/models/product_modal.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'AddminHome_login_And_delete.dart';

// class addmimDeleteProduct extends StatefulWidget {
//   const addmimDeleteProduct({Key key}) : super(key: key);
//
//   @override
//   _addmimDeleteProductState createState() => _addmimDeleteProductState();
// }
//
// class _addmimDeleteProductState extends State<addmimDeleteProduct> {
//     List<Widget> wid = [];
//   List<ProductModal> productModals = [];
//   List<ProductModal> productModals2 = [];
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     readData();
//   }
//   void readData() async {
//     final data = await Firebase.initializeApp().then((value) async {
//       print('OK');
//       await FirebaseFirestore.instance
//           .collection('Product')
//           .orderBy('name')
//           .snapshots()
//           .listen((event) {
//         print('Snap = ${event.docs}');
//         int indexs = 0;
//
//         for (var snap in event.docs) {
//           Map<String, dynamic> map = snap.data();
//           print('map = ${map}');
//           ProductModal modal = ProductModal.fromMap(map);
//           productModals.add(modal);
//           //nane product
//           var A = modal;
//           print('modal$modal');
//           print('product$productModals');
//           print('name product = ${modal.name}');
//           print('name  = ${A.name}');
//           setState(() {
//             wid.add(creatWid(modal, indexs));
//           });
//           indexs++;
//         }
//       });
//     }); //get the data
//   }
//   Widget creatWid(ProductModal modal, int indexs) => GestureDetector(
//     onTap: () {
//       print('Show $indexs');
//       //Delete
//       String title = "delete data";
//       String message = "Do you want to delete data?";
//       _dialogdelete(title, message);
//     },
//     child: Card(
//       child: Center(
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             SizedBox(
//               height: 20,
//             ),
//             Container(
//                 width: 100, height: 100, child: Image.network(modal.path)),
//             SizedBox(
//               height: 10,
//             ),
//             Expanded(child: AutoSizeText(modal.name))
//           ],
//         ),
//       ),
//     ),
//   );
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         color: Colors.deepPurple[100],
//         child: Container(
//           child: wid.length == 0
//               ? Center(child: CircularProgressIndicator())
//               : GridView.extent(maxCrossAxisExtent: 300, children: wid),
//         ),
//       ),
//     );
//   }
//   void _dialogdelete(title, message) {
//     showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return AlertDialog(
//             title: ListTile(
//               leading: Icon(
//                 Icons.delete,
//                 color: Colors.deepOrange[400],
//                 size: 48.0,
//               ),
//               title: Text(title,
//                   style: TextStyle(fontSize: 20, color: Colors.black)),
//             ),
//             content: Text(message),
//             actions: <Widget>[
//               FlatButton(
//                   child: Text('No',
//                       style: TextStyle(fontSize: 16, color: Colors.green[400])),
//                   onPressed: () {
//                     Navigator.of(context).pop();
//                   }),
//               FlatButton(
//                   child: Text('Yes',
//                       style: TextStyle(fontSize: 16, color: Colors.red[400])),
//                   onPressed: () {
//                     DeleteData();
//                   })
//             ],
//           );
//         });
//   }
//   //------------------------------------------------------------
//   void DeleteData() async {
//     final data = await Firebase.initializeApp().then((value) async {
//       await FirebaseFirestore.instance
//           .collection('Product')
//           .snapshots()
//           .listen((event) {
//         int indexs = 0;
//         for (var snap in event.docs) {
//           print('snap $snap');
//           for (var snap in event.docs) {
//             Map<String, dynamic> map = snap.data();
//             print('map = ${map}');
//             ProductModal modal = ProductModal.fromMap(map);
//             productModals.add(modal);
//             //nane product
//             var A = modal;
//             print('modal$modal');
//             print('product$productModals');
//             print('name product = ${modal.name}');
//             print('name  = ${A.name}');
//             indexs++;
//             setState((){
//               key: Key(snap.id);
//               print('snap $snap');
//               FirebaseFirestore.instance
//                   .collection("Product")
//                   .doc(snap.id)
//                   .delete()
//               //key: Key(snap.id);
//               // FirebaseFirestore.instance
//               //     .collection("Product")
//               //     .doc(snap.id)
//               //     .delete()
//                   .then((_) {
//                 print("success!");
//                 String title = "success";
//                 String message = "Delete data success";
//                 _dialogSuccessDelete(title, message);
//               });
//             });
//           }
//         }
//       });
//     }); //get the data
//   }
//   //--------------------------------------------------------------
//       // print("success!");
//       // String title = "success";
//       // String message = "Delete data success";
//   void _dialogSuccessDelete(title, message) {
//     showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return AlertDialog(
//             title: ListTile(
//               leading: Icon(
//                 Icons.insert_emoticon,
//                 color: Colors.green[400],
//                 size: 48.0,
//               ),
//               title: Text(title,
//                   style: TextStyle(fontSize: 20, color: Colors.black)),
//             ),
//             content: Text(message),
//             actions: <Widget>[
//               FlatButton(
//                   child: Text('OK',
//                       style: TextStyle(fontSize: 16, color: Colors.green[400])),
//                 onPressed: () {
//                   Navigator.push(context,
//                       MaterialPageRoute(builder: (context) => HomeAddminAddpro()));
//                 },
//                  ),
//             ],
//           );
//         });
//   }
// }

class addmimDeleteProduct extends StatefulWidget {
  // const addmimDeleteProduct({Key ? key}) : super(key: key);
  @override
  _addmimDeleteProductState createState() => _addmimDeleteProductState();
}

class _addmimDeleteProductState extends State<addmimDeleteProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text(
          " Delete Product ",
          style: TextStyle(color: Colors.white, fontSize: 20),
        )),
      body:TasksPage(),
    );
  }
}
class TasksPage extends StatelessWidget {
  Widget _buildList(QuerySnapshot snapshot) {
    return ListView.builder(
        itemCount: snapshot.docs.length,
        itemBuilder: (context, index) {
          final doc = snapshot.docs[index];
          return Dismissible(
            key: Key(doc.id),
            background: Container(
                color: Colors.red),
            onDismissed: (direction) {
              // delete the doc from the database
              FirebaseFirestore.instance
                  .collection("Product")
                  .doc(doc.id)
                  .delete();
            },
            child: ListTile(title: Container(
                child: Container(
                  height: 55,
                  child: Card(color: Colors.black54,
                      semanticContainer: true,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),),
                      child: Container( padding: EdgeInsets.only(left: 20,top: 10),
                          child: AutoSizeText(doc["name"],style: TextStyle(fontSize: 16,color: Colors.white),))),
                ))),
          );
        });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            SizedBox(
              height: 10,
            ),
            Container(padding: EdgeInsets.only(left: 15),
              child: Row(
                children: [
                  Icon(
                    Icons.delete_forever,
                    color: Colors.red,
                    size: 30.0,),
                  Container(
                      padding:EdgeInsets.only(right: 20,left: 15),
                      child: Text(
                    "Swipe left ro right to delete menu !!",
                    style: TextStyle(color: Colors.red, fontSize: 16),
                  )),
                ],
              ),
            ),
            SizedBox(height: 10,),
            StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection("Product")
                    .snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) return LinearProgressIndicator();
                  return Expanded(child: _buildList(snapshot.data));
                })
          ]),
        ));
  }
}
