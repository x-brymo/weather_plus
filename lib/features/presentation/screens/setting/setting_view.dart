// lib/screens/settings_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/settings/settings_provider.dart';
import '../../providers/weather/weather_provider.dart';


// Provider for temperature unit


class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final temperatureUnit = ref.watch(temperatureUnitProvider);
    final savedCities = ref.watch(savedCitiesProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Temperature Unit'),
            subtitle: Text(temperatureUnit == TemperatureUnit.celsius ? 'Celsius (°C)' : 'Fahrenheit (°F)'),
            trailing: Switch(
              value: temperatureUnit == TemperatureUnit.celsius,
              onChanged: (value) {
                ref.read(temperatureUnitProvider.notifier).state = 
                  value ? TemperatureUnit.celsius : TemperatureUnit.fahrenheit;
              },
            ),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              'Saved Locations (${savedCities.length})',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          ...savedCities.map((city) => ListTile(
            title: Text(city),
            trailing: IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: () {
                ref.read(savedCitiesProvider.notifier).state = 
                  savedCities.where((c) => c != city).toList();
              },
            ),
          )),
          if (savedCities.isEmpty)
            const Padding(
              padding: EdgeInsets.all(16),
              child: Center(
                child: Text('No saved locations'),
              ),
            ),
          const Divider(),
          ListTile(
            title: const Text('About'),
            leading: const Icon(Icons.info_outline),
            onTap: () {
              showAboutDialog(
                context: context,
                applicationName: 'Weather App',
                applicationVersion: '1.0.0',
                applicationIcon: const Icon(Icons.wb_sunny),
                children: [
                  const Text(
                    'A beautiful weather application developed with Flutter featuring animations, API integration, and Riverpod state management.',
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}