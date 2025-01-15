import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Projects extends StatelessWidget {
  const Projects(this.projectKey, {super.key});

  final GlobalKey projectKey;

  final projectDetails = const [
    {
      'title': 'Spotcare',
      'description':
          ' SpotCare is an exclusive Doctor Centric App designed to enhance daily practice for registered medical practitioners using new-age technologies.\n\n Available to medical practitioners and healthcare staff, with the ability to connect with doctors via Jitsi calls to measure patient vitals.',
      'images': 'assets/spotcare.PNG',
      'playstoreLink':
          'https://play.google.com/store/apps/details?id=com.naturalminds'
    },
    {
      'title': 'SingX',
      'description':
          'Led the end-to-end development of a global money transfer app using Flutter, supporting Android, iOS, and web platforms.\n\n Focused on providing a reliable, convenient, and cost-effective solution for international financial transactions, ensuring compliance with regulations and standards.',
      'images': 'assets/singx.PNG',
      'playstoreLink': 'https://play.google.com/store/search?q=singx&c=apps'
    },
    {
      'title': 'EnrichTv',
      'description':
          'Designed and developed a TV-based platform with a built-in learning component featuring renowned mentors, using Flutter for mobile, web, and Android TV.\n\n Ensured a consistent and responsive user interface across platforms, improving accessibility for a wide audience.',
      'images': 'assets/enrich.webp',
      'playstoreLink':
          'https://play.google.com/store/apps/details?id=com.enrichtv.android'
    },
    {
      'title': 'MVLife',
      'description':
          'Develop a user-friendly application that helps users locate nearby parks, restaurants, events, and recreational destinations using location-based services.\n\n Focus on providing real-time suggestions, directions, and information to enhance the users experience when exploring local attractions.',
      'images': 'assets/MvLife.PNG',
      'playstoreLink':
          'https://play.google.com/store/apps/details?id=com.missionviejo'
    },
    {
      'title': 'Jopo',
      'description':
          'Ride-hailing app similar to Ola and Uber, offering quick and reliable rides with features like fare estimation, real-time tracking, and multiple payment options.\n\n Focuses on user-friendly experience and safety, providing a convenient on-demand transportation solution for passengers and drivers.',
      'images': 'assets/jopo.PNG',
      'playstoreLink': ''
    }
  ];

  Future<void> openLink(Uri url) async {
    if (await canLaunchUrl(url)) { // Use canLaunchUrl
      await launchUrl(url); // Use launchUrl
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        key: projectKey,
        children: [
          const Center(
              child: Padding(
            padding: EdgeInsets.only(top: 15, bottom: 30),
            child: Text("My Projects",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
          )),
          for (int i = 0; i < projectDetails.length; i++)
            buildProjectRow(
                projectDetails[i]['title'] ?? '',
                projectDetails[i]['description'] ?? '',
                projectDetails[i]['images'] ?? '',
                projectDetails[i]['playstoreLink'] ?? ''),
          const SizedBox(height: 70),
        ],
      ),
    );
  }

  buildProjectRow(
      String title, String description, String image, String playstoreLink) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: MouseRegion(
                onEnter: (_) {
                  // Change the cursor when the user hovers over the widget
                  SystemMouseCursors.click;
                },
                onExit: (_) {
                  // Revert the cursor back when the user stops hovering
                  SystemMouseCursors.basic;
                },
                child: InkWell(
                  onTap: () {
                    openLink(Uri.parse(playstoreLink));
                  },
                  child: SizedBox(
                    height: 250,
                    width: 200,
                    child: Center(
                      child: Image.asset(
                        image,
                        // fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
              child: SizedBox(
            height: 250,
            // color: Colors.red,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                buildTitle(title),
                buildDescription(description),
              ],
            ),
          ))
        ],
      ),
    );
  }

  buildTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Text(
        title,
        style: const TextStyle(
            fontWeight: FontWeight.bold, fontSize: 30, color: Colors.white),
      ),
    );
  }

  buildDescription(String description) {
    return Padding(
      padding: const EdgeInsets.only(right: 40),
      child: Text(
        description,
        style: TextStyle(color: Colors.white),
        textAlign: TextAlign.justify,
      ),
    );
  }
}
