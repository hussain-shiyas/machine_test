import 'dart:developer';

import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class LocationServices {
  static Future<bool> isLocationPermission() async {
    return await Permission.location.isGranted || await Permission.location.isLimited;
  }

  static Future<String> getCurrentLocation() async {
    bool hasPermission = await isLocationPermission();
    if (!hasPermission) {
      hasPermission = await requestLocationPermission();
      if (!hasPermission) {
        return "";
      }
      if (hasPermission) {
        return getCurrentLocation();
      }
    }
    
    try {
      Position position = await Geolocator.getCurrentPosition();
      List<Placemark> placeMarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);

      if (placeMarks.isEmpty) return "";

      final place = placeMarks.first;
      return [
        place.subLocality,
        place.locality,
        place.administrativeArea,
      ].where((e) => e != null && e.isNotEmpty).join(", ");
    } catch (e) {
      return "";
    }
  }

  static Future<bool> requestLocationPermission() async {
    final status = await Permission.location.request();
    log("${status.name} checkinggg");
    if (status.isGranted || status.isLimited) {
      return true;
    } else if (status.isDenied) {
      return false;
    } else if (status.isPermanentlyDenied) {
      return false;
    } else {
      return false;
    }
  }

  static Future<void> openAppSettings() async {
    await openAppSettings();
  }
}
