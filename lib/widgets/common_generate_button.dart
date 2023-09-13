import 'dart:developer';

import 'package:contientiao/contants/api_helper.dart';
import 'package:contientiao/contants/constants.dart';
import 'package:contientiao/models/ai_request_model.dart';
import 'package:contientiao/models/ai_response_model.dart';
import 'package:contientiao/service/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/helper_functions.dart';

class GenerateButton extends StatefulWidget {
  const GenerateButton({Key? key,   required this.promptController, required this.selectedDataMap}) : super(key: key);
  final TextEditingController promptController;
  final Map<String, dynamic> selectedDataMap;

  @override
  State<GenerateButton> createState() => _GenerateButtonState();
}

class _GenerateButtonState extends State<GenerateButton> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  bool _isHovering = false;
  bool _isLoading = false;


  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(value: 0,vsync: this, duration: Duration(milliseconds: 200));
  }

  void _handleHover(bool isHovered) {
    setState(() {
      _isHovering = isHovered;
      if (_isHovering) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double boxWidth = /*MediaQuery.of(context).size.width > 1300 ?
    MediaQuery.of(context).size.width *  0.15 : MediaQuery.of(context).size.width *  0.28*/ Helper.commonButtonResponsiveWidth(MediaQuery.of(context).size.width, context) ;
    return MouseRegion(
      onEnter:(_) => _handleHover(true),
      onExit: (_) => _handleHover(false),
      child:LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
        final Size biggest = constraints.biggest;
        final Size smallest = constraints.smallest;
        return InkWell(
          splashColor: Colors.transparent,
          borderRadius: BorderRadius.circular(20),
          onTap:_isLoading ? null : ()  async {
              if(widget.promptController.text.isEmpty){
                  showDialog(context: context, builder: (context) {
                    return showInfoPopUpDialog(context: context, textTitle: "Alert", msgText: "Prompt is empty", pressed: (){
                      Navigator.pop(context);
                    });
                  });
              }else{
                Helper.generateContentNotifier.value = {};
                setState(() {
                  _isLoading = true;
                  Helper.loadShimmerContentNotifier.value = true;
                });
                print("${widget.selectedDataMap}");
                String content = await ApiHelper.callContentApiToGetText(contentType: "${widget.selectedDataMap["content-type"]}", prompt: widget.promptController.text);
                log("here prompt value is and ${widget.promptController.text}");
                if(content.isNotEmpty){
                  setState(() {
                    _isLoading = false;
                    Helper.loadShimmerContentNotifier.value = false;
                  });
                  Helper.generateContentNotifier.value = {"data": content};
                }
              }
              widget.promptController.clear();


          },
          child: AnimatedContainer(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: gradient2,
            ),
            duration: const Duration(milliseconds: 200),
            width: boxWidth,
            height: 40,
            child: Stack(
              children: [
              PositionedTransition(
                rect: RelativeRectTween(
                  begin: RelativeRect.fromDirectional(textDirection: TextDirection.ltr, start: - boxWidth + 40, top: 0, end: smallest.width, bottom: 0),
                  end: RelativeRect.fromDirectional(textDirection: TextDirection.ltr, start: boxWidth - 40, top: 0, end: boxWidth-40, bottom: 0),
                ).animate(
                    CurvedAnimation(
                      parent: _animationController,
                      curve: Curves.elasticOut,
                )),
                child:  const Padding(
                  padding: EdgeInsets.all(8),
                  child: Icon(CupertinoIcons.arrow_right_circle, size: 25, color: Colors.black,),
                ),
              ),
                /*PositionedDirectional(start: boxWidth / 50, end: -(boxWidth/ 50),child: Text("Generate",
                  style: getTextStyle(color: Colors.black87, fontSize: 16, wgt: FontWeight.w600),),)*/
                PositionedTransition(
                  rect: RelativeRectTween(
                    begin: RelativeRect.fromDirectional(textDirection: TextDirection.rtl, start: 0, top: 0, end: -smallest.width, bottom: 0),
                    end: RelativeRect.fromDirectional(textDirection: TextDirection.rtl, start:  -1, top: 0, end: -20, bottom: 0),
                  ).animate(
                      CurvedAnimation(
                    parent: _animationController,
                    curve: Curves.decelerate,
                  )),
                  child:  Center(
                      child: Text("Generate content", style: getTextStyle(color: Colors.black87, fontSize: 18, wgt: FontWeight.w600),)
                  ),
                ),

            ],),
          ),
        );
      },)
    );
  }

}
