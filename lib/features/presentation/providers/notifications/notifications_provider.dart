import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/services/models/notify/notificationmodel.dart';
import 'notifications_notifier.dart';
import 'notifications_state.dart';

  final notificationsProvider = StateNotifierProvider<NotificationsNotifier, NotificationsState>(
    (ref) {
      try {
        return NotificationsNotifier();
      } catch (e) {
        throw Exception("Error initializing NotificationsProvider: $e");
      }
    }
  );
  final notificationsStateProvider = StateProvider<NotificationsState>((ref) {
    return NotificationsState();
  });
  final notificationsListProvider = StateProvider<List<NotificationModel>>((ref) {
    return [];
  });
  final notificationEnabledProvider = StateProvider<bool>((ref) {
    return true;
  });
  final notificationSoundEnabledProvider = StateProvider<bool>((ref) {
    return true;
  });
  final notificationVibrationEnabledProvider = StateProvider<bool>((ref) {
    return true;
  });
  final notificationTimeProvider = StateProvider<DateTime>((ref) {
    return DateTime.now();
  });
  final notificationFrequencyProvider = StateProvider<int>((ref) {
    return 1;
  });
  final notificationTimeStringProvider = StateProvider<String>((ref) {
    return DateTime.now().toString();
  });
  final notificationFrequencyStringProvider = StateProvider<String>((ref) {
    return "1";
  });
  
  