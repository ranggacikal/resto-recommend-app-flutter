import 'package:restorecommendapps/data/place/place_remote_datasource.dart';
import 'package:restorecommendapps/domain/place/place_entity.dart';
import 'package:restorecommendapps/domain/place/place_repository.dart';

class PlaceRepositoryImpl implements PlaceRepository {
  final PlaceRemoteDatasource remote;

  PlaceRepositoryImpl(this.remote);

  @override
  Future<List<PlaceEntity>> getNearbyPlace({
    required double lat,
    required double lng,
  }) {
    return remote.getNearbyPlace(lat, lng);
  }

}