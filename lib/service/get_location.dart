import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class GetLocation {
  Future<List<Placemark>> getLocation() async {
    await Geolocator.checkPermission();
     await Geolocator.requestPermission();
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low);
    print(position);

    List<Placemark> placemarks = await placemarkFromCoordinates(
      position.latitude,
      position.longitude,
      localeIdentifier: 'en_US',
    );
    print(placemarks[0].locality!);

    return placemarks;
  }
}
