import 'package:chathai/controll_login-regitter/connext_login-regiter_fribase.dart';
import 'package:chathai/home_login-regitter/home_login_and_regitter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'addmin_delete_product.dart';
import 'admid_add_produc.dart';
import 'admin_addproduc_point.dart';

class HomeAddminAddpro extends StatefulWidget {
  const HomeAddminAddpro({Key key}) : super(key: key);

  @override
  _HomeAddminAddproState createState() => _HomeAddminAddproState();
}

class _HomeAddminAddproState extends State<HomeAddminAddpro> {
  @override
  Widget build(BuildContext context) {
    Size SetSize = MediaQuery.of(context).size;
    return Scaffold( backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(padding: EdgeInsets.only(top: 50),
          child:Center(
            child: Column(
              children: [
                Container(
                    height: 200,
                    width: 200,
                    child: new Image(
                        fit: BoxFit.fill,
                        image:
                        new AssetImage('image/loader-animation.gif'))
                ),
                Container(
                  child: Center(child: Text("Item Admin"
                  ,style: TextStyle(
                      color: Colors.deepOrange
                      ,fontSize: 20

                    ),)),
                ),
                SizedBox(
                  height: 15,
                  width: 20,
                ),
                Container(
                   width: SetSize.width * 0.7,
                  child: Column(
                    children: [
                      ElevatedButton(
                        style: ButtonStyle(
                          minimumSize: MaterialStateProperty.all(Size(300, 35)),
                          backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(32.0),
                                  side: BorderSide(color: Colors.deepOrange[800]))),
                        ),
                        child: Row(
                          children: [
                            SizedBox(width: 20,),
                            Icon(Icons.add_box,
                                color: Colors.black54,
                                size: 20.0),
                            SizedBox(
                              width: 30,
                            ),
                            Text(
                              "Add Product",
                              style: TextStyle(color: Colors.deepOrange[700]),
                            ),
                          ],
                        ),
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => addproduc()));
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                  width: 20,
                ),
                Container(
                  width: SetSize.width * 0.7,
                  child: Column(
                    children: [
                      ElevatedButton(
                        style: ButtonStyle(
                          minimumSize: MaterialStateProperty.all(Size(300, 35)),
                          backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(32.0),
                                  side: BorderSide(color: Colors.deepOrange[800]))),
                        ),
                        child: Row(
                          children: [
                            SizedBox(width: 20,),
                            Icon(Icons.delete_forever,
                                color: Colors.black54,
                                size: 20.0),
                            SizedBox(
                              width: 30,
                            ),
                            Text(
                              "Delete Product",
                              style: TextStyle(color: Colors.deepOrange[700]),
                            ),
                          ],
                        ),
                         onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => addmimDeleteProduct()));
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                  width: 20,
                ),
                Container(
                  width: SetSize.width * 0.7,
                  child: Column(
                    children: [
                      ElevatedButton(
                        style: ButtonStyle(
                          minimumSize: MaterialStateProperty.all(Size(300, 35)),
                          backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(32.0),
                                  side: BorderSide(color: Colors.deepOrange[800]))),
                        ),
                        child: Row(
                          children: [
                            SizedBox(width: 20,),
                            Icon(Icons.add_box_outlined,
                                color: Colors.black54,
                                size: 20.0),
                            SizedBox(
                              width: 30,
                            ),
                            Text("Add Point",
                              style: TextStyle(color: Colors.deepOrange[700]),
                            ),
                          ],
                        ),
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => addminaddproductpoint()));
                        },
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  height: 15,
                  width: 20,
                ),
                Container(
                  width: SetSize.width * 0.7,
                  child: Column(
                    children: [
                      ElevatedButton(
                        style: ButtonStyle(
                          minimumSize: MaterialStateProperty.all(Size(300, 35)),
                          backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(32.0),
                                  side: BorderSide(color: Colors.deepOrange[800]))),
                        ),
                        child: Row(
                          children: [
                          SizedBox(width: 20,),
                            Icon(Icons.logout,
                                color: Colors.black54,
                                size: 20.0),
                            SizedBox(
                              width: 30,
                            ),
                            Text("Log Out",
                              style: TextStyle(color: Colors.deepOrange[700]),
                            ),
                          ],
                        ),
                        onPressed: () {
                          auth.signOut();
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => HomeMenuChathai()));
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  //set Void

}
