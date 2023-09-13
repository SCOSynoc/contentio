import 'package:json_annotation/json_annotation.dart';
part 'ai_request_model.g.dart';

@JsonSerializable()
class AIRequestModel {

  final String model;
  final String prompt;
  final int maxTokens;
  final int temperature;
  final int topP;
  final int n;
  final bool stream;
  final int logprobs;

  AIRequestModel({required this.model,required this.logprobs,
    required this.maxTokens,required this.n,required this.prompt,
    required this.stream, required this.temperature,required this.topP});

  factory AIRequestModel.fromJson(Map<String, dynamic> json) => _$AIRequestModelFromJson(json);
  Map<String, dynamic> toJson() => _$AIRequestModelToJson(this);

}


class AIModel {

  final String model;
  final String prompt;
  final int maxTokens;
  final int temperature;
  final int topP;
  final int n;
  final bool stream;
  final int logprobs;


  AIModel({required this.model, required this.prompt,
    required this.maxTokens, required this.temperature,
    required this.topP, required this.n, required this.stream, required this.logprobs});

}