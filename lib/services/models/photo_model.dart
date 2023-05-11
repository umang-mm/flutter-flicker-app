import 'package:json_annotation/json_annotation.dart';

part 'photo_model.g.dart';

@JsonSerializable()
class PhotoModel {
  int farm;
  String id;
  int isfriend;
  int isfamily;
  int ispublic;
  String owner;
  String secret;
  String server;
  String title;

  PhotoModel({
    required this.farm,
    required this.id,
    required this.isfriend,
    required this.isfamily,
    required this.ispublic,
    required this.owner,
    required this.secret,
    required this.server,
    required this.title,
  });

  factory PhotoModel.fromJson(Map<String, dynamic> json) =>
      _$PhotoModelFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$PhotoModelToJson(this);
}
