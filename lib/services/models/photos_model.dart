import 'package:json_annotation/json_annotation.dart';

import 'photo_model.dart';

part 'photos_model.g.dart';

@JsonSerializable()
class PhotosModel {
  int page;
  int pages;
  int perpage;
  int total;
  List<PhotoModel> photo;

  PhotosModel({
    required this.page,
    required this.pages,
    required this.perpage,
    required this.total,
    required this.photo,
  });

  factory PhotosModel.fromJson(Map<String, dynamic> json) =>
      _$PhotosModelFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$PhotosModelToJson(this);
}
