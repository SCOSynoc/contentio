import 'package:auto_size_text/auto_size_text.dart';
import 'package:contientiao/contants/constants.dart';
import 'package:contientiao/widgets/common_text_box.dart';
import 'package:contientiao/widgets/parapharaser_text_box.dart';
import 'package:contientiao/widgets/shimmer_loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../utils/colors.dart';
import '../utils/helper_functions.dart';
import '../widgets/common_generate_button.dart';
import '../widgets/content_card.dart';



class CommonDeskTopNBody extends StatelessWidget {
  final List<Map<String, dynamic>> contentList;
   CommonDeskTopNBody({
    super.key, required this.contentList,
  });


  @override
  Widget build(BuildContext context) {
    String hintText = "";
    String head ="";
    bool textVisibile = false;
    TextEditingController controller = TextEditingController();
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AspectRatio(
              aspectRatio:7,
              child: SizedBox(
                width: double.infinity,
                child: ListView.builder(
                  shrinkWrap: true,
                  padding:  EdgeInsets.zero,
                  scrollDirection:Axis.horizontal,
                  itemCount: contentList.length,
                  /*gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4, childAspectRatio: 2, crossAxisSpacing: 2),*/
                  itemBuilder: (BuildContext context, int index) {
                    final containerData = contentList[index];
                    return Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: InkWell(
                        onTap: () {
                            head = containerData["name"];
                            hintText = containerData["hint"];
                            Helper.dataToShow.value = containerData;
                            textVisibile = true;
                            Helper.paraphraseNotifier.value = false;
                            Helper.generateContentNotifier.value = {};
                            controller.clear();
                        },
                        child: Container(
                          width: 300,
                          decoration:BoxDecoration(
                              color: borderColor,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(width: 2.0, color: gradient1)

                          ),
                          child: AspectRatio(
                            aspectRatio: 0.5,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                      child: AutoSizeText("${containerData["name"]}", style: getTextStyle(color: gradient2, fontSize: 16, wgt: FontWeight.w700),)),
                                  Expanded(
                                    child: AutoSizeText("${containerData["description"]}",style: getTextStyle(color: gradient3, fontSize: 16, wgt: FontWeight.w600),
                                    )
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },),
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
            ValueListenableBuilder(
              valueListenable: Helper.loadShimmerContentNotifier,
              builder: (BuildContext context, load, Widget? child) {
                return Expanded(
                  child: load ? const SpinKitWaveSpinner(color: gradient1, size: 100,):SizedBox(
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
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width*0.90,
                  height: 150,
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
          ],
        ),
      ),
    );
  }
}


