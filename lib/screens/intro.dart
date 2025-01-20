import 'package:flutter/material.dart';
import 'package:portfolio_website/utils/app_constants.dart';

class Intro extends StatelessWidget {
  const Intro(this.introKey, this.projectKey, {super.key});

  final GlobalKey introKey;
  final GlobalKey projectKey;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      key: introKey,
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              AppConstants.helloText,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15, bottom: 30),
            child: Center(
              child: SizedBox(
                width: 900,
                child: Text(
                  AppConstants.introAboutMe,
                  style: const TextStyle(fontSize: 18, color: Colors.white),
                  textAlign: TextAlign.justify,
                ),
              ),
            ),
          ),
          Center(
            child: SizedBox(
              height: 40,
              width: 150,
              child: ElevatedButton(
                onPressed: () {
                  final context = projectKey.currentContext;
                  if (context != null) {
                    Scrollable.ensureVisible(
                      context,
                      alignment: 0.0, // Adjust alignment if needed
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    );
                  }
                },
                child: Text(
                  AppConstants.projects,
                  style: const TextStyle(color: Colors.black),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
