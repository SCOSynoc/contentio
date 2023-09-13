import 'package:contientiao/desktop_screen.dart';
import 'package:contientiao/responsive/responsive_layout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../utils/colors.dart';
import '../utils/helper_functions.dart';
import '../widgets/common_generate_button.dart';
import '../widgets/content_card.dart';
import '../widgets/parapharaser_text_box.dart';

class Paraphrase extends StatelessWidget {
  Paraphrase({Key? key, required this.paraphraseMap}) : super(key: key);
  final Map<String, dynamic> paraphraseMap;
  static const String routeName = "/paraphrase";



  TextEditingController paraphraseText = TextEditingController();
  @override
  Widget build(BuildContext context) {
    print("here data is with arguments $paraphraseMap");
    return WillPopScope(
      onWillPop:  () async{
         if(Helper.loadShimmerContentNotifier.value == true){
           return false;
         }
         return false;
      },
      child: Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          backgroundColor: borderColor,
          leading: InkWell(
             onTap: () {
               if(Helper.loadShimmerContentNotifier.value == true){

               }else{
                 Navigator.pop(context);
                 Helper.generateContentNotifier.value = {};
               }

             },
              child: Icon(CupertinoIcons.arrow_left, color: Colors.white,)),
        ),
        body: ResponsiveWidget(
          mobileScaffold: MobileTabParaphraseBody(paraphraseText: paraphraseText, paraphraseMap: paraphraseMap),
          tabletScaffold: MobileTabParaphraseBody(paraphraseText: paraphraseText, paraphraseMap: paraphraseMap),
          desktopScaffold: ParaphraseBody(paraphraseText: paraphraseText, paraphraseMap: paraphraseMap),
        )
        ,
      ),
    );
  }
}

class ParaphraseBody extends StatelessWidget {
  const ParaphraseBody({
    super.key,
    required this.paraphraseText,
    required this.paraphraseMap,
  });

  final TextEditingController paraphraseText;
  final Map<String, dynamic> paraphraseMap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
        Expanded(
          child: AspectRatio(
            aspectRatio: 3,
            child: ValueListenableBuilder(valueListenable: Helper.paraphraseNotifier, builder:(BuildContext context, value, Widget? child) {
              return Visibility(
                  visible: Helper.paraphraseNotifier.value,
                  child: Row(
                    children: [
                      Expanded(
                        flex:1,
                        child: Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Container(
                            decoration:BoxDecoration(
                                color: borderColor,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(width: 2.0, color: gradient1)
                            ),
                            height: MediaQuery.of(context).size.height*0.50,
                            width: MediaQuery.of(context).size.width*0.45,
                            child: Column(
                              children: [
                                ParaphraseField(textEditingController: paraphraseText),
                                GenerateButton( promptController: paraphraseText, selectedDataMap: paraphraseMap,)
                              ],
                            ),
                          ),
                        ),
                      ),
                      ValueListenableBuilder(
                        valueListenable: Helper.loadShimmerContentNotifier,
                        builder: (BuildContext context, load, Widget? child) {
                          return Expanded(
                            flex:1,
                            child: load ? const SpinKitWaveSpinner(color: gradient1, waveColor: gradient2, size: 200,): SizedBox(
                              height: MediaQuery.of(context).size.height*0.55,
                              width: MediaQuery.of(context).size.width*0.45,
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: ValueListenableBuilder(
                                  valueListenable: Helper.generateContentNotifier,
                                  builder: (BuildContext context, value, Widget? child) {
                                    return Visibility(
                                      visible: value["data"] == null? false : true,
                                      child: Padding(
                                        padding: const EdgeInsets.all(18.0),
                                        child: ContentCard(value: value,),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          );
                        }
                      ),
                    ],
                  ));
            } ),
          ),
        ),
      ],),
    );
  }
}

class MobileTabParaphraseBody extends StatelessWidget {
  const MobileTabParaphraseBody({
    super.key,
    required this.paraphraseText,
    required this.paraphraseMap,
  });

  final TextEditingController paraphraseText;
  final Map<String, dynamic> paraphraseMap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          Expanded(
            child: AspectRatio(
              aspectRatio: 3,
              child: ValueListenableBuilder(valueListenable: Helper.paraphraseNotifier, builder:(BuildContext context, value, Widget? child) {
                return Visibility(
                    visible: Helper.paraphraseNotifier.value,
                    child: Column(
                      children: [
                        Expanded(
                          flex:1,
                          child: Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: Container(
                              decoration:BoxDecoration(
                                  color: borderColor,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(width: 2.0, color: gradient1)
                              ),
                              height: MediaQuery.of(context).size.height*0.50,
                              child: Column(
                                children: [
                                  Expanded(child: ParaphraseField(textEditingController: paraphraseText)),
                                ],
                              ),
                            ),
                          ),
                        ),
                        ValueListenableBuilder(
                            valueListenable: Helper.loadShimmerContentNotifier,
                            builder: (BuildContext context, load, Widget? child) {
                              return Expanded(
                                flex:1,
                                child: load ? const SpinKitWaveSpinner(color: gradient1, waveColor: gradient2, size: 200,): SizedBox(
                                  height: MediaQuery.of(context).size.height*0.50,
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: ValueListenableBuilder(
                                      valueListenable: Helper.generateContentNotifier,
                                      builder: (BuildContext context, value, Widget? child) {
                                        return Visibility(
                                          visible: value["data"] == null? false : true,
                                          child: Padding(
                                            padding: const EdgeInsets.all(18.0),
                                            child: ContentCard(value: value,),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              );
                            }
                        ),
                        Center(child: GenerateButton(promptController: paraphraseText, selectedDataMap: paraphraseMap,)),
                        SizedBox(height: 15,)
                      ],
                    ));
              } ),
            ),
          ),
        ],),
    );
  }
}


