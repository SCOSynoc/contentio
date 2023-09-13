/*
import 'package:contientiao/contants/constants.dart';
import 'package:contientiao/models/ai_request_model.dart';
import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/http.dart';
import '../models/ai_response_model.dart';
part "api_service.g.dart";

@RestApi(baseUrl: "https://api.openai.com/v1/")
abstract class ApiService {
     factory ApiService(Dio dio) = _ApiService;
     @POST("completions")
     @Headers({
          "Authorization": "Bearer $API_KEY",
          "Content-type": "application/json"
     })
     Future<AIResponseModel>  getGptResponse( @Body() AIRequestModel requestModel);
}*/
