import 'package:contientiao/common/common_drawer.dart';
import 'package:contientiao/tablet/tablet_body.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TabletScreen extends StatelessWidget {
  static const String routeName = '/dashboard-t';
  const TabletScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabletBody() ;
  }
}
