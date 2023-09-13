import 'package:auto_size_text/auto_size_text.dart';
import 'package:contientiao/contants/constants.dart';
import 'package:contientiao/utils/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../common/common_drawer.dart';
import '../desktop/paraphrase_screen.dart';
import '../utils/colors.dart';
import '../widgets/common_text_box.dart';
import '../widgets/content_card.dart';

class TabletBody extends StatefulWidget {

  const TabletBody({Key? key}) : super(key: key);

  @override
  State<TabletBody> createState() => _TabletBodyState();
}

class _TabletBodyState extends State<TabletBody> {
  List<Map<String, dynamic>> data = [];
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    String hintText = "";
    String head ="";
    bool textVisibile = false;
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.black12,
      ),
      drawer: CommonDrawer(
        blogCallback: (){
        setState(() {
          data = Helper.getContentSpecificList("Blog");
        });
      },
        socialMediaCallback: (){
          setState(() {
            data = Helper.getContentSpecificList("Social");
          });
        },

        paraCallback: () {
          setState(() {
            data=[];
            Helper.paraphraseNotifier.value = true;
            Helper.generateContentNotifier.value = {};
            Navigator.pushNamed(context, Paraphrase.routeName, arguments: paraphraseMap);
          });
        },
      ),

      body: Visibility(
        visible: data.isNotEmpty? true : false,
        replacement: Center(child: Image.asset("asset/Contentio-logos_transparent.png", color: borderColor,),),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: GridView.builder(
                padding: const EdgeInsets.all(18),
                itemCount: data.length,
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, childAspectRatio: 2.2),
                itemBuilder: (BuildContext context, int index) {
                  final containerData = data[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: InkWell(
                        onTap: () {
                          head = containerData["name"];
                          hintText = containerData["hint"];
                          Helper.dataToShow.value = containerData;
                          textVisibile = true;
                          Helper.generateContentNotifier.value = {};
                          controller.clear();
                        },
                        child: Container(
                          width: 350,
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
                                      child: AutoSizeText("${containerData["name"]}",  style: getTextStyle(color: gradient2, fontSize: 14, wgt: FontWeight.w900), maxLines: 2,textScaleFactor: MediaQuery.textScaleFactorOf(context),),
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
                }, ),
            ),
            ValueListenableBuilder(
              valueListenable: Helper.loadShimmerContentNotifier,
              builder: (BuildContext context, load, Widget? child) {
                return Expanded(
                  child:load ? const SpinKitWaveSpinner(color: gradient1, size: 100,): SizedBox(
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
          ],
        ),
      ),
    );
  }
}
