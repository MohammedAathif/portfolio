import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Footer extends StatelessWidget {
  Footer({super.key});

  final List<Map<String, dynamic>> socialMedia = [
    {
      'name': 'linkedin',
      'url': Uri.parse('https://www.linkedin.com/in/mohammed-aathif-87a256200')
    },
    {'name': 'github', 'url': Uri.parse('https://github.com/MohammedAathif')},
    {
      'name': 'insta',
      'url': Uri.parse(
          'https://www.instagram.com/its_me__aathif/?utm_source=qr&igsh=cW8yOHNxYnU4Mmtu')
    },
  ];

  Future<void> openUrl(Uri url) async {
    try {
      if (await canLaunchUrl(url)) { // Use canLaunchUrl
        await launchUrl(url); // Use launchUrl
      } else {
        throw 'Could not launch $url';
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      child: Column(
        children: [
          // Social Media Icons
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i < socialMedia.length; i++)
                buildSocialMediaIcon(
                    icon: socialMedia[i]['name'],
                    onPressed: () => openUrl(socialMedia[i]['url'])),
            ],
          ),
          const SizedBox(height: 10),
          const Text(
            '© 2025 Mohammed Aathif. All Rights Reserved.',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }

  buildSocialMediaIcon({required String icon, void Function()? onPressed}) {
    return IconButton(
        icon: Image.asset('assets/$icon.png', height: 25, width: 30),
        onPressed: onPressed);
  }
}
