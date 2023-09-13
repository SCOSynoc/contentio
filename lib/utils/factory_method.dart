import 'package:contientiao/desktop_screen.dart';
import 'package:contientiao/mobile_screen.dart';
import 'package:contientiao/tablet_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class Platform {
  Widget build(BuildContext context);
  factory Platform(TargetPlatform platform){
    switch(platform) {
      case TargetPlatform.android : return MobileUi();
      case TargetPlatform.iOS : return MobileUi();
      case TargetPlatform.fuchsia : return MobileUi();
      case TargetPlatform.macOS : return DesktopUI();
      default : return DesktopUI();
    }
  }
}


class MobileUi implements Platform {
  @override
  Widget build(BuildContext context) {
    return const MobileScreen();
  }

}

class TabUI implements Platform {
  @override
  Widget build(BuildContext context) {
    return const TabletScreen();
  }

}

class DesktopUI implements Platform {
  @override
  Widget build(BuildContext context) {
    return const DesktopScreen(from: "main");
  }

}