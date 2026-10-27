import 'dart:async';

import 'package:geolocator/geolocator.dart';

import 'location_result.dart';

class LocationService {
  const LocationService();

  /// This is a simplified Bangladesh boundary polygon.
  ///
  /// For production, replace this with a detailed official GeoJSON boundary
  /// containing the complete Bangladesh border.
  static const List<_GeoPoint> _bangladeshBoundary = [
    _GeoPoint(26.6345, 88.0283),
    _GeoPoint(26.4580, 88.3615),
    _GeoPoint(26.0290, 88.7450),
    _GeoPoint(25.5470, 88.9000),
    _GeoPoint(25.2700, 89.0000),
    _GeoPoint(25.0000, 89.7000),
    _GeoPoint(24.8000, 90.1500),
    _GeoPoint(24.5000, 90.5000),
    _GeoPoint(24.2000, 90.9000),
    _GeoPoint(23.9000, 91.3000),
    _GeoPoint(23.7000, 91.7000),
    _GeoPoint(23.4500, 92.0000),
    _GeoPoint(22.9000, 92.3000),
    _GeoPoint(22.5000, 92.3500),
    _GeoPoint(22.0000, 92.0000),
    _GeoPoint(21.5000, 91.8000),
    _GeoPoint(21.1500, 91.7000),
    _GeoPoint(20.7500, 91.8000),
    _GeoPoint(20.6000, 91.3000),
    _GeoPoint(21.0000, 90.9000),
    _GeoPoint(21.4000, 90.7000),
    _GeoPoint(21.8000, 90.4000),
    _GeoPoint(22.0000, 90.0000),
    _GeoPoint(22.2500, 89.6500),
    _GeoPoint(22.5000, 89.3000),
    _GeoPoint(22.7000, 89.0000),
    _GeoPoint(22.9000, 88.7000),
    _GeoPoint(23.2000, 88.5000),
    _GeoPoint(23.5000, 88.3000),
    _GeoPoint(23.8000, 88.1000),
    _GeoPoint(24.1000, 88.0000),
    _GeoPoint(24.4000, 87.9500),
    _GeoPoint(24.8000, 88.0000),
    _GeoPoint(25.2000, 88.0000),
    _GeoPoint(25.6000, 88.0000),
    _GeoPoint(26.0000, 88.0000),
  ];

  Future<LocationResult> validateCurrentLocation() async {
    try {
      final serviceEnabled = await Geolocator.isLocationServiceEnabled();

      if (!serviceEnabled) {
        return const LocationResult(
          status: LocationResultStatus.locationServicesDisabled,
          message: 'Location services are disabled.',
        );
      }

      var permission = await Geolocator.checkPermission();

      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      }

      if (permission == LocationPermission.denied) {
        return const LocationResult(
          status: LocationResultStatus.permissionDenied,
          message: 'Location permission was denied.',
        );
      }

      if (permission == LocationPermission.deniedForever) {
        return const LocationResult(
          status: LocationResultStatus.permissionDeniedForever,
          message: 'Location permission is permanently denied.',
        );
      }

      if (!_hasUsablePermission(permission)) {
        return const LocationResult(
          status: LocationResultStatus.permissionDenied,
          message: 'Location permission was not granted.',
        );
      }

      final position = await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.high,
          distanceFilter: 0,
          timeLimit: Duration(seconds: 20),
        ),
      );

      final isInsideBangladesh = _isPointInsideBangladesh(
        latitude: position.latitude,
        longitude: position.longitude,
      );

      if (!isInsideBangladesh) {
        return LocationResult(
          status: LocationResultStatus.outsideBangladesh,
          message: 'The current location is outside Bangladesh.',
          latitude: position.latitude,
          longitude: position.longitude,
        );
      }

      return LocationResult(
        status: LocationResultStatus.allowed,
        message: 'The current location is inside Bangladesh.',
        latitude: position.latitude,
        longitude: position.longitude,
      );
    } on TimeoutException {
      return const LocationResult(
        status: LocationResultStatus.locationUnavailable,
        message: 'The location request timed out.',
      );
    } on LocationServiceDisabledException {
      return const LocationResult(
        status: LocationResultStatus.locationServicesDisabled,
        message: 'Location services are disabled.',
      );
    } on PermissionDefinitionsNotFoundException {
      return const LocationResult(
        status: LocationResultStatus.error,
        message: 'Location permission configuration is missing.',
      );
    } catch (error) {
      return LocationResult(
        status: LocationResultStatus.error,
        message: 'Unable to determine the current location: $error',
      );
    }
  }

  bool _hasUsablePermission(LocationPermission permission) {
    return permission == LocationPermission.whileInUse ||
        permission == LocationPermission.always;
  }

  /// Ray-casting point-in-polygon algorithm.
  bool _isPointInsideBangladesh({
    required double latitude,
    required double longitude,
  }) {
    final point = _GeoPoint(latitude, longitude);

    var isInside = false;

    for (
      var i = 0, j = _bangladeshBoundary.length - 1;
      i < _bangladeshBoundary.length;
      j = i++
    ) {
      final current = _bangladeshBoundary[i];
      final previous = _bangladeshBoundary[j];

      final crossesLongitude =
          (current.longitude > point.longitude) !=
          (previous.longitude > point.longitude);

      if (!crossesLongitude) {
        continue;
      }

      final intersectionLatitude =
          previous.latitude +
          (current.latitude - previous.latitude) *
              (point.longitude - previous.longitude) /
              (current.longitude - previous.longitude);

      if (point.latitude < intersectionLatitude) {
        isInside = !isInside;
      }
    }

    return isInside;
  }

  Future<bool> openApplicationSettings() {
    return Geolocator.openAppSettings();
  }

  Future<bool> openLocationSettings() {
    return Geolocator.openLocationSettings();
  }
}

class _GeoPoint {
  const _GeoPoint(this.latitude, this.longitude);

  final double latitude;
  final double longitude;
}
