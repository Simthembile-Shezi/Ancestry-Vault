import 'package:ancestry_vault/model/location_fact.dart';
import 'package:ancestry_vault/model/location_image.dart';

class FamilyLocation {
  final String id;
  final String name;
  final String coordinates;
  final String address;
  final List<LocationFact> locationFacts;
  final List<LocationImage> images;

  FamilyLocation(this.id, this.name, this.coordinates, this.address,
      this.locationFacts, this.images);
}
