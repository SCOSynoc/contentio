import 'package:contientiao/contants/constants.dart';
import 'package:contientiao/widgets/common_generate_button.dart';
import 'package:contientiao/widgets/mobile_generate_button.dart';
import 'package:flutter/cupertino.dart';

import '../utils/colors.dart';
import '../utils/helper_functions.dart';



class CommonTextField extends StatefulWidget {
  const CommonTextField({Key? key, required this.headText, required this.hintText, required this.controller}) : super(key: key);
  final String headText;
  final String hintText;
  final TextEditingController controller;

  @override
  State<CommonTextField> createState() => _CommonTextFieldState();
}

class _CommonTextFieldState extends State<CommonTextField> {



  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("here the helper data is ${Helper.dataToShow.value}");
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         /* Flexible(
              fit: FlexFit.loose,
              child: Text(widget.headText, style: getTextStyle(color: gradient3, fontSize: 18, wgt: FontWeight.w800),)),
          const Flexible(
            child: SizedBox(height: 10,),
          ),*/
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Flexible(
                flex: Helper.giveFlexToTextField(MediaQuery.of(context).size.width),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width < 700 ? MediaQuery.of(context).size.width : double.infinity ,
                  child: CupertinoTextField(
                    controller: widget.controller,
                    placeholder: widget.hintText,
                    placeholderStyle: getTextStyle(color: gradient3, fontSize: 16, wgt: FontWeight.w600),// The hintText
                    style:getTextStyle(color: gradient3, fontSize: 16, wgt: FontWeight.w600) ,
                    decoration: BoxDecoration(
                      border: Border.all(color: gradient1),
                      borderRadius: BorderRadius.circular(10.0),
                      color: borderColor,
                    ),
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                  ),
                ),
              ),
              const SizedBox(width: 50 ),
              (MediaQuery.of(context).size.width < 700) ?
               Flexible(fit: FlexFit.loose,child: MobileGenerateButton(promptController: widget.controller, selectedDataMap: Helper.dataToShow.value, )):
              Flexible(fit: FlexFit.loose,child: GenerateButton(promptController: widget.controller, selectedDataMap: Helper.dataToShow.value, ))
            ],
          ),

        ],
      ),
    );
  }
}
