import 'dart:convert';
import 'dart:developer';

import 'package:contientiao/contants/constants.dart';
import 'package:contientiao/models/ai_request_model.dart';
import 'package:contientiao/models/ai_response_model.dart';
import 'package:contientiao/utils/helper_functions.dart';
import 'package:dio/dio.dart';

class DioClient {
    final Dio _dio = Dio(BaseOptions(
      baseUrl: "https://api.openai.com/v1/",
      headers: {
        "Authorization": "Bearer $API_KEY",
        "Content-Type": "application/json"
      }
    )
    );

    Future<AIResponseModel>  getCurrentResponse(String prompt) async {
       /*print("${dataRequest.prompt}");*/
       try {
         Response response =  await _dio.post("chat/completions", data: {
           "model": "gpt-3.5-turbo",
           "messages": [
             {
               "role": "system",
               "content": "You will generate a blog topics with unique ideas and intrigue."
             },
             {
               "role": "user",
               "content": "Generate a 5 blog topic on : $prompt"
             }
           ],
           "temperature": 1,
           "max_tokens": 163,
           "top_p": 1,
           "frequency_penalty": 1,
           "presence_penalty": 1
         });
         print("here the blog topic response data is ${response.data}");
         return AIResponseModel.fromJson(response.data);
       } catch(e) {
         throw Exception("Ai response error$e");
       }

    }

    Future<AIResponseModel>  getBlogDetailResponse(String prompt) async {
      try {
        Response response =  await _dio.post("chat/completions", data: {
          "model": "gpt-3.5-turbo",
          "messages": [
            {
              "role": "system",
              "content": "Write an awesome unique and intriguing blog on the given topic"
            },
            {
              "role": "user",
              "content": "Write a blog  on : $prompt"
            },
          ],
          "temperature": 1,
          "max_tokens": 400,
          "top_p": 1,
          "frequency_penalty": 1,
          "presence_penalty": 1
        });
        print("here the blog detail response data is ${response.data}");
        return AIResponseModel.fromJson(response.data);
      }  catch(e) {
        Helper.loadShimmerContentNotifier.value = false;
        throw Exception("Ai response error$e");
      }
    }

    Future<AIResponseModel>  getSearchableKeywordResponse(String prompt) async {
      try {
        Response response =  await _dio.post("chat/completions", data: {
          "model": "gpt-3.5-turbo",
          "messages": [
            {
              "role": "system",
              "content": "Give a most searchable keywords for given niche"
            },
            {
              "role": "user",
              "content": "generate keywords for highly searchable Motivation niches"
            },
          ],
          "temperature": 1,
          "max_tokens": 69,
          "top_p": 1,
          "frequency_penalty": 0.9,
          "presence_penalty": 1.02
        }
        );
        print("here the searchable response data is ${response.data}");
        return AIResponseModel.fromJson(response.data);
      }  catch(e) {
        Helper.loadShimmerContentNotifier.value = false;
        throw Exception("Ai response error$e");
      }
    }

    Future<AIResponseModel>  getInstagramPostResponse(String prompt) async {
      try {
        Response response =  await _dio.post("chat/completions", data: {
        "model": "gpt-3.5-turbo",
            "messages": [
            {
            "role": "system",
            "content": "Generate highly intrigue, unique and engaging instagram post for given page theme"
            },
            {
              "role": "user",
              "content": "create an instagram post for motivation theme page"
            },
            ],
            "temperature": 1,
            "max_tokens": 725,
            "top_p": 1,
            "frequency_penalty": 0.9,
            "presence_penalty": 1.02
        }
        );
        print("here the response data is ${response.data}");
        return AIResponseModel.fromJson(response.data);
      }  catch(e) {
        Helper.loadShimmerContentNotifier.value = false;
        throw Exception("Ai response error$e");
      }
    }


    Future<AIResponseModel>  paraphraseResponse(String prompt) async {
      try {
        Response response =  await _dio.post("edits", data: {
          "model": "text-davinci-edit-001",
          "input": "$prompt ",
          "instruction": "Paraphrase text with uniqueness",
          "temperature": 1,
          "top_p": 1
        }
        );
        print("here the parapharase response data is ${response.data}");
        return AIResponseModel.fromJson(response.data);
      }  catch(e) {
        Helper.loadShimmerContentNotifier.value = false;
        throw Exception("Ai response error$e");
      }
    }



}