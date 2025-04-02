
import 'package:freezed_annotation/freezed_annotation.dart';

part 'notificationmodel.freezed.dart';
part 'notificationmodel.g.dart';

@freezed
abstract class NotificationModel with _$NotificationModel {
  factory NotificationModel(
   { required final String uid,
    required final String title,
    required final String body,
    }
    
  ) = _NotificationModel;
	
  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
			_$NotificationModelFromJson(json);
}
