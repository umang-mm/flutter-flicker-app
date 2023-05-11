// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photos_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PhotosModel _$PhotosModelFromJson(Map<String, dynamic> json) => PhotosModel(
      page: json['page'] as int,
      pages: json['pages'] as int,
      perpage: json['perpage'] as int,
      total: json['total'] as int,
      photo: (json['photo'] as List<dynamic>)
          .map((e) => PhotoModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PhotosModelToJson(PhotosModel instance) =>
    <String, dynamic>{
      'page': instance.page,
      'pages': instance.pages,
      'perpage': instance.perpage,
      'total': instance.total,
      'photo': instance.photo,
    };
