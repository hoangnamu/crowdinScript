import 'package:json_annotation/json_annotation.dart';

part 'client.g.dart';

@JsonSerializable(explicitToJson: true)
class Client {
  String name;
  int projectId;
  int fileId;

  Client({
    required this.name,
    required this.projectId,
    required this.fileId,
  }) : super();

  factory Client.fromJson(Map<String, dynamic> json) => _$ClientFromJson(json);

  Map<String, dynamic> toJson() => _$ClientToJson(this);
}
