
import 'package:geoflutterfire2/geoflutterfire2.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:latlong2/latlong.dart';

class Firestore {

  // Init firestore and geoFlutterFire
  final geo = GeoFlutterFire();
  final _firestore = FirebaseFirestore.instance;

  void addToLocationsDB() async {
    print('hi');

    try {
    GeoFirePoint myLocation = geo.point(latitude: 37.786900, longitude: -122.410010);
    await _firestore
        .collection('locations')
        .add({'name': 'Naul Cafe', 'position': myLocation.data});

    } catch (e) {
      print(e);
    }
    
    print('done');
  }


  Future<List<Map<String, dynamic>>> getLocationsFromLocation(LatLng coords) async {
    GeoFirePoint center = geo.point(latitude: coords.latitude, longitude: coords.longitude);
    var collectionReference = _firestore.collection('locations');
    double radius = 50;
    String field = 'position';

    List<DocumentSnapshot> snapshots = await geo.collection(collectionRef: collectionReference)
        .within(center: center, radius: radius, field: field)
        .first;

    print(snapshots.length);
    return snapshots.map((doc) => doc.data() as Map<String, dynamic>).toList();
  }

}