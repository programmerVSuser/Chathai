import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
class Gmap extends StatefulWidget {
  const Gmap({Key key}) : super(key: key);

  @override
  _GmapState createState() => _GmapState();
}

class _GmapState extends State<Gmap> {
  Set<Marker> _marker = {};
  void _onMap(GoogleMapController controller) {
    setState(() {
      _marker.add(Marker(
          markerId: MarkerId("id-1"),
          position: LatLng(13.803865842028046, 100.73932755974637),
          infoWindow: InfoWindow(
              title: "Chathai Club",
              snippet: "ร้านน้ำที่อร่อยสอาดเเละหอมหน้ากิน"
          )
      ));
      _marker.add(Marker(
          markerId: MarkerId("id-2"),
          position: LatLng(13.810042766396844, 100.73652878543292),
          infoWindow: InfoWindow(
              title: "Chathai Club",
              snippet: "ร้านน้ำที่อร่อยสอาดเเละหอมหน้ากิน"
          )
      ));
      _marker.add(Marker(
          markerId: MarkerId("id-3"),
          position: LatLng(13.799686356991158, 100.74002638563948),
          infoWindow: InfoWindow(
              title: "Chathai Club",
              snippet: "ร้านน้ำที่อร่อยสอาดเเละหอมหน้ากิน"
          )
      ));

      _marker.add(Marker(
          markerId: MarkerId("id-4"),
          position: LatLng(10.4789810114401, 99.03176436800868),
          infoWindow: InfoWindow(
              title: "Chathai Club",
              snippet: "ร้านน้ำที่อร่อยสอาดเเละหอมหน้ากิน"
          )
      ));

      _marker.add(Marker(
          markerId: MarkerId("id-5"),
          position: LatLng(7.522031897690192, 99.42514053723515),
          infoWindow: InfoWindow(
              title: "Chathai Club",
              snippet: "ร้านน้ำที่อร่อยสอาดเเละหอมหน้ากิน"
          )
      ));

      _marker.add(Marker(
          markerId: MarkerId("id-6"),
          position: LatLng(18.015922778656176, 99.67995859200313),
          infoWindow: InfoWindow(
              title: "Chathai Club",
              snippet: "ร้านน้ำที่อร่อยสอาดเเละหอมหน้ากิน"
          )
      ));

      _marker.add(Marker(
          markerId: MarkerId("id-7"),
          position: LatLng(16.36667947848996, 102.9602000490572),
          infoWindow: InfoWindow(
              title: "Chathai Club",
              snippet: "ร้านน้ำที่อร่อยสอาดเเละหอมหน้ากิน"
          )
      ));
    }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'Map Chathai Club',
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
      ),
      body: GoogleMap(
        onMapCreated: _onMap,
        markers: _marker,
        initialCameraPosition: CameraPosition(
          target: LatLng(13.803865842028046, 100.73932755974637),
          zoom: 15,
        ),
      ),
    );
  }
}
