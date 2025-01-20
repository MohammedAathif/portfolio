import 'package:flutter/material.dart';
import 'package:portfolio_website/utils/app_constants.dart';
import 'package:portfolio_website/utils/helper_widget.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i < AppConstants.socialMedia.length; i++)
                buildSocialMediaIcon(
                    icon: AppConstants.socialMedia[i]['name'],
                    onPressed: () =>
                        openUrl(AppConstants.socialMedia[i]['url'])),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(
              AppConstants.footerMessage,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
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
