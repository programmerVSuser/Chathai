import 'package:auto_size_text/auto_size_text.dart';
import 'package:chathai/models/product_modal.dart';
import 'package:flutter/material.dart';

class showConten extends StatefulWidget {
  final ProductModal productModal;
  showConten({Key key, this.productModal}) : super(key: key);
  @override
  _showContenState createState() => _showContenState();
}

class _showContenState extends State<showConten> {
  ProductModal modal;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    modal = widget.productModal;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0), // here the desired height
        child: AppBar(
          shadowColor: Colors.transparent,
          backgroundColor: Colors.white,
          centerTitle: true,
          iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          ),
          title: Text(
            modal.name == null ? 'Wait a moment' : modal.name,
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(padding: EdgeInsets.only(top: 20),
          //color: Colors.white,
          child: Center(
              child: Column(
            children: [
              Container( //color: Colors.black,
                width: 300,
                height: 300,
                child: Image.network(modal.path),
              ),
              SizedBox(
                height: 25,
              ),
              Container(padding: EdgeInsets.only(left: 30,right: 30),
                child: Expanded(child: AutoSizeText(modal.detail)),
              ),
            ],
          )),
        ),
      ),
    );
  }
}
