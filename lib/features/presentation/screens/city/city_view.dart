import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../providers/weather/weather_provider.dart';
import '../../widgets/animated_background.dart';
import '../../widgets/current_weather_widget.dart';
import '../../widgets/hourly_forecast_widget.dart';
import '../../widgets/weather_details_card.dart';

class CityWeatherScreen extends ConsumerWidget {
  final String cityName;

  const CityWeatherScreen({
    super.key,
    required this.cityName,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cityWeatherAsync = ref.watch(cityWeatherProvider(cityName));

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border, color: Colors.white),
            onPressed: () {
              // Add to favorites functionality
              final cities = ref.read(savedCitiesProvider);
              if (!cities.contains(cityName)) {
                ref.read(savedCitiesProvider.notifier).state = [...cities, cityName];
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('$cityName added to favorites')),
                );
              }
            },
          ),
        ],
      ),
      body: cityWeatherAsync.when(
        data: (weather) {
          final condition = ref.watch(weatherConditionProvider(weather.weatherCondition));
          
          return Stack(
            children: [
              // Animated Background
              AnimatedBackground(condition: condition),
              
              // Content
              SafeArea(
                child: ListView(
                  padding: const EdgeInsets.all(16),
                  children: [
                    // City Name and Date
                    Text(
                      '${weather.cityName}, ${weather.countryName}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ).animate().fadeIn(duration: 400.ms),
                    Text(
                      DateFormat('EEEE, MMMM d').format(weather.date),
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 16,
                      ),
                    ).animate().fadeIn(duration: 400.ms, delay: 100.ms),
                    
                    const SizedBox(height: 32),
                    
                    // Current Weather
                    CurrentWeatherWidget(
                      weather: weather,
                      condition: condition,
                    ).animate().fadeIn(duration: 600.ms, delay: 200.ms),
                    
                    const SizedBox(height: 32),
                    
                    // Hourly Forecast
                    if (weather.hourlyForecast.isNotEmpty)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 16, bottom: 8),
                            child: Text(
                              'HOURLY FORECAST',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          HourlyForecastWidget(
                            hourlyForecast: weather.hourlyForecast,
                          ),
                        ],
                      ).animate().fadeIn(duration: 400.ms, delay: 400.ms),
                    
                    const SizedBox(height: 32),
                    
                    // Weather Details
                    WeatherDetailsCard(
                      weather: weather,
                    ).animate().fadeIn(duration: 400.ms, delay: 600.ms),
                  ],
                ),
              ),
            ],
          );
        },
        loading: () => const Center(
          child: CircularProgressIndicator(
            color: Colors.white,
          ),
        ),
        error: (error, stack) => Center(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              'Error loading weather for $cityName: $error',
              style: const TextStyle(color: Colors.red),
            ),
          ),
        ),
      ),
    );
  }
}