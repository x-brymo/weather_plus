import 'package:equatable/equatable.dart';
import '../../../data/services/models/notify/notificationmodel.dart';

class NotificationsState extends Equatable {
  final List<NotificationModel>? notifications;
  final bool isNotificationEnabled;
  final bool isNotificationSoundEnabled;
  final bool isNotificationVibrationEnabled;
  final DateTime? notificationTime;
  final int notificationFrequency;

  const NotificationsState({
    this.notifications,
    this.isNotificationEnabled = true,
    this.isNotificationSoundEnabled = true,
    this.isNotificationVibrationEnabled = true,
    this.notificationTime,
    this.notificationFrequency = 1,
  });

  
  NotificationsState copyWith({
    List<NotificationModel>? notifications,
    bool? isNotificationEnabled,
    bool? isNotificationSoundEnabled,
    bool? isNotificationVibrationEnabled,
    DateTime? notificationTime,
    int? notificationFrequency,
  }) {
    return NotificationsState(
      notifications: notifications ?? this.notifications,
      isNotificationEnabled: isNotificationEnabled ?? this.isNotificationEnabled,
      isNotificationSoundEnabled: isNotificationSoundEnabled ?? this.isNotificationSoundEnabled,
      isNotificationVibrationEnabled: isNotificationVibrationEnabled ?? this.isNotificationVibrationEnabled,
      notificationTime: notificationTime ?? this.notificationTime,
      notificationFrequency: notificationFrequency ?? this.notificationFrequency,
    );
  }

  
  @override
  List<Object?> get props => [
        notifications,
        isNotificationEnabled,
        isNotificationSoundEnabled,
        isNotificationVibrationEnabled,
        notificationTime,
        notificationFrequency,
      ];
}
