// lib/screens/home_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:weather_plus/features/data/services/models/weather/weather_model.dart';
import '../../providers/weather/weather_provider.dart';
import '../../widgets/current_weather_widget.dart';
import '../../widgets/hourly_forecast_widget.dart';
import '../../widgets/weather_card.dart';
import '../setting/setting_view.dart';


class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final _cityController = TextEditingController();

  @override
  void dispose() {
    _cityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currentWeatherAsync = ref.watch(currentWeatherProvider);
    
    return Scaffold(
      body: currentWeatherAsync.when(
        data: (weather) {
          final condition = ref.watch(weatherConditionProvider(weather.weatherCondition));
          
          return Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  condition.backgroundColor,
                  condition.backgroundColor.withOpacity(0.8),
                  Colors.black.withOpacity(0.6),
                ],
              ),
            ),
            child: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // App Bar with location and search
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${weather.cityName}, ${weather.countryName}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.search, color: Colors.white),
                            onPressed: () {
                              showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                builder: (context) => _buildSearchSheet(context),
                              );
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.notifications, color: Colors.white),
                            onPressed: () {
                              showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                builder: (context) => FutureBuilder<Widget>(
                                  future: _buildNotifications(),
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState == ConnectionState.waiting) {
                                      return const Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    } else if (snapshot.hasError) {
                                      return Center(
                                        child: Text(
                                          'Error: ${snapshot.error}',
                                          style: const TextStyle(color: Colors.red),
                                        ),
                                      );
                                    } else {
                                      return snapshot.data!;
                                    }
                                  },
                                ),
                              );
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.settings, color: Colors.white),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const SettingsScreen(),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    
                    // Current Weather Display
                    Expanded(
                      child: CurrentWeatherWidget(
                        weather: weather,
                        condition: condition,
                      ).animate().fadeIn(duration: 600.ms).slideY(
                        begin: 0.2,
                        end: 0,
                        curve: Curves.easeOutQuad,
                        duration: 500.ms,
                      ),
                    ),
                    
                    // Hourly Forecast
                    Container(
                      height: 120,
                      margin: const EdgeInsets.symmetric(vertical: 16),
                      child: HourlyForecastWidget(
                        hourlyForecast: weather.hourlyForecast,
                      ).animate().fadeIn(
                        delay: 200.ms,
                        duration: 400.ms,
                      ),
                    ),
                    
                    // Saved Cities Cards
                    SizedBox(
                      height: 200,
                      child: _buildSavedCitiesCards(),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        loading: () => const Center(
          child: CircularProgressIndicator(
            color: Colors.white,
          ),
        ),
        error: (error, stack) => Center(
          child: Text(
            'Error loading weather: $error',
            style: const TextStyle(color: Colors.red),
          ),
        ),
      ),
    );
  }

  Widget _buildSearchSheet(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.9,
      minChildSize: 0.5,
      maxChildSize: 0.9,
      builder: (context, scrollController) {
        return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Container(
                width: 40,
                height: 5,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _cityController,
                decoration: InputDecoration(
                  hintText: 'Search city',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  if (_cityController.text.isNotEmpty) {
                    Navigator.pop(context);
                    final cities = ref.read(savedCitiesProvider);
                    if (!cities.contains(_cityController.text)) {
                      ref.read(savedCitiesProvider.notifier).state = [
                        ...cities,
                        _cityController.text
                      ];
                    }
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text('Add City'),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildSavedCitiesCards() {
    final savedCities = ref.watch(savedCitiesProvider);
    
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      scrollDirection: Axis.horizontal,
      itemCount: savedCities.length,
      itemBuilder: (context, index) {
        final cityWeatherAsync = ref.watch(cityWeatherProvider(savedCities[index]));
        
        return Container(
          width: 160,
          margin: const EdgeInsets.only(right: 16),
          child: cityWeatherAsync.when(
            data: (weather) {
              final condition = ref.watch(weatherConditionProvider(weather.weatherCondition));
              return WeatherCard(
                weather: weather,
                condition: condition,
              ).animate().fadeIn(
                delay: Duration(milliseconds: 100 * index),
                duration: 400.ms,
              ).slideX(
                begin: 0.2,
                end: 0,
                curve: Curves.easeOutQuad,
                duration: 500.ms,
                delay: Duration(milliseconds: 100 * index),
              );
            },
            loading: () => const Card(
              child: Center(child: CircularProgressIndicator()),
            ),
            error: (error, stack) => Card(
              color: Colors.red.shade100,
              child: Center(
                child: Text(
                  'Error: ${error.toString().substring(0, 20)}...',
                  style: const TextStyle(color: Colors.red),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Future<Widget> _buildNotifications()async{
   // final notifications = await ref.read(notificationsProvider).getNotifications();
   final Map<String,dynamic> notifications  =
   {
     "title": "First Notification New Patch v1.0.2", 
     "body": "This is a notification",
     "date": DateTime.now(),
   };
    return SizedBox(
      height: 200,
      width: 200,
      child: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(notifications[index].title),
            subtitle: Text(notifications[index].body),
            trailing: Text(notifications[index].date.toString()),
            leading: Icon(Icons.notifications, color: Colors.blue),
          );
        },
      ),
    );
  }

}
