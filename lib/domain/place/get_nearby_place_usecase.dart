import 'package:restorecommendapps/domain/place/place_entity.dart';
import 'package:restorecommendapps/domain/place/place_repository.dart';

class GetNearbyPlaceUsecase {
  final PlaceRepository repository;

  GetNearbyPlaceUsecase(this.repository);

  Future<List<PlaceEntity>> execute(double lat, double lng) {
    return repository.getNearbyPlace(lat: lat, lng: lng);
  }
}