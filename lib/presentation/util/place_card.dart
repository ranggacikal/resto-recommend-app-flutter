import 'package:flutter/material.dart';
import 'package:restorecommendapps/domain/place/place_entity.dart';
import 'package:restorecommendapps/theme/app_colors.dart';

class PlaceCard extends StatelessWidget {
  final PlaceEntity place;

  const PlaceCard({
    super.key,
    required this.place
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(left: 16, right: 16, top: 12),
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(12)
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                color: AppColors.secondary,
                borderRadius: BorderRadius.circular(8)
              ),
              child: place.type == 'cafe' ? const Icon(Icons.local_cafe, color: AppColors.primary) : const Icon(Icons.restaurant, color: AppColors.primary),
            ),
            const SizedBox(width: 12),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    place.name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    place.type,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey.shade600
                    ),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: const [
                      Icon(Icons.star, size: 14, color: Colors.orange),
                      SizedBox(width: 4),
                      Text(
                        '4.9',
                        style: TextStyle(fontSize: 12),
                      ),
                      SizedBox(width: 12),
                      Icon(Icons.location_on, size: 14),
                      SizedBox(width: 4),
                      Text(
                        '1.5km',
                        style: TextStyle(fontSize: 12)
                      )
                    ],
                  )
                ],
              )
            )
          ],
        ),
      ),
    );
  }

}