import 'dart:convert';

import 'package:restorecommendapps/core/network/http_client.dart';
import 'package:restorecommendapps/domain/place/place_entity.dart';

class PlaceRemoteDatasource {
  Future<List<PlaceEntity>> getNearbyPlace(double lat, double lng) async {
    final query =
        '''
      [out:json];
      (
        node["amenity"="restaurant"](around:1500,$lat,$lng);
        node["amenity"="cafe"](around:1500,$lat,$lng);
        node["amenity"="fast_food"](around:1500,$lat,$lng);
      );
      out body;
    ''';

    final response = await httpClient.post(
      Uri.parse('https://overpass-api.de/api/interpreter'),
      body: {'data': query}
    );

    final data = jsonDecode(response.body);
    final List elements = data['elements'];

    return elements.take(30).map((e) {
      return PlaceEntity(
        name: e['tags']?['name'] ?? 'Undefined Name',
        type: e['tags']?['amenity'] ?? '',
        lat: e['lat'],
        lon: e['lon'],
      );
    }).toList();
  }
}
