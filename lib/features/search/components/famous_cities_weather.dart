import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/features/search/widgets/city_weather_tile.dart';
import 'package:weather_app/utils/models/famous_city_local.dart';

class FamousCitiesWeather extends StatelessWidget {
  const FamousCitiesWeather({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print('Number of cities: ${famousCities.length}');
    } // لطباعة عدد المدن

    return GridView.builder(
      itemCount: famousCities.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 20,
      ),
      itemBuilder: (context, index) {
        final city = famousCities[index];
        if (kDebugMode) {
          print('City name: ${city.name}');
        }

        return InkWell(
          onTap: () {},
          child: FamousCityTile(
            index: index,
            city: city,
          ),
        );
      },
    );
  }
}
