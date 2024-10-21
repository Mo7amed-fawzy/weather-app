import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/features/data/providers/get_hourly_weather_provider.dart';
import 'package:weather_app/utils/constants/app_colors.dart';
import 'package:weather_app/utils/constants/text_styles.dart';
import 'package:weather_app/utils/extensions/int.dart';
import 'package:weather_app/utils/functions/is_night_time.dart';
import 'package:weather_app/utils/util/get_weather_icons.dart';
import 'package:weather_app/utils/widgets/custom_loading_indicator.dart';

class HourlyForecastView extends ConsumerWidget {
  const HourlyForecastView({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hourlyWeather = ref.watch(hourlyWeatherProvider);
    // علشان هعرض حاجه جايه من المستقبل فاستعملت دي
    return hourlyWeather.when(
      data: (hourlyForecast) {
        return SizedBox(
          height: 100,
          child: ListView.builder(
            itemCount: 12,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final forecast = hourlyForecast.list[index];

              return HourlyForcastTile(
                idCode: forecast.weather[0].id,
                hour: forecast.dt.time,
                temp: forecast.main.temp.round(), //التقريب الصح
                isActive: index == 0,
                isNight: isNightTime(forecast.dt), // بديلها الدات تايم
              );
            },
          ),
        );
      },
      error: (error, stackTrace) {
        return Center(
          child: Text(error.toString()),
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

class HourlyForcastTile extends StatelessWidget {
  const HourlyForcastTile({
    super.key,
    required this.idCode,
    required this.hour,
    required this.temp,
    required this.isActive,
    required this.isNight,
  });

  final int idCode;
  final String hour;
  final int temp;
  final bool isActive;
  final bool isNight;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 16,
        top: 12,
        bottom: 12,
      ),
      child: Material(
        // بتدي خواص كتير زي ripple effect
        color: isActive ? AppColors.lightBlue : AppColors.accentBlue,
        borderRadius: BorderRadius.circular(15),
        elevation: isActive ? 8 : 0,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 10,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                getWeatherIcon(idweatherCode: idCode, isNight: isNight),
                width: 50,
              ),
              const SizedBox(width: 10),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    hour,
                    style: const TextStyle(
                      color: AppColors.white,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    '$temp°',
                    style: TextStyles.h3,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
