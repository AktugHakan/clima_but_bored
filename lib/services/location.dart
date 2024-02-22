import 'package:geolocator/geolocator.dart';

class Location {
  late final double lat;
  late final double long;

  Location({required this.lat, required this.long});

  static Future<Location> get() async {
    acquireLocationPermission();
    var loc = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low);
    return Location(lat: loc.latitude, long: loc.longitude);
  }

  static void acquireLocationPermission() async {
    var permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      print("Permission denied. Asking again.");
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        print("Couldn't acquire location permission!");
      }
    } else if (permission == LocationPermission.deniedForever) {
      print("Denied forever.");
    }
  }
}
