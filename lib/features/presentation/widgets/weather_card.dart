
import 'package:flutter/material.dart';
import '../../data/services/models/weather/weather_model.dart';
import 'package:intl/intl.dart';


class WeatherCard extends StatelessWidget {
  final WeatherModel weather;
  final WeatherCondition condition;

  const WeatherCard({
    super.key,
    required this.weather,
    required this.condition,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              condition.backgroundColor,
              condition.backgroundColor.withOpacity(0.7),
            ],
          ),
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // City name
            Text(
              weather.cityName,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              DateFormat('E, MMM d').format(weather.date),
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 12,
              ),
            ),
            
            const Spacer(),
            
            // Temperature
            Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${weather.temperature.round()}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    '°C',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
            
            const Spacer(),
            
            // Weather details
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      condition.displayName,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.water_drop,
                          color: Colors.white70,
                          size: 12,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '${weather.humidity}%',
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Icon(
                  _getWeatherIcon(condition),
                  color: Colors.white,
                  size: 32,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
IconData _getWeatherIcon(WeatherCondition condition) {
    switch (condition) {
      case WeatherCondition.sunny:
        return Icons.wb_sunny;
      case WeatherCondition.partlyCloudy:
        return Icons.wb_cloudy; // partly_cloudy_day
      case WeatherCondition.cloudy:
        return Icons.cloud;
      case WeatherCondition.rain:
        return Icons.umbrella;
      case WeatherCondition.snow:
        return Icons.ac_unit;
      case WeatherCondition.thunderstorm:
        return Icons.flash_on;
      case WeatherCondition.fog:
      case WeatherCondition.mist:
        return Icons.cloud_queue;
      case WeatherCondition.clear:
        return Icons.nightlight_round;
      case WeatherCondition.unknown:
        return Icons.help_outline;
      }
  }
}