import 'package:contientiao/contants/constants.dart';
import 'package:flutter/material.dart';

class Helper {
  static List<Map<String, dynamic>>  getContentSpecificList(String name){
      List<Map<String, dynamic>> data = [];
      print("here name is $name");
      switch(name) {
        case "Blog" :
          data = blogContentList;
        break;
        case "Social" :
          data = socialContentList;
          break;
        case "scripts":
          data = videoContentList;
          break;
        default :  data = [];
      }
      print("here data is $data");
      return data;
  }

  static ValueNotifier paraphraseNotifier = ValueNotifier(false);
  static ValueNotifier generateContentNotifier = ValueNotifier({});
  static ValueNotifier dataToShow = ValueNotifier({});
  static ValueNotifier tabDataToShow = ValueNotifier({});
  static ValueNotifier mobDataToShow = ValueNotifier({});
  static ValueNotifier loadShimmerContentNotifier = ValueNotifier(false);

   static double giveAspectRatioAsScreenSizes(double width){
       if(width < 700){
          return 1;
       }else if( width < 1300){
         return 1;
       } else {
         return 3;
       }
   }

  static int giveFlexToTextField(double width){
    if(width < 700){
      return 4;
    }else if( width < 1300){
      return 1;
    } else {
      return 3;
    }
  }

  static double commonButtonResponsiveWidth(double width, BuildContext context){
    if(width < 700){
      return MediaQuery.of(context).size.width *  0.50;
    }else if( width < 1300){
      return MediaQuery.of(context).size.width *  0.28;
    } else {
      return MediaQuery.of(context).size.width *  0.15;
    }
  }


}