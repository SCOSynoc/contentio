import 'package:contientiao/contants/constants.dart';

import 'package:contientiao/widgets/common_generate_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/colors.dart';

class ParaphraseField extends StatelessWidget {
  const ParaphraseField({Key? key, required this.textEditingController}) : super(key: key);
  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: textEditingController,
        maxLines: null, // Allow unlimited lines of text
        keyboardType: TextInputType.multiline,
        maxLength: 462,
        style: getTextStyle(color: gradient3, fontSize: 16, wgt: FontWeight.w600),
        decoration:  InputDecoration(
          border: InputBorder.none,
          floatingLabelBehavior: FloatingLabelBehavior.never,
          hintText: 'Enter text here...',
          labelText: 'Paraphrase',
          labelStyle: getTextStyle(color:gradient2 , fontSize: 16, wgt: FontWeight.w800),
          hintStyle: getTextStyle(color:gradient2 , fontSize: 16, wgt: FontWeight.w800),
          contentPadding: EdgeInsets.all(16.0),
          counterStyle: getTextStyle(color: gradient3, fontSize: 16, wgt: FontWeight.w600),
        ),
      ),
    );
  }
}
