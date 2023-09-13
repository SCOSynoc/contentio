import 'package:contientiao/desktop_screen.dart';
import 'package:contientiao/mobile_screen.dart';
import 'package:contientiao/service/api_service.dart';
import 'package:contientiao/tablet_screen.dart';
import 'package:contientiao/utils/factory_method.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout({Key? key, required this.mobileScaffold, required this.tabletScaffold, required this.desktopScaffold}) : super(key: key);
  final Widget mobileScaffold;
  final Widget tabletScaffold;
  final Widget desktopScaffold;

  @override
  Widget build(BuildContext context) {

    return LayoutBuilder(builder: (context, constraints) {
       if(constraints.maxWidth < 700) {
         return MobileScreen();
       }else if(constraints.maxWidth < 1300) {
         return TabletScreen();
       }else {
         return DesktopScreen(from: "main");
       }
    });
  }
}

class ResponsiveWidget extends StatelessWidget {
  const ResponsiveWidget({Key? key, required this.mobileScaffold, required this.tabletScaffold, required this.desktopScaffold}) : super(key: key);
  final Widget mobileScaffold;
  final Widget tabletScaffold;
  final Widget desktopScaffold;

  @override
  Widget build(BuildContext context) {

    return LayoutBuilder(builder: (context, constraints) {
      if(constraints.maxWidth < 700) {
        return mobileScaffold;
      }else if(constraints.maxWidth < 1300) {
        return tabletScaffold;
      }else {
        return desktopScaffold;
      }
    });
  }
}
