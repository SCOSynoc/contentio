import 'package:contientiao/mobile/mobile_body.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'common/common_drawer.dart';

class MobileScreen extends StatelessWidget {
  static const String routeName = '/dashboard-m';
  const MobileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: MobileBody());
  }
}

/*

Scaffold(
backgroundColor: Colors.grey.shade200,
appBar: AppBar(
backgroundColor: Colors.black12,
),
drawer: CommonDrawer(),
body: Column(
children: [
AspectRatio(
aspectRatio: 1,
child: SizedBox(
width: double.infinity,
child: GridView.builder(
itemCount: 4,
gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, ),
itemBuilder: (BuildContext context, int index) {
return Padding(
padding: const EdgeInsets.all(8.0),
child: Container(color: Colors.deepPurple.shade400,),
);
},),
),
),

],
),
)
*/

