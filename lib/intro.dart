import 'package:flutter/material.dart';

class Intro1 extends StatelessWidget {
  const Intro1(this.introKey, this.projectKey, {super.key});

  final GlobalKey introKey;
  final GlobalKey projectKey;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      key: introKey,
      height: 400,
      child: Column(
        children: [
          const Center(child: Text("Intro")),
        ],
      ),
    );
  }
}

class Intro extends StatelessWidget {
  const Intro(this.introKey, this.projectKey, {super.key});

  final GlobalKey introKey;
  final GlobalKey projectKey;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450,
      key: introKey,
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Text(
              "Hello, I'm Mohammed Aathif",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          const SizedBox(height: 15),
          Center(
            child: Container(
              width: 900,
              child: const Text(
                "I am a passionate Flutter Developer with over three years of experience building high-quality mobile apps. I focus on creating seamless and intuitive user experiences using Flutter, Firebase, and other modern tools. Let's bring your app idea to life!",
                style: TextStyle(fontSize: 18, color: Colors.white),
                textAlign: TextAlign.justify,
              ),
            ),
          ),
          const SizedBox(height: 30),
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
                child: const Text(
                  "Projects",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
