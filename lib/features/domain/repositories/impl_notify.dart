// import 'package:weather_plus/features/data/data.dart';
// import 'package:weather_plus/features/data/services/models/notify/notificationmodel.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';

// class ImplNotify  implements RepositoryNotification{
//   @override
//   Future<void> addNotification({required String uid, required String title, required String body}) async {
//     // TODO: implement addNotification
//     try {
//       // Assuming you have a FirebaseMessaging instance and a method to send notifications
//       // final notification = {
//       // 'to': uid,
//       // 'notification': {
//       //   'title': title,
//       //   'body': body,
//       // },
//       // };

//       // Replace this with your actual Firebase messaging service call
//       await FirebaseMessaging.instance.sendMessage(
//       to: uid,
//       data: {
//         'to': uid,
//         'title': title,
//         'body': body,
//       },
//       );
//     } catch (e) {
//       // Handle the exception
//       print('Error sending notification: $e');
//     }
//     }

//   @override
//   Future<List<NotificationModel>> getNotifications() {
    
//   }

// }