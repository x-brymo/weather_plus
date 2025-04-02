import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'notifications_state.dart';

  class NotificationsNotifier extends StateNotifier<NotificationsState> {
      NotificationsNotifier() : super(NotificationsState());
      // Define methods and properties here
        // ✅ تفعيل/إيقاف الإشعارات
  void toggleNotifications(bool isEnabled) {
    state = state.copyWith(isNotificationEnabled: isEnabled);
  }

  // ✅ تحديث وقت الإشعار
  void updateNotificationTime(DateTime time) {
    state = state.copyWith(notificationTime: time);
  }

  // ✅ تغيير تكرار الإشعارات
  void updateNotificationFrequency(int frequency) {
    state = state.copyWith(notificationFrequency: frequency);
  }
  void getNotifications() {
   
  }
  }