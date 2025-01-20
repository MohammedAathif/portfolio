class AppConstants {

  static final Uri resumeUrl = Uri.parse('https://docs.google.com/document/d/13eqeg7np8h7uHBxAyVjlNVn8U9h0-NEijHatpx2_NkE/edit?usp=sharing');
  // static final Uri resumeUrl = Uri.parse('https://github.com/MohammedAathif');


  static String serviceId = 'service_aab12';
  static String templateId = 'template_1t4aprq';
  static String publicKey = '1AuKJfNXP-4ujOaVm';
  static String aboutMe = "About Me";
  static String letMeIntroduce = "Let me introduce myself!";
  static String aboutMeInfo = "Hello! I'm Mohammed Aathif, a dedicated Flutter Developer from Chennai, Tamil Nadu. With over three years of experience, I focus on building high-quality, user-friendly mobile applications that address real-world challenges and deliver seamless experiences. I specialize in creating intuitive interfaces and robust functionalities using Flutter, along with a variety of modern tools.\n\n"
      "Feel free to reach out if you're looking for a skilled developer to bring your project to life. Let's create something extraordinary together!";
  static String contactMe = "Contact Me";
  static String mySkills = "My Skills";
  static String contact =  "CONTACT";
  static String contactInfo =  "I'm always eager to explore new opportunities and welcome any outreach. Feel free to get in touch with me.";
  static String name =  "Name";
  static String nameHint =  "Enter Your Name";
  static String emptyNameErrorText =  "Please enter your Name";
  static String email =  "Email";
  static String emailHint =  "Enter Your Email";
  static String emptyEmailErrorText =  "Please enter your Email";
  static String validEmailErrorText =  "Please enter a valid email address";
  static String message =  "Message";
  static String messageHint =  "Enter Your Message";
  static String emptyMessageErrorText =  "Please enter your Message";
  static String submit = 'SUBMIT';
  static String footerMessage = "© 2025 Mohammed Aathif. All Rights Reserved.";
  static String resume = "Resume";
  static String myName = 'Mohammed Aathif';
  static String myEmail = 'mohammedaathif.mh@gmail.com';
  static String helloText = "Hello, I'm Mohammed Aathif";
  static String introAboutMe = "I am a passionate Flutter Developer with over three years of experience building high-quality mobile apps. I focus on creating seamless and intuitive user experiences using Flutter, Firebase, and other modern tools. Let's bring your app idea to life!";
  static String projects = "Projects";
  static String myProjects = "My Projects";

  static const List<String> skills = [
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

  static final List<Map<String, dynamic>> socialMedia = [
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

  static const projectDetails = [
    {
      'title': 'Spotcare',
      'description':
      ' SpotCare is an exclusive Doctor Centric App designed to enhance daily practice for registered medical practitioners using new-age technologies.\n\n Available to medical practitioners and healthcare staff, with the ability to connect with doctors via Jitsi calls to measure patient vitals.',
      'images': 'assets/spotcare.PNG',
      'playStoreLink':
      'https://play.google.com/store/apps/details?id=com.naturalminds'
    },
    {
      'title': 'SingX',
      'description':
      'Led the end-to-end development of a global money transfer app using Flutter, supporting Android, iOS, and web platforms.\n\n Focused on providing a reliable, convenient, and cost-effective solution for international financial transactions, ensuring compliance with regulations and standards.',
      'images': 'assets/singx.PNG',
      'playStoreLink': 'https://play.google.com/store/search?q=singx&c=apps'
    },
    {
      'title': 'EnrichTv',
      'description':
      'Designed and developed a TV-based platform with a built-in learning component featuring renowned mentors, using Flutter for mobile, web, and Android TV.\n\n Ensured a consistent and responsive user interface across platforms, improving accessibility for a wide audience.',
      'images': 'assets/enrich.webp',
      'playStoreLink':
      'https://play.google.com/store/apps/details?id=com.enrichtv.android'
    },
    {
      'title': 'MVLife',
      'description':
      'Develop a user-friendly application that helps users locate nearby parks, restaurants, events, and recreational destinations using location-based services.\n\n Focus on providing real-time suggestions, directions, and information to enhance the users experience when exploring local attractions.',
      'images': 'assets/MvLife.PNG',
      'playStoreLink':
      'https://play.google.com/store/apps/details?id=com.missionviejo'
    },
    {
      'title': 'Jopo',
      'description':
      'Ride-hailing app similar to Ola and Uber, offering quick and reliable rides with features like fare estimation, real-time tracking, and multiple payment options.\n\n Focuses on user-friendly experience and safety, providing a convenient on-demand transportation solution for passengers and drivers.',
      'images': 'assets/jopo.png',
      'playStoreLink': 'https://play.google.com/store/apps/details?id=com.enrichtv.android'
    }
  ];
}