// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photo_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PhotoModel _$PhotoModelFromJson(Map<String, dynamic> json) => PhotoModel(
      farm: json['farm'] as int,
      id: json['id'] as String,
      isfriend: json['isfriend'] as int,
      isfamily: json['isfamily'] as int,
      ispublic: json['ispublic'] as int,
      owner: json['owner'] as String,
      secret: json['secret'] as String,
      server: json['server'] as String,
      title: json['title'] as String,
    );

Map<String, dynamic> _$PhotoModelToJson(PhotoModel instance) =>
    <String, dynamic>{
      'farm': instance.farm,
      'id': instance.id,
      'isfriend': instance.isfriend,
      'isfamily': instance.isfamily,
      'ispublic': instance.ispublic,
      'owner': instance.owner,
      'secret': instance.secret,
      'server': instance.server,
      'title': instance.title,
    };
