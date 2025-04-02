import 'package:flutter_riverpod/flutter_riverpod.dart';

  final temperatureUnitProvider = StateProvider<TemperatureUnit>((ref) {
  return TemperatureUnit.celsius;
});

enum TemperatureUnit { celsius, fahrenheit }
  