import 'package:json_annotation/json_annotation.dart';

part 'crowdin_string.g.dart';

@JsonSerializable(explicitToJson: true)
class CrowdinString {
  CrowdinString(
    this.text,
    this.identifier,
    this.fileId,
    this.context,
    this.isHidden,
    this.maxLength,
  ) : super();

  String text;
  String identifier;
  int? fileId;
  String context;
  bool isHidden;
  int maxLength;

  factory CrowdinString.fromJson(Map<String, dynamic> json) =>
      _$CrowdinStringFromJson(json);

  Map<String, dynamic> toJson() => _$CrowdinStringToJson(this);
}
