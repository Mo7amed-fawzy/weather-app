import 'package:flutter/material.dart';
import 'package:weather_app/features/search/screens/weather_detail_screen.dart';
import 'package:weather_app/features/search/widgets/city_weather_tile.dart';
import 'package:weather_app/utils/models/famous_city_local.dart';

class FamousCitiesWeather extends StatelessWidget {
  const FamousCitiesWeather({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
        // علشان اجيب الداتا من الاي بي اي بدي الاندكس لهنا

        return InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (_) => WeatherDetailScreen(cityName: city.name)));
          },
          child: FamousCityTile(
            index: index,
            city: city,
          ),
        );
      },
    );
  }
}
