// lib/widgets/current_weather_widget.dart
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';

import '../../data/services/models/weather/weather_model.dart';


class CurrentWeatherWidget extends StatelessWidget {
  final WeatherModel weather;
  final WeatherCondition condition;

  const CurrentWeatherWidget({
    super.key,
    required this.weather,
    required this.condition,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Date
        Text(
          DateFormat('EEEE, MMMM d').format(weather.date),
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 8),
        
        // Temperature and feels like
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${weather.temperature.round()}',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 72,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              '°C',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        Text(
          'Feels like ${weather.feelsLike.round()}°C',
          style: const TextStyle(
            color: Colors.white70,
            fontSize: 16,
          ),
        ),
        
        // Weather condition animation
        SizedBox(
          height: 180,
          child: Lottie.asset(
            condition.animationAsset,
            fit: BoxFit.contain,
          ),
        ),
        
        // Weather condition text
        Text(
          condition.displayName,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        
        // Weather details (humidity, wind, etc.)
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildDetailItem(
                Icons.water_drop,
                '${weather.humidity}%',
                'Humidity',
              ),
              _buildDetailItem(
                Icons.air,
                '${weather.windSpeed} km/h',
                'Wind',
              ),
              _buildDetailItem(
                Icons.umbrella,
                '${weather.precipitation}%',
                weather.precipitation > 0 ? 'Rain' : 'Precipitation',
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDetailItem(IconData icon, String value, String label) {
    return Column(
      children: [
        Icon(
          icon,
          color: Colors.white,
          size: 24,
        ),
        const SizedBox(height: 8),
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style: const TextStyle(
            color: Colors.white70,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}