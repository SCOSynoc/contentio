import 'package:json_annotation/json_annotation.dart';
part 'ai_response_model.g.dart';


@JsonSerializable()
class AIResponseModel {


  final String? id;
  final String object;
  final int created;
  final String? model;
  final List<dynamic> choices;

  AIResponseModel({
    required this.choices,
    required this.created,
    required this.id,
    required this.model,
    required this.object
  });

  factory AIResponseModel.fromJson(Map<String, dynamic> json) => _$AIResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$AIResponseModelToJson(this);

}