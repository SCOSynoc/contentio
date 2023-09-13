// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AIRequestModel _$AIRequestModelFromJson(Map<String, dynamic> json) =>
    AIRequestModel(
      model: json['model'] as String,
      logprobs: json['logprobs'] as int,
      maxTokens: json['maxTokens'] as int,
      n: json['n'] as int,
      prompt: json['prompt'] as String,
      stream: json['stream'] as bool,
      temperature: json['temperature'] as int,
      topP: json['topP'] as int,
    );

Map<String, dynamic> _$AIRequestModelToJson(AIRequestModel instance) =>
    <String, dynamic>{
      'model': instance.model,
      'prompt': instance.prompt,
      'maxTokens': instance.maxTokens,
      'temperature': instance.temperature,
      'topP': instance.topP,
      'n': instance.n,
      'stream': instance.stream,
      'logprobs': instance.logprobs,
    };
