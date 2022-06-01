import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class contact extends StatefulWidget {
  const contact({Key key}) : super(key: key);

  @override
  _contactState createState() => _contactState();
}

class _contactState extends State<contact> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            backgroundColor: Colors.white,
            iconTheme: IconThemeData(color: Colors.black),
            centerTitle: true,
            title: Text(
              'Contact Chathai Club ',
              style: TextStyle(color: Colors.black, fontSize: 18),
            )),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Column(
              children: [
                Row(
                  //image
                  children: [
                    Container(padding: EdgeInsets.only(top: 20),
                      child: Image.asset("image/Cha.png"),
                      height: 100,width: 100,
                    )
                  ],
                ),
                SizedBox(height: 20,),
                Row(
                  children: [
                    Container(
                      child: Expanded(
                        child: AutoSizeText(
                            'If you encounter problems, you can contact Chathai Club via the channels below.',style: TextStyle(
                          color: Colors.red[600],fontSize: 15
                        ),),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15,),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.only(left:10,right: 10,),
                      child: Text('Facebook:',
                      style: TextStyle(fontSize: 14),
                      ),
                    ),
                   GestureDetector(
                     child: Container(
                       child: TextButton(
                           child: Text('สหรัฐ ปรางหมู่'),
                           onPressed: () {
                             _showURL1();
                           }
                       )
                     ),
                   )
                    ],
                ),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.only(left:10,right: 10,),
                      child: Text('Facebook:',
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                    GestureDetector(
                      child: Container(
                          child: TextButton(
                              child: Text('กิตติ ขันทอง'),
                              onPressed: () {
                                _showURL2();
                              }
                          )
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Container(padding: EdgeInsets.only(left:10,right: 10,top: 25),
                      child: Text(
                        'Email:'
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 25),
                      child: Text(
                        'Kasoniterjro@gmail.com'
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Container(padding: EdgeInsets.only(left:10,right: 10,top: 25),
                      child: Text(
                          'Email:'
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 25),
                      child: Text(
                          'kittiphan2802@gmail.com'
                      ),
                    )
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Container(padding: EdgeInsets.only(left:10,right: 10,top: 25),
                      child: Text(
                        'Phone:'
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 25),
                      child: Text(
                        '0621603XXX'
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Container(padding: EdgeInsets.only(left:10,right: 10,top: 25),
                      child: Text(
                          'Phone:'
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 25),
                      child: Text(
                          '0829791XXX'
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ));
  }

  void _showURL1() async {
    const url = "https://www.facebook.com/profile.php?id=100011509817500";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not $url';
    }
  }

  void _showURL2() async {
    const url = "https://www.facebook.com/kittiphankhanthong";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not $url';
    }
  }
}
