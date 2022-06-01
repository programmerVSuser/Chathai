import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class scenQRR extends StatelessWidget {
  const scenQRR({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter Demo Home Page')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navigator.of(context).push(MaterialPageRoute(
            //   builder: (context) => QRViewExample(),
            // ));
          },
          child: Text('qrView'),
        ),
      ),
    );
  }
}

