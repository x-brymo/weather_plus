import 'package:weather_plus/core/handdler/handdler_dio.dart';
import 'models/weather/weather_model.dart';

class WeatherService {
  final dioConnecting = HandlerDio.dioConnecting;

  Future<WeatherModel> getWeatherByLocation(double lat, double lon) async {
    try {
      final response = await dioConnecting.get('weather', queryParameters: {
        'lat': lat,
        'lon': lon,
        'units': 'metric',
      });

      final data = response.data;

      return WeatherModel(
        cityName: data['name'],
        countryName: data['sys']['country'],
        temperature: data['main']['temp'].toDouble(),
        feelsLike: data['main']['feels_like'].toDouble(),
        humidity: data['main']['humidity'],
        windSpeed: data['wind']['speed'].toDouble(),
        weatherCondition: data['weather'][0]['description'],
        weatherIcon: data['weather'][0]['icon'],
        date: DateTime.fromMillisecondsSinceEpoch(data['dt'] * 1000),
        precipitation: data['rain'] != null ? data['rain']['1h']?.toDouble() ?? 0.0 : 0.0,
        hourlyForecast: [],
      );
    } catch (e) {
      print("❌ Error fetching weather by location: $e");
      throw Exception("Failed to fetch weather data");
    }
  }

  Future<WeatherModel> getWeatherByCity(String city) async {
    try {
      final response = await dioConnecting.get('weather', queryParameters: {
        'q': city,
        'units': 'metric',
      });

      final data = response.data;

      return WeatherModel(
        cityName: data['name'],
        countryName: data['sys']['country'],
        temperature: data['main']['temp'].toDouble(),
        feelsLike: data['main']['feels_like'].toDouble(),
        humidity: data['main']['humidity'],
        windSpeed: data['wind']['speed'].toDouble(),
        weatherCondition: data['weather'][0]['description'],
        weatherIcon: data['weather'][0]['icon'],
        date: DateTime.fromMillisecondsSinceEpoch(data['dt'] * 1000),
        precipitation: data['rain'] != null ? data['rain']['1h']?.toDouble() ?? 0.0 : 0.0,
        hourlyForecast: [],
      );
    } catch (e) {
      print("❌ Error fetching weather by city: $e");
      throw Exception("Failed to fetch weather data");
    }
  }

  Future<List<HourlyForecast>> getHourlyForecast(double lat, double lon) async {
  try {
    final response = await dioConnecting.get('forecast', queryParameters: {
      'lat': lat,
      'lon': lon,
      'units': 'metric',
    });

    final data = response.data;

    List<HourlyForecast> forecast = data['list'].map<HourlyForecast>((item) {
      return HourlyForecast(
        time: DateTime.fromMillisecondsSinceEpoch(item['dt'] * 1000),
        temperature: item['main']['temp'].toDouble(),
        weatherIcon: item['weather'][0]['icon'],
      );
    }).toList();

    return forecast;
  } catch (e) {
    print("❌ Error fetching hourly forecast: $e");
    throw Exception("Failed to fetch hourly forecast");
  }
}


  WeatherCondition mapCondition(String condition) {
    switch (condition.toLowerCase()) {
      case 'clear':
        return WeatherCondition.clear;
      case 'cloudy':
        return WeatherCondition.cloudy;
      case 'rain':
        return WeatherCondition.rain;
      case 'snow':
        return WeatherCondition.snow;
      default:
        return WeatherCondition.unknown;
    }
  }
}
