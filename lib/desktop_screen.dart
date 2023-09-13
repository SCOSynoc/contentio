import 'package:contientiao/contants/constants.dart';
import 'package:contientiao/desktop/paraphrase_screen.dart';

import 'package:contientiao/utils/colors.dart';
import 'package:contientiao/utils/helper_functions.dart';
import 'package:contientiao/widgets/common_text_box.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'common/common_desktop_body.dart';
import 'common/common_drawer.dart';


class DesktopScreen extends StatefulWidget {
  const DesktopScreen ({Key? key, required this.from}) : super(key: key);
  static const String routeName = "/contentio-dashboard";
  final String from;
  @override
  State<DesktopScreen> createState() => _DesktopScreenState();
}

class _DesktopScreenState extends State<DesktopScreen> {
  List<Map<String, dynamic>> data = [];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body:  Row(
        children: [
        CommonDrawer(
          blogCallback: () {
           setState(() {
             data = Helper.getContentSpecificList("Blog");
             Helper.paraphraseNotifier.value = false;
             Helper.generateContentNotifier.value = {};
           });
        },
          socialMediaCallback: () {
            setState(() {
              data = Helper.getContentSpecificList("Social");
              Helper.paraphraseNotifier.value = false;
              Helper.generateContentNotifier.value = {};
            });
          },
          scriptsCallback: (){
            setState(() {
              data = Helper.getContentSpecificList("scripts");
              Helper.paraphraseNotifier.value = false;
              Helper.generateContentNotifier.value = {};
            });
          },

          paraCallback: (){
            setState(() {
              data=[];
              Helper.paraphraseNotifier.value = true;
              Helper.generateContentNotifier.value = {};
              Navigator.pushNamed(context, Paraphrase.routeName, arguments: paraphraseMap);
            });
          },

        ),
        Expanded( flex: 2 ,
            child: Visibility(
              visible: data.isEmpty ? false: true,
              replacement: Center(child: Image.asset("asset/Contentio-logos_transparent.png", color: borderColor,),),
              child: CommonDeskTopNBody(contentList: data,)
        )
        ),
        // Expanded(child: Container(color: Colors.deepOrangeAccent,))
      ],),
    );
  }
}


