import 'package:geolocator/geolocator.dart';
import 'package:restorecommendapps/domain/place/get_nearby_place_usecase.dart';
import 'package:restorecommendapps/domain/place/place_entity.dart';

class HomeController {
  final GetNearbyPlaceUsecase useCase;

  HomeController(this.useCase);

  Future<List<PlaceEntity>> loadPlace() async {
    final position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high
    );
    return useCase.execute(position.latitude, position.longitude);
  }
}