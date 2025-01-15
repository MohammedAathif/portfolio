import 'package:flutter/material.dart';

class Skills extends StatelessWidget {
  const Skills(this.skillsKey, {super.key});

  final GlobalKey skillsKey;

  final List skills = const [
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
    'App center',
    'Jira',
    'Postman'
  ];

  @override
  Widget build(BuildContext context) {
    return Wrap(
      key: skillsKey,
      spacing: 10,
      runSpacing: 20,
      children: skills.map((name) => Chip(label: Text(name))).toList(),
    );
  }
}
