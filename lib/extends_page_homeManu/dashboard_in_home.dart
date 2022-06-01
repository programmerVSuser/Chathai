import 'package:auto_size_text/auto_size_text.dart';
import 'package:chathai/TestPage/test_addpopint.dart';
import 'package:chathai/controll_login-regitter/connext_login-regiter_fribase.dart';
import 'package:chathai/home_login-regitter/home_login_and_regitter.dart';
import 'package:chathai/models/getPoint_user_modal.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dashboard_menu_items/contact.dart';
import 'dashboard_menu_items/how_to_ues.dart';
import 'dashboard_menu_items/map_chathai.dart';
import 'dashboard_menu_items/page_view.dart';
import 'dashboard_menu_items/profile_user.dart';
import 'dashboard_menu_items/scen_pointUser.dart';
import 'dashboard_menu_items/terms_and_conditions.dart';

class dashboard extends StatefulWidget {
  const dashboard({Key key}) : super(key: key);

  @override
  _dashboardState createState() => _dashboardState();
}

class _dashboardState extends State<dashboard> {
  get condition => null;
  @override
  void initState() {
    super.initState();
   // PointUser();
  }
  String imageUser;
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
                    Navigator.pushReplacement(
                        context, MaterialPageRoute(builder: (BuildContext context) =>  scenQR()));
                  },
                  child: Text(
                    'OK',
                    style: TextStyle(color: Colors.green),
                  ))
            ],
          );
        });
  }
  Widget build(BuildContext context) {
    List<ProductpointUser> productModalsss = [];
    final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
    var getNameEmail = _firebaseAuth.currentUser.email;
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Stack(
        children: <Widget>[
          Container(
            height: size.height * .45,
            decoration: BoxDecoration(
              color: Colors.deepPurple[100],
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    GestureDetector(
                      child: Container(
                        padding: EdgeInsets.only(
                          top: 10,
                        ),
                        child: Center(
                          child: Row(
                            children: <Widget>[
                              Container(
                                height: 70,
                                width: 70,
                                child: Image.asset("image/Cha.png"),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Container(
                                child: Expanded(
                                    child: AutoSizeText(
                                  "Email:\n$getNameEmail",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.black),
                                )),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    Text(
                      "Menu",
                     style: TextStyle(fontWeight:FontWeight.bold, fontSize: 25 ),
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    Wrap(
                      spacing: 20,
                      runSpacing: 20,
                      children: <Widget>[
                        SeassionCard1(
                          press: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => contact()));
                          },
                        ),
                        SeassionCard2(
                          press: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PageViewPage()));
                          },
                        ),
                        SeassionCard3(
                          //ไข่มุก
                          press: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Gmap()));
                          },
                        ),
                        SeassionCard4(
                          //howToUes
                          press: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => howToUes()));
                          },
                        ),
                        SeassionCard5(
                          press: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        TermsAndConditions()));
                          },
                        ),
                        SeassionCard6(
                          press: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => EditProfilePage()));
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                    Text(
                      "More menu",
                      style: TextStyle(fontWeight:FontWeight.bold, fontSize: 25 ),
                    ),
                    SizedBox(height: 15),
                    InkWell(
                      onTap: () async {
                        final data =
                        await Firebase.initializeApp().then((value) async {
                          final User user = auth.currentUser;
                          final Uid = user.uid;
                          print("Uid $Uid");
                          await FirebaseFirestore.instance
                              .collection('PointUser')
                              .doc(Uid)
                              .collection('Point')
                              .snapshots()
                              .listen((event) {
                            int indexs = 0;
                            print('Snap = ${event.docs}');
                            print(indexs);
                            for (var snap in event.docs) {
                              Map<String, dynamic> map = snap.data();
                              print('map = ${map}');
                              ProductpointUser modal =
                              ProductpointUser.fromMap(map);
                              productModalsss.add(modal);
                              indexs++;
                              print(indexs);
                            }
                            if (indexs++ == 10) {
                              showAlert2('*full score',
                                  'Press the OK button to redeem points.');
                            }else{
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          useraddpointt()));
                            }
                          });
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        padding: EdgeInsets.all(10),
                        height: 90,
                        decoration: BoxDecoration(
                          color: Colors.blueGrey,
                          borderRadius: BorderRadius.circular(13),
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(0, 17),
                              blurRadius: 23,
                              spreadRadius: -13,
                              color: kShadowColor,
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Row(children: [
                            Container(
                              child: Icon(
                                Icons.add_circle_outline,
                                size: 40,
                                color: Colors.white,
                              ),
                            ),
                            Container(
                              child: Center(
                                  child: Expanded(
                                      child: Container(
                                        child: AutoSizeText("Add Point",
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500,
                                            )),
                                      ))),
                              height: 50, width: 130,
                              // color: Colors.grey,
                            )
                          ]),
                        ),
                      ),
                    ),
                    // InkWell(
                    //   onTap: (){
                    //     Navigator.push(
                    //                     context,
                    //                     MaterialPageRoute(
                    //                         builder: (BuildContext context) =>
                    //                             useraddpointt()));
                    //   },
                    //   child: Container(
                    //     margin: EdgeInsets.symmetric(vertical: 10),
                    //     padding: EdgeInsets.all(10),
                    //     height: 90,
                    //     decoration: BoxDecoration(
                    //       color: Colors.blueGrey,
                    //       borderRadius: BorderRadius.circular(13),
                    //       boxShadow: [
                    //         BoxShadow(
                    //           offset: Offset(0, 17),
                    //           blurRadius: 23,
                    //           spreadRadius: -13,
                    //           color: kShadowColor,
                    //         ),
                    //       ],
                    //     ),
                    //     child: Padding(
                    //       padding: const EdgeInsets.all(5.0),
                    //       child: Row(children: [
                    //         Container(
                    //           child: Icon(
                    //             Icons.add_circle_outline,
                    //             size: 40,
                    //             color: Colors.white,
                    //           ),
                    //         ),
                    //         Container(
                    //           child: Center(
                    //               child: Expanded(
                    //                   child: Container(
                    //             child: AutoSizeText("Add Point",
                    //                 style: TextStyle(
                    //                   fontSize: 16,
                    //                   color: Colors.white,
                    //                   fontWeight: FontWeight.w500,
                    //                 )),
                    //           ))),
                    //           height: 50, width: 130,
                    //           // color: Colors.grey,
                    //         )
                    //       ]),
                    //     ),
                    //   ),
                    // ),
                    InkWell(
                      onTap: () async {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    scenQR()));
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        padding: EdgeInsets.all(10),
                        height: 90,
                        decoration: BoxDecoration(
                          color: Colors.blueGrey,
                          borderRadius: BorderRadius.circular(13),
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(0, 17),
                              blurRadius: 23,
                              spreadRadius: -13,
                              color: kShadowColor,
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Row(
                            children: [
                              Container(
                                child: Icon(
                                  Icons.remove_circle_outline,
                                  size: 40,
                                  color: Colors.white,
                                ),
                              ),
                              Container(
                                child: Center(
                                    child: Expanded(
                                        child: AutoSizeText("Exchange Points",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                            )))),
                                height: 50, width: 180,
                                // color: Colors.grey,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        auth.signOut().then((value) =>
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomeMenuChathai())));
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        padding: EdgeInsets.all(10),
                        height: 90,
                        decoration: BoxDecoration(
                          color: Colors.blueGrey,
                          borderRadius: BorderRadius.circular(13),
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(0, 17),
                              blurRadius: 23,
                              spreadRadius: -13,
                              color: kShadowColor,
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 5,
                          ),
                          child: Row(
                            children: [
                              Container(
                                child: Icon(
                                  Icons.logout,
                                  size: 40,
                                  color: Colors.white,
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(right: 50),
                                child: Center(
                                    child: Expanded(
                                        child: AutoSizeText("Log Out",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                            )))),
                                height: 50, width: 150,
                                // color: Colors.grey,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SeassionCard1 extends StatelessWidget {
  final bool isDone;
  final Function press;
  const SeassionCard1({
    Key key,
    this.isDone = false,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(13),
        child: Container(
          width: constraint.maxWidth / 2 - 10,
          decoration: BoxDecoration(
            color: Colors.purple[200],
            borderRadius: BorderRadius.circular(13),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 17),
                blurRadius: 23,
                spreadRadius: -13,
                color: kShadowColor,
              ),
            ],
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: press,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: <Widget>[
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            color: Colors.purple[200],
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Expanded(
                                    child: Container(
                                      child: Image.asset(
                                        "image/CONTACT.png",
                                        fit: BoxFit.fill,
                                        height: double.infinity,
                                        width: double.infinity,
                                      ),
                                    ),
                                  ),
                                ]),
                          ),
                          Padding(padding: EdgeInsets.all(2)),
                          Container(
                            child: Center(
                                child: Expanded(
                                    child: Container(
                              child: AutoSizeText("Contact   ",
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w800,
                                  )),
                            ))),
                            height: 50, width: 70,
                            // color: Colors.grey,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}

class SeassionCard2 extends StatelessWidget {
  final bool isDone;
  final Function press;
  const SeassionCard2({
    Key key,
    this.isDone = false,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(13),
        child: Container(
          width: constraint.maxWidth / 2 - 10,
          decoration: BoxDecoration(
            color: Colors.red[200],
            borderRadius: BorderRadius.circular(13),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 17),
                blurRadius: 23,
                spreadRadius: -13,
                color: kShadowColor,
              ),
            ],
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: press,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: <Widget>[
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            color: Colors.red[200],
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Expanded(
                                    child: Container(
                                      child: Image.asset(
                                        "image/Cha.png",
                                        fit: BoxFit.fill,
                                        height: double.infinity,
                                        width: double.infinity,
                                      ),
                                    ),
                                  ),
                                ]),
                          ),
                          Padding(padding: EdgeInsets.all(5)),
                          Container(
                            child: Center(
                                child: Expanded(
                                    child: Container(
                              child: AutoSizeText("About Chathai Club",
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w800,
                                  )),
                            ))),
                            height: 50, width: 70,
                            // color: Colors.grey,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}

class SeassionCard3 extends StatelessWidget {
  final bool isDone;
  final Function press;
  const SeassionCard3({
    Key key,
    this.isDone = false,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(13),
        child: Container(
          width: constraint.maxWidth / 2 - 10,
          decoration: BoxDecoration(
            color: Colors.blue[200],
            borderRadius: BorderRadius.circular(13),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 17),
                blurRadius: 23,
                spreadRadius: -13,
                color: kShadowColor,
              ),
            ],
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: press,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: <Widget>[
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            color: Colors.blue[200],
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Expanded(
                                    child: Container(
                                      child: Image.asset(
                                        "image/Shop.png",
                                        fit: BoxFit.fill,
                                        height: double.infinity,
                                        width: double.infinity,
                                      ),
                                    ),
                                  ),
                                ]),
                          ),
                          Padding(padding: EdgeInsets.all(5)),
                          Container(
                            child: Center(
                                child: Expanded(
                                    child: Container(
                              child: AutoSizeText("Shop location",
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w800,
                                  )),
                            ))),
                            height: 50, width: 70,
                            // color: Colors.grey,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}

class SeassionCard4 extends StatelessWidget {
  final bool isDone;
  final Function press;
  const SeassionCard4({
    Key key,
    this.isDone = false,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(13),
        child: Container(
          width: constraint.maxWidth / 2 - 10,
          decoration: BoxDecoration(
            color: Colors.lime[200],
            borderRadius: BorderRadius.circular(13),
            boxShadow: [],
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: press,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: <Widget>[
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            color: Colors.lime[200],
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Expanded(
                                    child: Container(
                                      child: Image.asset(
                                        "image/Manual.png",
                                        fit: BoxFit.fill,
                                        height: double.infinity,
                                        width: double.infinity,
                                      ),
                                    ),
                                  ),
                                ]),
                          ),
                          Padding(padding: EdgeInsets.only(left: 1)),
                          Container(
                            child: Center(
                                child: Expanded(
                                    child: Container(
                              child: AutoSizeText("Manual    ",
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w800,
                                  )),
                            ))),
                            height: 50, width: 70,
                            // color: Colors.grey,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}

class SeassionCard5 extends StatelessWidget {
  final bool isDone;
  final Function press;
  const SeassionCard5({
    Key key,
    this.isDone = false,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(13),
        child: Container(
          width: constraint.maxWidth / 2 - 10,
          decoration: BoxDecoration(
            color: Colors.indigo[200],
            borderRadius: BorderRadius.circular(13),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 17),
                blurRadius: 23,
                spreadRadius: -13,
                color: kShadowColor,
              ),
            ],
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: press,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: <Widget>[
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            color: Colors.indigo[200],
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Expanded(
                                    child: Container(
                                      child: Image.asset(
                                        "image/Terms.png",
                                        fit: BoxFit.fill,
                                        height: double.infinity,
                                        width: double.infinity,
                                      ),
                                    ),
                                  ),
                                ]),
                          ),
                          Padding(padding: EdgeInsets.all(5)),
                          Container(
                            child: Center(
                                child: Expanded(
                                    child: Container(
                              child: AutoSizeText("Terms and Conditions",
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w800,
                                  )),
                            ))),
                            height: 50, width: 70,
                            // color: Colors.grey,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}

class SeassionCard6 extends StatelessWidget {
  final bool isDone;
  final Function press;
  const SeassionCard6({
    Key key,
    this.isDone = false,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(13),
        child: Container(
          width: constraint.maxWidth / 2 - 10,
          decoration: BoxDecoration(
            color: Colors.cyan[200],
            borderRadius: BorderRadius.circular(13),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 17),
                blurRadius: 23,
                spreadRadius: -13,
                color: kShadowColor,
              ),
            ],
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: press,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: <Widget>[
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            color: Colors.cyan[200],
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Expanded(
                                    child: Container(
                                      child: Image.asset(
                                        "image/info.png",
                                        fit: BoxFit.fill,
                                        height: double.infinity,
                                        width: double.infinity,
                                      ),
                                    ),
                                  ),
                                ]),
                          ),
                          Padding(padding: EdgeInsets.all(2)),
                          Container(
                            child: Center(
                                child: Expanded(
                                    child: Container(
                              child: AutoSizeText("Information",
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w800,
                                  )),
                            ))),
                            height: 50, width: 70,
                            // color: Colors.grey,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
