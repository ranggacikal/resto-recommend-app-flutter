import 'package:restorecommendapps/domain/place/place_entity.dart';

abstract class PlaceRepository {
  Future<List<PlaceEntity>> getNearbyPlace({
    required double lat,
    required double lng
  });
}