// lib/widgets/location_search_widget.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/weather/weather_provider.dart';

class LocationSearchWidget extends ConsumerStatefulWidget {
  final Function(String) onCitySelected;

  const LocationSearchWidget({
    super.key,
    required this.onCitySelected,
  });

  @override
  ConsumerState<LocationSearchWidget> createState() => _LocationSearchWidgetState();
}

class _LocationSearchWidgetState extends ConsumerState<LocationSearchWidget> {
  final _cityController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  
  // Popular cities for quick selection
  final List<String> _popularCities = [
    'London',
    'Paris',
    'New York',
    'Tokyo',
    'Sydney',
    'Dubai',
    'Singapore',
    'Rome',
  ];

  @override
  void dispose() {
    _cityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Search Location',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Form(
            key: _formKey,
            child: TextFormField(
              controller: _cityController,
              decoration: InputDecoration(
                hintText: 'Enter city name',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                filled: true,
                fillColor: Colors.grey.shade100,
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a city name';
                }
                return null;
              },
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  widget.onCitySelected(_cityController.text);
                  Navigator.pop(context);
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text('Search'),
            ),
          ),
          const SizedBox(height: 16),
          const Divider(),
          const SizedBox(height: 8),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Popular Cities',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: _popularCities.map((city) => _buildCityChip(city)).toList(),
          ),
          const SizedBox(height: 8),
          const Divider(),
          const SizedBox(height: 8),
          TextButton.icon(
            onPressed: () async {
              try {
                Navigator.pop(context);
                // Refresh current location weather
                ref.refresh(currentLocationProvider);
                ref.refresh(currentWeatherProvider);
              } catch (e) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Error getting location: $e')),
                );
              }
            },
            icon: const Icon(Icons.my_location),
            label: const Text('Use current location'),
          ),
        ],
      ),
    );
  }

  Widget _buildCityChip(String city) {
    return GestureDetector(
      onTap: () {
        widget.onCitySelected(city);
        Navigator.pop(context);
      },
      child: Chip(
        label: Text(city),
        backgroundColor: Colors.blue.shade100,
      ),
    );
  }
}