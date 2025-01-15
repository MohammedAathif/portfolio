import 'package:flutter/material.dart';
import 'package:portfolio_website/about.dart';
import 'package:portfolio_website/contact.dart';
import 'package:portfolio_website/footer.dart';
import 'package:portfolio_website/intro.dart';
import 'package:portfolio_website/projects.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Define GlobalKeys for each section
  final GlobalKey introKey = GlobalKey();
  final GlobalKey aboutKey = GlobalKey();
  final GlobalKey projectsKey = GlobalKey();
  final GlobalKey contactKey = GlobalKey();

  // Track hover color for each title
  Map<String, Color> textColorMap = {
    'Home': Colors.white,
    'About': Colors.white,
    'Projects': Colors.white,
    'Contact': Colors.white,
  };

  String selectedSection = 'Home';

  final Uri resumeUrl = Uri.parse(
      'https://docs.google.com/document/d/13eqeg7np8h7uHBxAyVjlNVn8U9h0-NEijHatpx2_NkE/edit?usp=sharing');

  Future<void> openUrl(Uri url) async {
    if (await canLaunchUrl(url)) { // Use canLaunchUrl
      await launchUrl(url); // Use launchUrl
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    // List of section names and corresponding keys
    final sections = [
      {'title': 'Home', 'key': introKey},
      {'title': 'About', 'key': aboutKey},
      {'title': 'Projects', 'key': projectsKey},
      {'title': 'Contact', 'key': contactKey},
    ];

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          Row(
            children: sections
                .map((section) => buildAppBarTitle(
                      section['key'] as GlobalKey,
                      section['title'] as String,
                    ))
                .toList(),
          ),
          ElevatedButton(
              child:
                  const Text('Resume', style: TextStyle(color: Colors.black)),
              onPressed: () async {
                await openUrl(resumeUrl);
              }),
          const SizedBox(width: 30)
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Intro(introKey, projectsKey),
            About(aboutKey, contactKey),
            Projects(projectsKey),
            Contact(contactKey),
            Footer()
          ],
        ),
      ),
    );
  }

  // Widget to build app bar titles with scroll functionality
  Widget buildAppBarTitle(GlobalKey key, String title) {
    bool isSelected = selectedSection == title;

    return Row(
      children: [
        InkWell(
          onTap: () {
            setState(() => selectedSection = title);
            final context = key.currentContext;
            if (context != null) {
              Scrollable.ensureVisible(
                context,
                alignment: 0.0,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
              );
            }
          },
          child: Text(
            title,
            style: TextStyle(
              color: isSelected ? Colors.blue : Colors.white,
              fontSize: 20,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ),
        const SizedBox(width: 30),
      ],
    );
  }
}
