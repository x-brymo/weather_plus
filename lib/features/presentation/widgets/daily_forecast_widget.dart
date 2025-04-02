// lib/widgets/daily_forecast_widget.dart
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DailyForecastItem {
  final DateTime date;
  final double temperature;
  final String weatherCondition;
  final String weatherIcon;

  DailyForecastItem({
    required this.date,
    required this.temperature,
    required this.weatherCondition,
    required this.weatherIcon,
  });
}

class DailyForecastWidget extends StatelessWidget {
  final List<DailyForecastItem> dailyForecast;

  const DailyForecastWidget({
    super.key,
    required this.dailyForecast,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.2),
        borderRadius: BorderRadius.circular(16),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '7-DAY FORECAST',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Icon(
                Icons.calendar_today,
                color: Colors.white,
                size: 16,
              ),
            ],
          ),
          const SizedBox(height: 16),
          ...dailyForecast.map((day) => _buildDailyItem(day)),
        ],
      ),
    );
  }

  Widget _buildDailyItem(DailyForecastItem day) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 100,
            child: Text(
              DateFormat('EEEE').format(day.date),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
          ),
          Row(
            children: [
              Image.network(
                'https://openweathermap.org/img/wn/${day.weatherIcon}@2x.png',
                width: 30,
                height: 30,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(
                    Icons.cloud,
                    color: Colors.white,
                    size: 24,
                  );
                },
              ),
              const SizedBox(width: 8),
              Text(
                day.weatherCondition,
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 14,
                ),
              ),
            ],
          ),
          Text(
            '${day.temperature.round()}°',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}