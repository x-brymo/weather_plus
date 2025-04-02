// lib/models/weather_model.dart
import 'package:flutter/animation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'weather_model.freezed.dart';
part 'weather_model.g.dart';

@freezed
abstract class WeatherModel with _$WeatherModel {
   factory WeatherModel({
    required final String cityName,
    required final String countryName,
    required final double temperature,
    required final double feelsLike,
    required final String weatherCondition,
    required final String weatherIcon,
    required final DateTime date,
    required final int humidity,
    required final double windSpeed,
    required final double precipitation,
    required final List<HourlyForecast> hourlyForecast,
  }) = _WeatherModel;

  factory WeatherModel.fromJson(Map<String, dynamic> json) => _$WeatherModelFromJson(json);
}

@freezed
abstract class HourlyForecast with _$HourlyForecast {
  factory HourlyForecast({
    required DateTime time,
    required double temperature,
    required String weatherIcon,
  }) = _HourlyForecast;

  factory HourlyForecast.fromJson(Map<String, dynamic> json) => _$HourlyForecastFromJson(json);
}

// lib/models/weather_condition.dart
enum WeatherCondition {
  sunny,
  partlyCloudy,
  cloudy,
  rain,
  snow,
  thunderstorm,
  fog,
  mist,
  clear,
  unknown
}

extension WeatherConditionExtension on WeatherCondition {
  String get displayName {
    switch (this) {
      case WeatherCondition.sunny:
        return "Sunny";
      case WeatherCondition.partlyCloudy:
        return "Partly Cloudy";
      case WeatherCondition.cloudy:
        return "Cloudy";
      case WeatherCondition.rain:
        return "Rain";
      case WeatherCondition.snow:
        return "Snow";
      case WeatherCondition.thunderstorm:
        return "Thunderstorm";
      case WeatherCondition.fog:
        return "Fog";
      case WeatherCondition.mist:
        return "Mist";
      case WeatherCondition.clear:
        return "Clear";
      case WeatherCondition.unknown:
        return "Unknown";
    }
  }

  String get animationAsset {
    switch (this) {
      case WeatherCondition.sunny:
        return "assets/animations/sunny.json";
      case WeatherCondition.partlyCloudy:
        return "assets/animations/partly_cloudy.json";
      case WeatherCondition.cloudy:
        return "assets/animations/cloudy.json";
      case WeatherCondition.rain:
        return "assets/animations/cloudy_rain.json";
      case WeatherCondition.snow:
        return "assets/animations/snow.json";
      case WeatherCondition.thunderstorm:
        return "assets/animations/thunderstorm.json";
      case WeatherCondition.fog:
        return "assets/animations/fog.json";
      case WeatherCondition.mist:
        return "assets/animations/mist.json";
      case WeatherCondition.clear:
        return "assets/animations/clear-dark.json";
      case WeatherCondition.unknown:
        return "assets/animations/ghost-dark.json";
    }
  }

  Color get backgroundColor {
    switch (this) {
      case WeatherCondition.sunny:
        return const Color(0xFFFFA41B);
      case WeatherCondition.partlyCloudy:
        return const Color(0xFF85C1E9);
      case WeatherCondition.cloudy:
        return const Color(0xFF7F8C8D);
      case WeatherCondition.rain:
        return const Color(0xFF2C3E50);
      case WeatherCondition.snow:
        return const Color(0xFF1A237E);
      case WeatherCondition.thunderstorm:
        return const Color(0xFF1C2833);
      case WeatherCondition.fog:
      case WeatherCondition.mist:
        return const Color(0xFF95A5A6);
      case WeatherCondition.clear:
        return const Color(0xFF3498DB);
      case WeatherCondition.unknown:
        return const Color.fromARGB(255, 25, 28, 31);
    }
  }
}