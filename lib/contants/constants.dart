import 'dart:ui';

import 'package:contientiao/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/painting/text_style.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_fonts/google_fonts.dart';

List<Map<String, dynamic>> blogContentList = [
  {
    "name": "Generate Blog ideas",
    "description": "Generate Multiple blog ideas with creativity on a specific topic",
    "hint": "Enter a topic to generate blog idea",
    "type": "blog",
    "content-type": "blog-topic"
  },
  {
    "name": "Generate blog sections for ideas",
    "description": "Expand those blog ideas with detailed description ",
    "hint": "Enter a idea to generate blog section",
    "type": "blog",
    "content-type": "blog-detail"
  },

];

List<Map<String, dynamic>> socialContentList = [
  {
    "name": "Write Instagram post from them page",
    "description": "Creates an amazing post according to your theme page topics",
    "type": "social",
     "hint": "Enter a theme page niche",
     "content-type": "instagram-post"
  },
  {
    "name": "Generate highly searchable keywords",
    "description": "This will generate most searched keyword for your entered niche",
    "type": "social",
    "hint": "Enter a topic for niche",
    "content-type": "keyword"
  },
];

Map<String, dynamic> paraphraseMap = {
    "content-type": "para-phrase"
};

List<Map<String, dynamic>> videoContentList = [
  {
    "name": "Generate scripts for 10 minute video",
    "description": "Creates a detail script for any niche for 10 min ",
    "type": "scripts",
    "hint": "Enter a niche to generate a script"
  },
  {
    "name": "Generate scripts for 5 minute video",
    "description": "Creates a detail script for any niche for 5 min",
    "type": "scripts",
    "hint": "Enter a niche to generate a script"
  },

  {
    "name": "Generate scripts for shorts video",
    "description": "Creates a script for short video contents",
    "type": "scripts",
    "hint": "Enter a niche to generate a script"
  },
];

Widget showInfoPopUpDialog( {required BuildContext context, required String textTitle, required String msgText, required Function() pressed}) {
  return CupertinoAlertDialog(
      title: Text(textTitle,style:GoogleFonts.overpass(color: gradient3, fontSize: 20, fontWeight: FontWeight.w600)),
      content: Text(msgText,style:GoogleFonts.overpass(color: gradient2, fontSize: 14, fontWeight: FontWeight.w400)),
      actions:[
        CupertinoButton(
          onPressed: pressed,
          //return true when click on "Yes"
          child:Text('ok',style:GoogleFonts.overpass(color: gradient2, fontSize: 18, fontWeight: FontWeight.w500)),
        ),
      ],
    );

}



TextStyle getTextStyle({required Color color, required double fontSize, required FontWeight wgt }) {
  return GoogleFonts.quicksand(
      color: color, fontSize: fontSize, fontWeight: wgt,
      );
}

String API_KEY = /*"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"*/ /*"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"*/ dotenv.get("OPENAI_API_KEY");
