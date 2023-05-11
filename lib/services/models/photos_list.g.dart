// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photos_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PhotosListModel _$PhotosListModelFromJson(Map<String, dynamic> json) =>
    PhotosListModel(
      photos: PhotosModel.fromJson(json['photos'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PhotosListModelToJson(PhotosListModel instance) =>
    <String, dynamic>{
      'photos': instance.photos,
    };
