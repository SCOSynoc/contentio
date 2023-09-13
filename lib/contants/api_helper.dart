import 'package:contientiao/models/ai_response_model.dart';

import '../service/services.dart';
import '../utils/helper_functions.dart';

class ApiHelper {

 static Future<String> callContentApiToGetText( {required String contentType, required String prompt}) async{
      DioClient dio = DioClient();
      switch(contentType) {
        case 'blog-topic' :
          dynamic data =  await dio.getCurrentResponse(prompt);
          String content = data.choices[0]["message"]["content"];
          return content;
        case 'blog-detail' :
          dynamic data =  await dio.getBlogDetailResponse(prompt);
          String content = data.choices[0]["message"]["content"];
          return content;
        case 'blog-detail-brief' :
          dynamic data =  await dio.getCurrentResponse(prompt);
          String content = data.choices[0]["message"]["content"];
          return content;
        case 'instagram-post' :
          dynamic data =  await dio.getInstagramPostResponse(prompt);
          String content = data.choices[0]["message"]["content"];
          return content;
        case 'keyword' :
          dynamic data =  await dio.getSearchableKeywordResponse(prompt);
          String content = data.choices[0]["message"]["content"];
          return content;
        case 'para-phrase' :
          dynamic data =  await dio.paraphraseResponse(prompt);
          String content = data.choices[0]["text"];
          return content;
        default : return "[{name: Generate Blog ideas, description: Generate Multiple blog ideas with creativity on a specific topic, hint: Enter a topic to generate blog idea, type: blog, content-type: blog-topic}, {name: Generate blog sections for ideas, description: \nExpand those blog ideas with detailed description , hint: Enter a idea to generate blog section, type: blog, content-type: blog-detail}, {name: Generate detailed blog sections, description: A brief description about the topic of blog, type: blog, hint: Enter a idea \n to generate detailed blog section, content-type: blog-detail-brief}";
      }
  }
}