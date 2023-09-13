// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AIResponseModel _$AIResponseModelFromJson(Map<String, dynamic> json) =>
    AIResponseModel(
      choices: json['choices'] as List<dynamic>,
      created: json['created'] as int,
      id: json['id'] as String?,
      model: json['model'] as String?,
      object: json['object'] as String,
    );

Map<String, dynamic> _$AIResponseModelToJson(AIResponseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'object': instance.object,
      'created': instance.created,
      'model': instance.model,
      'choices': instance.choices,
    };
