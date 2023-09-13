import 'package:contientiao/desktop_screen.dart';
import 'package:contientiao/mobile_screen.dart';
import 'package:contientiao/responsive/responsive_layout.dart';
import 'package:contientiao/router.dart';
import 'package:contientiao/tablet_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:url_strategy/url_strategy.dart';

void main() async {
  debugPaintSizeEnabled = false;
  setPathUrlStrategy();
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static const String routeName = "/main";

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: const ColorScheme.dark(),
        useMaterial3: true,
      ),
      onGenerateRoute: (settings) => generateRoute(settings),
      home: const ResponsiveLayout(
        mobileScaffold: MobileScreen(),
        tabletScaffold: TabletScreen(),
        desktopScaffold: DesktopScreen(from: 'main',),
      ),
    );
  }
}




