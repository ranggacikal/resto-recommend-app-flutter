import 'package:flutter/material.dart';
import 'package:restorecommendapps/core/dialogs/dialog_helper.dart';
import 'package:restorecommendapps/data/place/place_remote_datasource.dart';
import 'package:restorecommendapps/data/place/place_repository_impl.dart';
import 'package:restorecommendapps/domain/place/get_nearby_place_usecase.dart';
import 'package:restorecommendapps/domain/place/place_entity.dart';
import 'package:restorecommendapps/presentation/home/home_controller.dart';
import 'package:restorecommendapps/presentation/util/place_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final HomeController controller;
  List<PlaceEntity> places = [];

  @override
  void initState() {
    super.initState();
    controller = HomeController(
      GetNearbyPlaceUsecase(
        PlaceRepositoryImpl(
          PlaceRemoteDatasource()
        )
      )
    );
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadPlace();
    });
  }

  Future<void> _loadPlace() async {
    DialogHelper.showLoading(context, message: 'Mencari Tempat terdekat yang syahduu');

    try {
      final result = await controller.loadPlace();

      DialogHelper.hide(context);

      setState(() {
        places = result;
      });

      if (places.isEmpty) {
        DialogHelper.showError(context, message: 'Wah, Lagi gak ada yang syahdu nih disini');
      }
    } catch (e) {
      debugPrint('Parsing error: $e');
      DialogHelper.hide(context);
      DialogHelper.showError(
        context, 
        message: 'Gagal load data',
        onOk: () {
          _loadPlace();
        }
      );
    }
  } 
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Resto Deket Yang Paling Syahduuu')),
      body: places.isEmpty ? const Center(
        child: Text('Belum Ada Data')
      ) : ListView.builder(
          itemCount: places.length,
          itemBuilder: (_, i) {
            return PlaceCard(place: places[i]);
            // final place = places[i];
            // return ListTile(
            //   leading: Icon(
            //     place.type == 'cafe' ? Icons.local_cafe : Icons.restaurant
            //   ),
            //   title: Text(place.name),
            //   subtitle: Text(place.type),
            // );
          }
        )
    );
  }

}