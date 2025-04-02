import '../services/models/notify/notificationmodel.dart';

abstract class RepositoryNotification {
  Future<void> addNotification({
    required String uid,
    required String title,
    required String body,
  });

  Future<List<NotificationModel>> getNotifications();
}