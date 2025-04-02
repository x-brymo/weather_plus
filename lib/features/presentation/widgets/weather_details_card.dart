// lib/widgets/weather_details_card.dart
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../data/services/models/weather/weather_model.dart';

class WeatherDetailsCard extends StatelessWidget {
  final WeatherModel weather;

  const WeatherDetailsCard({
    super.key,
    required this.weather,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      color: Colors.black.withOpacity(0.6),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Weather Details',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: _buildDetailCard(
                    Icons.thermostat,
                    'Feels Like',
                    '${weather.feelsLike.round()}°C',
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _buildDetailCard(
                    Icons.water_drop,
                    'Humidity',
                    '${weather.humidity}%',
                  ),
                ),
              ],
            ).animate().fadeIn(delay: 200.ms, duration: 500.ms),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: _buildDetailCard(
                    Icons.air,
                    'Wind Speed',
                    '${weather.windSpeed} km/h',
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _buildDetailCard(
                    Icons.umbrella,
                    'Precipitation',
                    '${weather.precipitation}%',
                  ),
                ),
              ],
            ).animate().fadeIn(delay: 400.ms, duration: 500.ms),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailCard(IconData icon, String label, String value) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                icon,
                color: Colors.white70,
                size: 16,
              ),
              const SizedBox(width: 8),
              Text(
                label,
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 14,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}