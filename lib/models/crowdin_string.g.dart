// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crowdin_string.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CrowdinString _$CrowdinStringFromJson(Map<String, dynamic> json) =>
    CrowdinString(
      json['text'] as String,
      json['identifier'] as String,
      json['fileId'] as int?,
      json['context'] as String,
      json['isHidden'] as bool,
      json['maxLength'] as int,
    );

Map<String, dynamic> _$CrowdinStringToJson(CrowdinString instance) =>
    <String, dynamic>{
      'text': instance.text,
      'identifier': instance.identifier,
      'fileId': instance.fileId,
      'context': instance.context,
      'isHidden': instance.isHidden,
      'maxLength': instance.maxLength,
    };
