import 'package:flutter/material.dart';
import 'package:weather_app/features/home/views/gradient_container.dart';
import 'package:weather_app/features/search/widgets/location_icon.dart';
import 'package:weather_app/features/search/widgets/round_text_field.dart';
import 'package:weather_app/utils/constants/text_styles.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late final TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const GradientContainer(
      children: [
        // Page title
        Align(
          alignment: Alignment.center,
          child: Text(
            'Pick Location',
            style: TextStyles.h1,
          ),
        ),

        SizedBox(height: 20),

        // Page subtitle
        Text(
          'Find the area or city that you want to know the detailed weather info at this time',
          style: TextStyles.subtitleText,
          textAlign: TextAlign.center,
        ),

        SizedBox(height: 40),

        // Pick location row
        Row(
          children: [
            // Choose city text field
            Expanded(
              child: RoundTextField(),
            ),
            SizedBox(width: 15),

            LocationIcon(),
          ],
        ),

        SizedBox(height: 30),

        // FamousCitiesWeather(),
      ],
    );
  }
}
