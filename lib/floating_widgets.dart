import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:velocity_x/velocity_x.dart';
// import 'package:url_launcher/url_launcher.dart';


class FloatWidget extends StatelessWidget {

  // _launchURLFacebook() async {
  //   const url = 'https://www.facebook.com/renuka.kelkar';
  //   if (await canLaunch(url)) {
  //     await launch(url, forceSafariVC: true, forceWebView: true);
  //   } else {
  //     throw 'Could not launch $url';
  //   }
  // }
  // _launchURLTwitter() async {
  //   const url = 'https://twitter.com/TechPowerGirls1';
  //   if (await canLaunch(url)) {
  //     await launch(url, forceSafariVC: true, forceWebView: true);
  //   } else {
  //     throw 'Could not launch $url';
  //   }
  // }
  // _launchURLGithub() async {
  //   const url = 'https://github.com/renuvkelkar';
  //   if (await canLaunch(url)) {
  //     await launch(url, forceSafariVC: true, forceWebView: true);
  //   } else {
  //     throw 'Could not launch $url';
  //   }
  // }
  // _launchURLLinkedIn() async {
  //   const url = 'https://github.com/renuvkelkar';
  //   if (await canLaunch(url)) {
  //     await launch(url, forceSafariVC: true, forceWebView: true);
  //   } else {
  //     throw 'Could not launch $url';
  //   }
  // }




  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 15),
          FloatingActionButton(
            onPressed: () {
              //_launchURLFacebook();
            },
            child:   Icon(Icons.face,color: Colors.white,),
          ),
          SizedBox(height: 15),
          FloatingActionButton(
            onPressed: () {
             // _launchURLTwitter();
            },
            child:   Icon(Icons.home,color: Colors.white,),
          ),SizedBox(height: 15),
          FloatingActionButton(
            onPressed: () {
              //_launchURLGithub();
            },
            child:  Icon(Icons.home,color: Colors.white,),
          ),SizedBox(height: 15),
          FloatingActionButton(
            onPressed: () {
              //_launchURLLinkedIn();
            },
            child: Icon(Icons.home,color: Colors.white,),
          ),SizedBox(height: 15),
        ],
      ),
    );
  }
}