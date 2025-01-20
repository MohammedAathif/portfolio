import 'package:flutter/material.dart';
import 'package:portfolio_website/utils/app_constants.dart';

class About extends StatelessWidget {
  const About(this.aboutKey, this.contactKey, {super.key});

  final GlobalKey aboutKey;
  final GlobalKey contactKey;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Container(
      key: aboutKey,
      padding:
          EdgeInsets.symmetric(vertical: width > 750 ? 40 : 0, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              AppConstants.aboutMe,
              textAlign: TextAlign.justify,
              style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          Padding(
              padding: EdgeInsets.only(top: width > 750 ? 70 : 20, bottom: 10),
              child: _buildContent(context, width)),
        ],
      ),
    );
  }

  Widget _buildContent(BuildContext context, double width) {
    return width > 750
        ? Row(
            children: [
              Expanded(child: buildAboutMe()),
              Expanded(child: buildMySkills()),
            ],
          )
        : Column(
            children: [
              buildAboutMe(isMobile: true),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 40),
                child: buildMySkills(),
              )
            ],
          );
  }

  Widget buildAboutMe({bool isMobile = false}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppConstants.letMeIntroduce,
            style: const TextStyle(
                fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20, top: 25, bottom: 15),
            child: Text(
              AppConstants.aboutMeInfo,
              style: const TextStyle(fontSize: 16, color: Colors.white),
              textAlign: TextAlign.justify,
            ),
          ),
          Align(
            alignment: isMobile ? Alignment.center : Alignment.centerLeft,
            child: ElevatedButton(
              onPressed: () {
                final context = contactKey.currentContext;
                if (context != null) {
                  Scrollable.ensureVisible(
                    context,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                }
              },
              child: Text(
                AppConstants.contactMe,
                style: const TextStyle(color: Colors.black),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buildMySkills() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 30),
          child: Text(
            AppConstants.mySkills,
            style: const TextStyle(
                fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: AppConstants.skills
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
    );
  }
}
