// lib/providers/weather_providers.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../data/services/location_service.dart';
import '../../../data/services/models/weather/weather_model.dart';
import '../../../data/services/weather_service.dart';

final locationServiceProvider = Provider<LocationService>((ref) {
  return LocationService();
});

final weatherServiceProvider = Provider<WeatherService>((ref) {
  return WeatherService();
});

final currentLocationProvider = FutureProvider<({double lat, double lon, String city})>((ref) async {
  final locationService = ref.read(locationServiceProvider);
  final position = await locationService.getCurrentLocation();
  final city = await locationService.getCityFromCoordinates(position.latitude, position.longitude);
  return (lat: position.latitude, lon: position.longitude, city: city);
});

final currentWeatherProvider = FutureProvider<WeatherModel>((ref) async {
  final weatherService = ref.read(weatherServiceProvider);
  final locationData = await ref.watch(currentLocationProvider.future);
  
  final weather = await weatherService.getWeatherByLocation(locationData.lat, locationData.lon);
  final hourlyForecast = await weatherService.getHourlyForecast(locationData.lat, locationData.lon);
  
  return weather.copyWith(hourlyForecast: hourlyForecast);
});

final cityWeatherProvider = FutureProvider.family<WeatherModel, String>((ref, city) async {
  final weatherService = ref.read(weatherServiceProvider);
  return await weatherService.getWeatherByCity(city);
});

// This provider will store the list of cities the user has saved
final savedCitiesProvider = StateProvider<List<String>>((ref) {
  return ['Moscow', 'New York', 'London', 'Tokyo'];
});

// Weather condition mapper provider
final weatherConditionProvider = Provider.family<WeatherCondition, String>((ref, condition) {
  final weatherService = ref.read(weatherServiceProvider);
  return weatherService.mapCondition(condition);
});
