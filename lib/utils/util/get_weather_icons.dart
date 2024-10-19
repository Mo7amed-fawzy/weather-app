String getWeatherIcon({
  required int idweatherCode,
  bool isNight = false,
}) {
  String dayOrNight = isNight ? 'n' : 'd';
  String weatherCondition = 'assets/icons/01$dayOrNight.png';

  if (idweatherCode == 801) {
    weatherCondition = 'assets/icons/02$dayOrNight.png';
  } else if (idweatherCode == 802) {
    weatherCondition = 'assets/icons/03$dayOrNight.png';
  } else if (idweatherCode == 803) {
    weatherCondition = 'assets/icons/04$dayOrNight.png';
  } else if (idweatherCode == 804) {
    weatherCondition = 'assets/icons/04$dayOrNight.png';
  } else if (idweatherCode == 800) {
    weatherCondition = 'assets/icons/01$dayOrNight.png';
  } else if (idweatherCode > 700) {
    weatherCondition = 'assets/icons/50$dayOrNight.png';
  } else if (idweatherCode >= 600) {
    weatherCondition = 'assets/icons/13$dayOrNight.png';
  } else if (idweatherCode >= 500) {
    weatherCondition = 'assets/icons/10$dayOrNight.png';
  } else if (idweatherCode >= 300) {
    weatherCondition = 'assets/icons/09$dayOrNight.png';
  } else if (idweatherCode >= 200) {
    weatherCondition = 'assets/icons/11$dayOrNight.png';
  }

  return weatherCondition;
}

// بتربط الاي دي الجاي من ايبياي موقع (Open-Meteo) للمسار بتاع الصور
String getWeatherIcon2(int id, {bool isNight = false}) {
  String dayOrNight = isNight ? 'n' : 'd';

  if (id == 0) {
    return 'assets/icons/01$dayOrNight.png';
  }
  if (id == 1) {
    return 'assets/icons/6.png';
  }
  if (id == 2) {
    return 'assets/icons/03$dayOrNight.png';
  }
  if (id == 3) {
    return 'assets/icons/04$dayOrNight.png';
  }
  if (id == 45) {
    return 'assets/icons/04$dayOrNight.png';
  }
  if (id == 48) {
    return 'assets/icons/04$dayOrNight.png';
  }
  if (id == 53) {
    return 'assets/icons/39.png';
  }
  if (id > 50 && id < 60) {
    return 'assets/icons/09$dayOrNight.png';
  }
  if (id > 60 && id < 70) {
    return 'assets/icons/7.png';
  }
  if (id >= 70 && id < 80) {
    return 'assets/icons/04$dayOrNight.png';
  }
  if (id >= 80 && id < 85) {
    return 'assets/icons/7.png';
  }
  if (id > 85) {
    return 'assets/icons/13$dayOrNight.png';
  }

  return 'assets/icons/01$dayOrNight.png';
}




/*

0: Clear sky
1: Mainly clear
2: Partly cloudy
3: Overcast
45: Fog
48: Depositing rime fog
51: Light drizzle
52: Moderate drizzle
53: Heavy drizzle
55: Freezing drizzle
56: Light freezing drizzle
57: Heavy freezing drizzle
61: Slight rain
63: Moderate rain
65: Heavy rain
66: Light freezing rain
67: Heavy freezing rain
71: Slight snowfall
73: Moderate snowfall
75: Heavy snowfall
77: Ice pellets
80: Light rain showers
81: Moderate rain showers
82: Violent rain showers
85: Light snow showers
86: Moderate snow showers
87: Violent snow showers

*/