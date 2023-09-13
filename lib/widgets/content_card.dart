import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../contants/constants.dart';
import '../utils/colors.dart';

class ContentCard extends StatefulWidget {
  const ContentCard({Key? key, this.value}) : super(key: key);
  final dynamic value;

  @override
  State<ContentCard> createState() => _ContentCardState();
}

class _ContentCardState extends State<ContentCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12), side: const BorderSide(color: gradient2)),
      color: backgroundColor,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top:8.0, right: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: (){
                    Clipboard.setData(ClipboardData(text: widget.value["data"]))
                        .then((_) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              backgroundColor: borderColor,
                              content: Text('Copied to your clipboard !', style: getTextStyle(color: Colors.white, fontSize: 16, wgt: FontWeight.w200),)));
                    });
                  },
                  child: Container(
                    child: Row(children: [
                      Text("Copy", style: getTextStyle(color: gradient3, fontSize: 18, wgt: FontWeight.w400),),
                      const SizedBox(width: 5,),
                      const Icon(CupertinoIcons.arrow_down_doc, color: gradient3,)
                  ],),),
                ),

              ],),
          ),
          Flexible(
            fit: FlexFit.loose,
            child: Padding(
              padding: const EdgeInsets.all(28.0),
              child: SingleChildScrollView(
                child: SelectionArea(
                  child: Text("${widget.value['data']}",
                    style: getTextStyle(color: gradient3, fontSize: 16, wgt:FontWeight.w600),),
                ),
              ),
            ),
          ),
        ],
      ),);
  }
}
