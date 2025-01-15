import 'package:flutter/material.dart';

class About extends StatelessWidget {
  const About(this.aboutKey, this.contactKey, {super.key});

  final GlobalKey aboutKey;
  final GlobalKey contactKey;

  final List<String> skills = const [
    'Flutter',
    'Dart',
    'Java',
    'Firebase',
    'Github',
    'Git',
    'UI/UX Design',
    'Google Ad',
    'Google Map',
    'Push Notification',
    'Firebase Authentication',
    'FireStore Database',
    'Fastlane Setup',
    'Restful APIs',
    'App Center',
    'Jira',
    'Postman'
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      key: aboutKey, // Ensure the key is used here for scrolling functionality
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Center(
            child: Text(
              "About Me",
              textAlign: TextAlign.justify,
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 70, bottom: 10),
            child: LayoutBuilder(
              builder: (context, constraints) {
                bool isSmallScreen = constraints.maxWidth < 600;
                return isSmallScreen
                    ? Column(
                        children: _buildContent(),
                      )
                    : Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: _buildContent(),
                      );
              },
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildContent() {
    return [
      Expanded(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Let me introduce myself!",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              const SizedBox(height: 25),
              const Padding(
                padding: EdgeInsets.only(right: 20),
                child: Text(
                  "Hello! I'm Mohammed Aathif, a dedicated Flutter Developer from Chennai, Tamil Nadu. With over three years of experience, I focus on building high-quality, user-friendly mobile applications that address real-world challenges and deliver seamless experiences. I specialize in creating intuitive interfaces and robust functionalities using Flutter, along with a variety of modern tools.\n\n"
                  "Feel free to reach out if you're looking for a skilled developer to bring your project to life. Let's create something extraordinary together!",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                  textAlign: TextAlign.justify,
                ),
              ),
              const SizedBox(height: 15),
              ElevatedButton(
                onPressed: () {
                  final context = contactKey.currentContext;
                  if (context != null) {
                    Scrollable.ensureVisible(
                      context,
                      alignment: 0.0, // Adjust alignment if needed
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    );
                  }
                },
                child: const Text(
                  "Contact Me",
                  style: TextStyle(color: Colors.black),
                ),
              )
            ],
          ),
        ),
      ),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "My Skills",
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            const SizedBox(height: 30),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: skills
                  .map(
                    (skill) => Chip(
                      label: Text(skill),
                      backgroundColor: Colors.grey.shade100,
                      side: const BorderSide(color: Colors.black, width: 0.1),
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    ];
  }
}
