import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../dashboard_in_home.dart';

class PageViewPage extends StatefulWidget {
  @override
  _PageViewPageState createState() => _PageViewPageState();
}

class _PageViewPageState extends State<PageViewPage> {
  int _currentIndex=0;
  List cardList=[
    Item1(),
    Item2(),
    Item3(),
    Item4()
  ];

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
      print(i);
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          backgroundColor: Colors.white,
          appBar:AppBar(
              backgroundColor: Colors.white,
              centerTitle: true,
            iconTheme: IconThemeData(color: Colors.black),
              title: Text(
                'About Chathai Club',
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
          ),
          body: SingleChildScrollView(
            child: Container(
              child: Column(
                children: <Widget>[
                  CarouselSlider(
                    options: CarouselOptions(
                      height: 300.0,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 3),
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      pauseAutoPlayOnTouch: true,
                      aspectRatio: 2.0,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _currentIndex = index;
                        });
                      },
                    ),
                    items: cardList.map((card){
                      return Builder(
                          builder:(BuildContext context){
                            return Container(
                              height: MediaQuery.of(context).size.height*0.30,
                              width: MediaQuery.of(context).size.width,
                              child: Card(
                                color: Colors.blueAccent,
                                child: card,
                              ),
                            );
                          }
                      );
                    }).toList(),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: map<Widget>(cardList, (index, url) {
                      return Container(
                        width: 10.0,
                        height: 10.0,
                        margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _currentIndex == index ? Colors.blueAccent : Colors.grey,
                        ),
                      );
                    }),
                  ),
                  Container(padding: EdgeInsets.only(top: 15),
                    child: Text("เเอพชาไทยคลับคืออะไร",style: TextStyle(
                      fontSize: 18,color: Colors.red[800]
                    ),),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    padding: EdgeInsets.only(left: 20,right: 20),
                    child: AutoSizeText("เเอพพลิเคชั่นชาไทยมีไว้เพื่อเก็บสะสมเเต้มคะเเนน สร้างขึ้นมาเพื่อความสะดวกในการเก็บรักษาเเต้มคะเเนนอันมีค่าจากร้าน ชาไทย คลับ เพื่อป้องกันการชำรุด ขาด หาย เมื่อเก็บเเต้มคะเเนนด้วยกระดาษดังร้านขายน้ำทั่วไป ทำให้ลูกค้าอันเป็นที่รักต้องเสียสิทธิ์ในผลประโยชน์ของตัวเอง ทางร้านชาไทย คลับ ได้เล็งเห็นถึงปัญหาดังกล่าวได้จัดทำเเอพพลิเคชั่นเพื่อให้ลูกค้าอันเป็นที่รักใช้สิทธิของตัวเองอย่างสูงสุด ทางร้านชาไทย คลับ ขอขอบคุณทุกท่านที่ไว้วางใจติดตั้ง เเอพพลิเคชั่น ขอขอบคุณคับ ",
                        style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                  ),
                  SizedBox(height: 40,),
                ],
              ),
            ),
          )

    );
  }
}

class Item1 extends StatelessWidget {
  const Item1({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0.3, 1],
            colors: [Color(0xff49a09d), Color(0xff49a09d)]
        ),
      ),
      child: Container(
        color: Colors.grey,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
                 child: Image.asset("image/P3.jpg",
                 fit: BoxFit.fill,
                 ),
              ),
    );
  }
}

class Item2 extends StatelessWidget {
  const Item2({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0.3, 1],
            colors: [Color(0xff49a09d), Color(0xff49a09d)]
        ),
      ),
      child: Container(
        color: Colors.grey,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Image.asset("image/P1.jpg",
          fit: BoxFit.fill,),
      ),
    );
  }
}

class Item3 extends StatelessWidget {
  const Item3({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0.3, 1],
            colors: [Color(0xff49a09d), Color(0xff49a09d)]
        ),
      ),
      child: Container(
        color: Colors.grey,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Image.asset("image/P3.jpg",
          fit: BoxFit.fill,),
      ),
    );
  }
}

class Item4 extends StatelessWidget {
  const Item4({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0.3, 1],
            colors: [Color(0xff49a09d), Color(0xff49a09d)]
        ),
      ),
      child: Container(
        color: Colors.grey,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Image.asset("image/P1.jpg",
          fit: BoxFit.fill,),
      ),
    );
  }
}