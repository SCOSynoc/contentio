import 'package:contientiao/common/common_desktop_body.dart';
import 'package:contientiao/contants/constants.dart';
import 'package:contientiao/desktop_screen.dart';
import 'package:contientiao/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommonDrawer extends StatelessWidget {
  const CommonDrawer({
    super.key, this.blogCallback, this.socialMediaCallback, this.scriptsCallback, this.paraCallback,
  });
  final Function()? blogCallback;
  final Function()? socialMediaCallback;
  final Function()? scriptsCallback;
  final Function()? paraCallback;


  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.black,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      child: Column(children: [
        DrawerHeader(
            decoration: const BoxDecoration(
                border: Border(
                    bottom: BorderSide(width: 2.0, color: gradient1)
                )
            ),
            child: Center(
              child: Image.asset("asset/Contentio-logos_white.png", color: gradient1,),
            )),
        InkWell(
          onTap: blogCallback,
          child:  ListTile(
            leading: const Icon(CupertinoIcons.wand_rays, color: gradient3,),
            title: Text("Blogs and Article writer",
              style: getTextStyle(color:gradient3 , fontSize: 14, wgt: FontWeight.bold)
              ,)
          ),
        ),
        InkWell(
          onTap: socialMediaCallback,
          child: ListTile(
            leading: const Icon(CupertinoIcons.sparkles, color: gradient3,),
            title: Text("Social media content writer",style: getTextStyle(color:gradient3 , fontSize: 14, wgt: FontWeight.bold)),
          ),
        ),
        /*InkWell(
          onTap: scriptsCallback,
          child: ListTile(
            leading: const Icon(CupertinoIcons.envelope_circle,color: Colors.white70,),
            title: Text("Write video scripts ", style: getTextStyle(color:Colors.white70 , fontSize: 14, wgt: FontWeight.bold)),
          ),
        ),*/
        InkWell(
          onTap:paraCallback,
          child: ListTile(
            leading: const Icon(CupertinoIcons.quote_bubble, color: gradient3,),
            title: Text("Paraphrase content", style: getTextStyle(color:gradient3 , fontSize: 14, wgt: FontWeight.bold)),
          ),
        )
      ],),
    );
  }
}
