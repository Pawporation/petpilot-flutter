
import 'package:geoflutterfire2/geoflutterfire2.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:latlong2/latlong.dart';

class Firestore {

  // Init firestore and geoFlutterFire
  final geo = GeoFlutterFire();
  final _firestore = FirebaseFirestore.instance;

  void addToLocationsDB() async {

    try {
      GeoFirePoint myLocation1 = geo.point(latitude: 37.786900, longitude: -122.410010);
      GeoFirePoint myLocation2 = geo.point(latitude: 37.775871, longitude: -122.406761);
      GeoFirePoint myLocation3 = geo.point(latitude: 37.777053, longitude: -122.407825);
      GeoFirePoint myLocation4 = geo.point(latitude: 37.783002, longitude: -122.401652);
      GeoFirePoint myLocation5 = geo.point(latitude: 37.778679, longitude: -122.406556);
      GeoFirePoint myLocation6 = geo.point(latitude: 37.777222, longitude: -122.406118);
      GeoFirePoint myLocation7 = geo.point(latitude: 37.781480, longitude: -122.406582);
      GeoFirePoint myLocation8 = geo.point(latitude: 37.788259, longitude: -122.401869);

      await _firestore
          .collection('locations')
          .add({'id': '1', 'name': 'Fiddle Fig', 'position': myLocation1.data, 'type': 'restaurant'});

      await _firestore
        .collection('locations')
        .add({'id': '2', 'name': 'Pet Vet', 'position': myLocation2.data, 'type': 'medical'});

      await _firestore
        .collection('locations')
        .add({'id': '3', 'name': 'Zoom Groom', 'position': myLocation3.data, 'type': 'grooming'});


      await _firestore
        .collection('locations')
        .add({'id': '4', 'name': 'Doggie DayCare', 'position': myLocation4.data, 'type': 'dogcare'});

      await _firestore
        .collection('locations')
        .add({'id': '5', 'name': 'Park', 'position': myLocation5.data, 'type': 'outdoor'});


      await _firestore
        .collection('locations')
        .add({'id': '6', 'name': 'Vista Peak', 'position': myLocation6.data, 'type': 'outdoor'});

      await _firestore
        .collection('locations')
        .add({'id': '7', 'name': 'Doodle Romp', 'position': myLocation7.data, 'type': 'event'});

      await _firestore
        .collection('locations')
        .add({'id': '8', 'name': 'Doggie Boutique', 'position': myLocation7.data, 'type': 'store'});

    } catch (e) {
      // TODO: handle error exception.
    }
  }


  Future<List<Map<String, dynamic>>> getLocationsFromLocation(LatLng coords) async {
    GeoFirePoint center = geo.point(latitude: coords.latitude, longitude: coords.longitude);
    var collectionReference = _firestore.collection('locations');
    double radius = 50;
    String field = 'position';

    List<DocumentSnapshot> snapshots = await geo.collection(collectionRef: collectionReference)
        .within(center: center, radius: radius, field: field)
        .first;

    return snapshots.map((doc) => doc.data() as Map<String, dynamic>).toList();
  }
}