import 'package:auto_size_text/auto_size_text.dart';
import 'package:contientiao/contants/constants.dart';
import 'package:contientiao/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../common/common_drawer.dart';
import '../desktop/paraphrase_screen.dart';
import '../utils/helper_functions.dart';
import '../widgets/common_text_box.dart';
import '../widgets/content_card.dart';




class MobileBody extends StatefulWidget {
  const MobileBody({Key? key}) : super(key: key);

  @override
  State<MobileBody> createState() => _MobileBodyState();
}

class _MobileBodyState extends State<MobileBody> {
  List<Map<String, dynamic>> data = [];
  String hintText = "";
  String head ="";
  bool textVisibile = false;
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.black12,
      ),
      drawer: CommonDrawer(
        blogCallback: (){
          setState(() {
            Helper.paraphraseNotifier.value = false;
            Helper.generateContentNotifier.value = {};
            data = Helper.getContentSpecificList("Blog");
            textVisibile = false;

          });
        },
        socialMediaCallback: (){
          setState(() {
            Helper.paraphraseNotifier.value = false;
            Helper.generateContentNotifier.value = {};
            data = Helper.getContentSpecificList("Social");
            textVisibile = false;
          });
        },
        paraCallback: () {
          data=[];
          Helper.paraphraseNotifier.value = true;
          Helper.generateContentNotifier.value = {};
          Navigator.pushNamed(context, Paraphrase.routeName, arguments: paraphraseMap);
          textVisibile = false;
        },
      ),

      body: Visibility(
        visible: data.isEmpty ? false : true,
        replacement: Center(child: Image.asset("asset/Contentio-logos_transparent.png", color: borderColor,),),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: AspectRatio(
                aspectRatio: 2,
                child: SizedBox(
                  width: double.infinity,
                  child: GridView.builder(
                    itemCount: data.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                    itemBuilder: (BuildContext context, int index) {
                      final containerData = data[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Align(
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                head = containerData["name"];
                                hintText = containerData["hint"];
                                Helper.dataToShow.value = containerData;
                                textVisibile = true;
                                Helper.generateContentNotifier.value = {};
                                controller.clear();
                              });

                            },
                            child: Container(
                              width: 200,
                              decoration:BoxDecoration(
                                  color: borderColor,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(width: 2.0, color: gradient1)

                              ),
                              child: AspectRatio(
                                aspectRatio: 1,
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Flexible(
                                        flex: 2,
                                        child: AutoSizeText("${containerData["name"]}",  style: getTextStyle(color: gradient2, fontSize: 14, wgt: FontWeight.bold), maxLines: 2,textScaleFactor: MediaQuery.textScaleFactorOf(context),),
                                      ),
                                      Flexible(
                                        flex: 4,
                                        child: AutoSizeText("${containerData["description"]}", style: getTextStyle(color: gradient3, fontSize: 14, wgt: FontWeight.w500), textScaleFactor: MediaQuery.textScaleFactorOf(context),),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },),
                ),
              ),
            ),
            ValueListenableBuilder(
              valueListenable: Helper.loadShimmerContentNotifier,
              builder: (BuildContext context, load, Widget? child) {
                return Expanded(
                  child:load ? const SpinKitWaveSpinner(color: gradient1, size: 100,):  SizedBox(
                    width: double.infinity,
                    height: double.infinity,
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
              },
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 100,
                  child: ValueListenableBuilder(
                    valueListenable: Helper.dataToShow,
                    builder: (BuildContext context, value, Widget? child) {
                      return Visibility(
                          visible: textVisibile,
                          child: CommonTextField(headText: head, hintText: hintText, controller: controller,)
                      );
                    },
                  ),
                ),
              ),
            ),
            // Expanded(
            //     child: ListView.builder(
            //         itemCount: 5,
            //         itemBuilder: (context, index) {
            //           return Padding(
            //             padding: const EdgeInsets.all(8.0),
            //             child: Container(color: Colors.blueGrey, height: 80,),
            //           );
            //         }))
          ],
        ),
      ),
    );
  }
}
