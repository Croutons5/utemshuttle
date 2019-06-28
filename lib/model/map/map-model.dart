import 'package:flutter/widgets.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:scoped_model/scoped_model.dart';

class MapModel extends Model {
  MapModel() {
    this.setMarker();
  }
  Geolocator _geolocator = new Geolocator();

  // marker object
  setMarker() =>  BitmapDescriptor.fromAssetImage(ImageConfiguration(size: Size(24,24)), 'assets/icon/shuttle.png').then((marker) => this.marker = marker);
  BitmapDescriptor marker;

  // google map object
  GoogleMapController googleMapController;
  LatLng latLng;

  getLocation() async {
    var position = await _geolocator.getCurrentPosition();
    this.latLng = LatLng(position.latitude, position.longitude);
    notifyListeners();
  }

  setCurrentLocation() async {
    await googleMapController.animateCamera(CameraUpdate.newLatLng(latLng));
  }
}
