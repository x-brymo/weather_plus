// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notificationmodel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_NotificationModel _$NotificationModelFromJson(Map<String, dynamic> json) =>
    _NotificationModel(
      uid: json['uid'] as String,
      title: json['title'] as String,
      body: json['body'] as String,
    );

Map<String, dynamic> _$NotificationModelToJson(_NotificationModel instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'title': instance.title,
      'body': instance.body,
    };
