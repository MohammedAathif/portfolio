import 'intro.dart';
import 'contact.dart';
import 'projects.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_website/screens/about.dart';
import 'package:portfolio_website/screens/footer.dart';
import 'package:portfolio_website/utils/app_constants.dart';
import 'package:portfolio_website/utils/helper_widget.dart';

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

  @override
  Widget build(BuildContext context) {
    // List of section names and corresponding keys
    final sections = [
      {'title': 'Home', 'key': introKey},
      {'title': 'About', 'key': aboutKey},
      {'title': 'Projects', 'key': projectsKey},
      {'title': 'Contact', 'key': contactKey},
    ];

    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: width > 750
            ? [
                Row(
                  children: sections
                      .map((section) => buildAppBarTitle(
                            section['key'] as GlobalKey,
                            section['title'] as String,
                          ))
                      .toList(),
                ),
                buildResume(),
              ]
            : [buildResume(isMobile: true)],
      ),
      drawer: width > 750 ? null : buildDrawer(sections),
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

  Widget buildResume({bool isMobile = false}) {
    return Padding(
      padding:
          EdgeInsets.only(right: isMobile ? 20 : 30, top: isMobile ? 10 : 0),
      child: ElevatedButton(
          child: Text(AppConstants.resume,
              style: const TextStyle(color: Colors.black)),
          onPressed: () => openUrl(AppConstants.resumeUrl)),
    );
  }

  Widget buildDrawer(List<Map<String, Object>> sections) {
    return Drawer(
      backgroundColor: Colors.black,
      child: ListView(
        // Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.purple,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 20),
                  child: CircleAvatar(
                    child: Text("A"),
                  ),
                ),
                Text(
                  AppConstants.myName,
                  style: const TextStyle(color: Colors.white, fontSize: 20),
                ),
                Text(AppConstants.myEmail,
                    style: const TextStyle(color: Colors.white, fontSize: 15)),
              ],
            ),
          ),
          for (var section in sections)
            buildTitle(section['key'] as GlobalKey, section['title'] as String)
        ],
      ),
    );
  }

  Widget buildAppBarTitle(GlobalKey key, String title) {
    bool isSelected = selectedSection == title;

    return InkWell(
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
      child: Padding(
        padding: const EdgeInsets.only(right: 30),
        child: Text(
          title,
          style: TextStyle(
            color: isSelected ? Colors.blue : Colors.white,
            fontSize: 20,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }

  Widget buildTitle(GlobalKey key, String title) {
    return Column(
      children: [
        ListTile(
          onTap: () {
            final context = key.currentContext;
            if (context != null) {
              Navigator.pop(context);
              Scrollable.ensureVisible(
                context,
                alignment: 0.0,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
              );
            }
          },
          title: Text(
            title,
            style: const TextStyle(fontSize: 20, color: Colors.white),
          ),
          trailing: const Icon(
            Icons.arrow_forward_ios_rounded,
            color: Colors.white,
          ),
        ),
        const Divider(),
      ],
    );
  }
}
