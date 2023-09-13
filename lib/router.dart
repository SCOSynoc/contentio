import 'package:contientiao/desktop/paraphrase_screen.dart';
import 'package:contientiao/desktop_screen.dart';
import 'package:contientiao/main.dart';
import 'package:contientiao/mobile_screen.dart';
import 'package:contientiao/tablet_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


Route<dynamic> generateRoute(RouteSettings settings){
  switch(settings.name){
    case Paraphrase.routeName :
        Map<String, dynamic> data =  settings.arguments as Map<String, dynamic>;
      return MaterialPageRoute(builder: (context) =>  Paraphrase(paraphraseMap: data,));
    case MobileScreen.routeName :
      return MaterialPageRoute(builder: (context) => const MobileScreen());
    case TabletScreen.routeName:
      return MaterialPageRoute(builder: (context) => const TabletScreen());
    case DesktopScreen.routeName:
      return MaterialPageRoute(builder: (context) =>  const DesktopScreen(from: "main"));
    case MyApp.routeName :
      return MaterialPageRoute(builder: (context) => const MyApp());
    default : return MaterialPageRoute(builder: (context) => const MyApp());
  }


}