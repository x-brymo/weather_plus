// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WeatherModel _$WeatherModelFromJson(Map<String, dynamic> json) =>
    _WeatherModel(
      cityName: json['cityName'] as String,
      countryName: json['countryName'] as String,
      temperature: (json['temperature'] as num).toDouble(),
      feelsLike: (json['feelsLike'] as num).toDouble(),
      weatherCondition: json['weatherCondition'] as String,
      weatherIcon: json['weatherIcon'] as String,
      date: DateTime.parse(json['date'] as String),
      humidity: (json['humidity'] as num).toInt(),
      windSpeed: (json['windSpeed'] as num).toDouble(),
      precipitation: (json['precipitation'] as num).toDouble(),
      hourlyForecast:
          (json['hourlyForecast'] as List<dynamic>)
              .map((e) => HourlyForecast.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$WeatherModelToJson(_WeatherModel instance) =>
    <String, dynamic>{
      'cityName': instance.cityName,
      'countryName': instance.countryName,
      'temperature': instance.temperature,
      'feelsLike': instance.feelsLike,
      'weatherCondition': instance.weatherCondition,
      'weatherIcon': instance.weatherIcon,
      'date': instance.date.toIso8601String(),
      'humidity': instance.humidity,
      'windSpeed': instance.windSpeed,
      'precipitation': instance.precipitation,
      'hourlyForecast': instance.hourlyForecast,
    };

_HourlyForecast _$HourlyForecastFromJson(Map<String, dynamic> json) =>
    _HourlyForecast(
      time: DateTime.parse(json['time'] as String),
      temperature: (json['temperature'] as num).toDouble(),
      weatherIcon: json['weatherIcon'] as String,
    );

Map<String, dynamic> _$HourlyForecastToJson(_HourlyForecast instance) =>
    <String, dynamic>{
      'time': instance.time.toIso8601String(),
      'temperature': instance.temperature,
      'weatherIcon': instance.weatherIcon,
    };
