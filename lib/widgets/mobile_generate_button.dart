import 'dart:developer';

import 'package:contientiao/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../contants/api_helper.dart';
import '../contants/constants.dart';
import '../utils/helper_functions.dart';


class MobileGenerateButton extends StatefulWidget {
  const MobileGenerateButton({Key? key, required this.promptController, required this.selectedDataMap}) : super(key: key);
  final TextEditingController promptController;
  final Map<String, dynamic> selectedDataMap;

  @override
  State<MobileGenerateButton> createState() => _MobileGenerateButtonState();
}

class _MobileGenerateButtonState extends State<MobileGenerateButton> with TickerProviderStateMixin {
  bool _isLoading = false;

  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
    lowerBound: 0.7
  )..repeat(reverse: true);
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.bounceOut,
  );




  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: gradient2,
          shape: BoxShape.circle),
      child: IconButton(
          color: gradient2,
          onPressed: () async {
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
          },
          icon:  ScaleTransition(
              scale: _animation,
              child: const Icon(CupertinoIcons.chevron_right_square_fill, size: 30,color: borderColor,)
          )
      ),
    );
  }
}

