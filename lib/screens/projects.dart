import 'package:flutter/material.dart';
import 'package:portfolio_website/utils/app_constants.dart';
import 'package:portfolio_website/utils/helper_widget.dart';

class Projects extends StatelessWidget {
  const Projects(this.projectKey, {super.key});

  final GlobalKey projectKey;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      key: projectKey,
      children: [
        Center(
          child: Padding(
            padding: EdgeInsets.only(top: 15, bottom: width > 750 ? 30 : 0),
            child: Text(
              AppConstants.myProjects,
              style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
        ),
        if (width > 750)
          for (int i = 0; i < AppConstants.projectDetails.length; i++)
            buildProjectRow(
                AppConstants.projectDetails[i]['title'] ?? '',
                AppConstants.projectDetails[i]['description'] ?? '',
                AppConstants.projectDetails[i]['images'] ?? '',
                AppConstants.projectDetails[i]['playStoreLink'] ?? ''),
        if (width < 750)
          for (int i = 0; i < AppConstants.projectDetails.length; i++)
            buildProjectForMobile(
                AppConstants.projectDetails[i]['title'] ?? '',
                AppConstants.projectDetails[i]['description'] ?? '',
                AppConstants.projectDetails[i]['images'] ?? '',
                AppConstants.projectDetails[i]['playStoreLink'] ?? ''),
        const SizedBox(height: 70),
      ],
    );
  }

  Widget buildProjectRow(
      String title, String description, String image, String playStoreLink) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: MouseRegion(
                onEnter: (_) {
                  SystemMouseCursors.click;
                },
                onExit: (_) {
                  SystemMouseCursors.basic;
                },
                child: InkWell(
                  onTap: () {
                    openUrl(Uri.parse(playStoreLink));
                  },
                  child: SizedBox(
                    height: 250,
                    width: 200,
                    child: Center(
                      child: Image.asset(image),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: SizedBox(
              height: 250,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  buildTitle(title),
                  buildDescription(description),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buildProjectForMobile(
      String title, String description, String image, String playStoreLink) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              child: buildTitle(title, isMobile: true),
            ),
            Center(
              child: InkWell(
                onTap: () {
                  openUrl(Uri.parse(playStoreLink));
                },
                child: SizedBox(
                  height: 150,
                  width: 250,
                  child: Center(child: Image.asset(image)),
                ),
              ),
            ),
            buildDescription(description, isMobile: true),
          ],
        ));
  }

  Widget buildTitle(String title, {bool isMobile = false}) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: isMobile ? 0 : 8, horizontal: isMobile ? 10 : 0),
      child: Text(
        title,
        style: const TextStyle(
            fontWeight: FontWeight.bold, fontSize: 30, color: Colors.white),
      ),
    );
  }

  Widget buildDescription(String description, {bool isMobile = false}) {
    return Padding(
      padding: EdgeInsets.only(
          right: isMobile ? 20 : 40,
          left: isMobile ? 20 : 0,
          top: isMobile ? 10 : 0),
      child: Text(
        description,
        style: TextStyle(color: Colors.white, fontSize: isMobile ? 16 : null),
        textAlign: TextAlign.justify,
      ),
    );
  }
}
