import 'package:json_annotation/json_annotation.dart';

import 'photos_model.dart';

part 'photos_list.g.dart';

@JsonSerializable()
class PhotosListModel {
  PhotosModel photos;

  PhotosListModel({
    required this.photos,
  });

  factory PhotosListModel.fromJson(Map<String, dynamic> json) =>
      _$PhotosListModelFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$PhotosListModelToJson(this);
}
