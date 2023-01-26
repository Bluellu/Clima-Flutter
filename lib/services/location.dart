import 'package:geolocator/geolocator.dart';

class Location  {

  Location();

  double latitude;
  double longitude;

  Future<void> getCurrentLocation() async {
    LocationPermission permission = await Geolocator.requestPermission();

    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);

      latitude = position.latitude;
      longitude = position.longitude;

    } catch (e) {
      print(e);
    }

    // await Geolocator.openAppSettings();
    // await Geolocator.openLocationSettings();

    //Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
  }
}