import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/features/data/providers/get_weekly_forecast_provider.dart';
import 'package:weather_app/features/forcast_report/widget/subscript_text.dart';
import 'package:weather_app/utils/constants/app_colors.dart';
import 'package:weather_app/utils/constants/text_styles.dart';
import 'package:weather_app/utils/extensions/datetime.dart';
import 'package:weather_app/utils/util/get_weather_icons.dart';
import 'package:weather_app/utils/widgets/custom_loading_indicator.dart';

class WeeklyForecastView extends ConsumerWidget {
  const WeeklyForecastView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weeklyForecast = ref.watch(weeklyForecastProvider);

    return weeklyForecast.when(
      data: (weatherData) {
        return ListView.builder(
          itemCount: weatherData.daily.weatherCode.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            final dayOfWeek =
                DateTime.parse(weatherData.daily.time[index]).dayOfWeek;
            final date = weatherData.daily.time[index];
            final temp = weatherData.daily.temperature2mMax[index];
            final icon = weatherData.daily.weatherCode[index];

            return WeeklyForecastTile(
              date: date,
              day: dayOfWeek,
              icon: getWeatherIcon2(icon),
              temp: temp.round(),
            );
          },
        );
      },
      error: (error, stackTrace) {
        return Center(
          child: Text(
            error.toString(),
          ),
        );
      },
      loading: () {
        return const Center(
          child: CustomLoadingIndicator(),
        );
      },
    );
  }
}

class WeeklyForecastTile extends StatelessWidget {
  const WeeklyForecastTile({
    super.key,
    required this.day,
    required this.date,
    required this.temp,
    required this.icon,
  });

  final String day;
  final String date;
  final int temp;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 20,
      ),
      margin: const EdgeInsets.symmetric(
        vertical: 12,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: AppColors.accentBlue,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text(
                day,
                style: TextStyles.h3,
              ),
              const SizedBox(height: 5),
              Text(
                date,
                style: TextStyles.subtitleText,
              ),
            ],
          ),

          // Temperature
          SuperscriptText(
            text: '$temp',
            textcolor: AppColors.white,
            superScript: '°C',
            superscriptColor: AppColors.grey,
          ),

          // weather icon
          Image.asset(
            icon,
            width: 60,
          ),
        ],
      ),
    );
  }
}
