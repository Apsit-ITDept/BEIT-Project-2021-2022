// import 'package:geocoding/geocoding.dart';
// import 'package:geolocator/geolocator.dart';

// class Location {
  
  
//   String currentLocation = 'My Address';
//   String mapLink = 'https://www.google.com/maps/search/?api=1&query=';
//   late Position currentPosition;

//   Future<Position?> _getGeoLocationPosition() async {
    
//     bool serviceEnabled;
//     LocationPermission permission;
//     // Test if location services are enabled.
//     serviceEnabled = await Geolocator.isLocationServiceEnabled();
//     if (!serviceEnabled) {
//       // Location services are not enabled don't continue
//       // accessing the position and request users of the
//       // App to enable the location services.
//       await Geolocator.openLocationSettings();
//       return Future.error('Location services are disabled.');
//     }
//     permission = await Geolocator.checkPermission();
//     if (permission == LocationPermission.denied) {
//       permission = await Geolocator.requestPermission();
//       if (permission == LocationPermission.denied) {
//         return Future.error('Location permissions are denied');
//       }
//     }
//     if (permission == LocationPermission.deniedForever) {
//       // Permissions are denied forever, handle appropriately.
//       return Future.error(
//           'Location permissions are permanently denied, we cannot request permissions.');
//     }
//     // When we reach here, permissions are granted and we can
//     // continue accessing the position of the device.
//     Position position = await Geolocator.getCurrentPosition(
//         desiredAccuracy: LocationAccuracy.high);

//     currentPosition = position;
//     String currentAddress = currentPosition.latitude.toString() +
//         "," +
//         currentPosition.longitude.toString();
//     try {
//       List<Placemark> placemarks =
//           await placemarkFromCoordinates(position.latitude, position.longitude);

//       Placemark place = placemarks[0];
//       currentPosition = position;
//       currentLocation = "${place.locality}";
//     } catch (e) {
//       print(e);
//     }
//   }
// }
