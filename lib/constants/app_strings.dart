class AppStrings {
  static const String name = 'Zeeshan Sheikhs';
  static const String tagline = 'Flutter Developer';
  static const String roles =
      'Mobile App Developer|Flutter Expert|UI/UX Enthusiast|Full Stack Dev';
  static const String email = 'zeeshansheikh921837@gmail.com';
  static const String github = 'https://github.com/zeeshansheikhcode';
  static const String linkedin =
      'https://www.linkedin.com/in/zeeshan-sheikhs-814b55220/';
  //static const String twitter = 'https://twitter.com/zeeshansheikh';

  static const String aboutTitle = 'About Me';
  static const String aboutText =
      'I am a passionate Flutter developer with expertise in building beautiful, '
      'high-performance mobile and web applications. With a strong foundation in '
      'Dart and modern app architecture, I craft seamless digital experiences that '
      'users love. I thrive on turning complex problems into elegant, intuitive solutions.';

  static const String aboutText2 =
      'When I am not coding, I contribute to open-source projects, write technical '
      'articles, and mentor aspiring developers. My goal is to leverage technology '
      'to create meaningful impact in the world.';

  static const List<Map<String, String>> skills = [
    {'name': 'Flutter', 'level': '95'},
    {'name': 'Dart', 'level': '92'},
    {'name': 'Firebase', 'level': '85'},
    {'name': 'REST APIs', 'level': '88'},
    {'name': 'UI/UX Design', 'level': '80'},
    {'name': 'Git & GitHub', 'level': '90'},
    {'name': 'State Management', 'level': '87'},
    // {'name': 'Node.js', 'level': '70'},
  ];

  static const List<Map<String, dynamic>> projects = [
    // KFC Mobile Apps
    {
      'title': 'Pakistan KFC Application',
      'description':
          'A high-performance mobile app for KFC Pakistan. '
          'Built with Bloc, Clean Architecture, and MoEngage for robust state management, push notifications, and modular structure. '
          'Supports seamless ordering, user engagement, and analytics.',
      'tech': ['Flutter', 'Firebase', 'Bloc', 'Clean Architecture', 'MoEngage'],
      'github': '',
      'live':
          'https://play.google.com/store/apps/details?id=io.bramerz.kfc&hl=en',
      'color': '6C63FF',
      'icon': '🛒',
      'market': 'Pakistan',
      'image': 'assets/images/kfc_logo.png',
    },
    {
      'title': 'Oman KFC Application',
      'description':
          'A high-performance mobile app for KFC Oman. '
          'Built with Bloc, Clean Architecture, and MoEngage for robust state management, push notifications, and modular structure. '
          'Supports seamless ordering, user engagement, and analytics.',
      'tech': ['Flutter', 'Firebase', 'Bloc', 'Clean Architecture', 'MoEngage'],
      'github': '',
      'live': 'https://play.google.com/store/apps/details?id=com.kfc.oman',
      'color': '6C63FF',
      'icon': '🛒',
      'market': 'Oman',
      'image': 'assets/images/kfc_logo.png',
    },
    {
      'title': 'Morocco KFC Application',
      'description':
          'A high-performance mobile app for KFC Morocco. '
          'Built with Bloc, Clean Architecture, and MoEngage for robust state management, push notifications, and modular structure. '
          'Supports seamless ordering, user engagement, and analytics.',
      'tech': ['Flutter', 'Firebase', 'Bloc', 'Clean Architecture', 'MoEngage'],
      'github': '',
      'live': 'https://play.google.com/store/apps/details?id=com.kfc.morocco',
      'color': '6C63FF',
      'icon': '🛒',
      'market': 'Morocco',
      'image': 'assets/images/kfc_logo.png',
    },

    // KFC KIOSK
    {
      'title': 'Pakistan KFC KIOSK',
      'description':
          'A kiosk solution for KFC Pakistan built using Bloc, Clean Architecture, and MoEngage. '
          'Provides in-store ordering, analytics, and notifications for a smooth customer experience.',
      'tech': ['Flutter', 'Firebase', 'Bloc', 'Clean Architecture', 'MoEngage'],
      'github': '',
      'live': '',
      'color': 'FF9F43',
      'icon': '🖥️',
      'market': 'Pakistan',
      'image': 'assets/images/kfc_logo.png',
    },

    // Pizza Hut
    {
      'title': 'Pakistan Pizza Hut Application',
      'description':
          'Pizza Hut mobile app for Pakistan built with Bloc, Clean Architecture, and MoEngage. '
          'Provides smooth ordering, promotions, and push notifications. '
          'Ensures reliable state management and scalable structure.',
      'tech': ['Flutter', 'Firebase', 'Bloc', 'Clean Architecture', 'MoEngage'],
      'github': '',
      'live':
          'https://play.google.com/store/apps/details?id=com.pizzahut.pakistan&hl=en',
      'color': 'FF6B6B',
      'icon': '🛒',
      'market': 'Pakistan',
      'image': 'assets/images/pizza_hut.png',
    },
    {
      'title': 'South Africa Pizza Hut Application',
      'description':
          'Pizza Hut mobile app for South Africa built with Bloc, Clean Architecture, and MoEngage. '
          'Provides smooth ordering, promotions, and push notifications. '
          'Ensures reliable state management and scalable structure.',
      'tech': ['Flutter', 'Firebase', 'Bloc', 'Clean Architecture', 'MoEngage'],
      'github': '',
      'live':
          'https://play.google.com/store/search?q=pizza%20hut%20south%20africa&c=apps&hl=en',
      'color': 'FF6B6B',
      'icon': '🛒',
      'market': 'South Africa',
      'image': 'assets/images/pizza_hut.png',
    },
    {
      'title': 'Qatar Pizza Hut Application',
      'description':
          'Pizza Hut mobile app for Qatar built with Bloc, Clean Architecture, and MoEngage. '
          'Provides smooth ordering, promotions, and push notifications. '
          'Ensures reliable state management and scalable structure.',
      'tech': ['Flutter', 'Firebase', 'Bloc', 'Clean Architecture', 'MoEngage'],
      'github': '',
      'live':
          'https://play.google.com/store/search?q=pizza+hut+qatar&c=apps&hl=en',
      'color': 'FF6B6B',
      'icon': '🛒',
      'market': 'Qatar',
      'image': 'assets/images/pizza_hut.png',
    },
    {
      'title': 'Pakistan Pizza Hut KIOSK',
      'description':
          'Pizza Hut kiosk for Pakistan using Bloc, Clean Architecture, and MoEngage. '
          'Supports in-store ordering and analytics for customers and staff.',
      'tech': ['Flutter', 'Firebase', 'Bloc', 'Clean Architecture', 'MoEngage'],
      'github': '',
      'live': '',
      'color': 'FF9F43',
      'icon': '🖥️',
      'market': 'Pakistan',
      'image': 'assets/images/pizza_hut.png',
    },

    // Johnny & Jugnu KIOSK
    {
      'title': 'Johnny & Jugnu KIOSK',
      'description':
          'A kiosk app for Johnny & Jugnu built with Flutter and Bloc architecture. '
          'Provides smooth customer interactions and in-store management features.',
      'tech': ['Flutter', 'Firebase', 'Bloc', 'Clean Architecture'],
      'github': '',
      'live': '',
      'color': 'FF9F43',
      'icon': '🖥️',
      'market': 'Johnny & Jugnu',
      'image': 'assets/images/j&j.jpg',
    },

    // Trim SAAS Apps
    {
      'title': 'Trim Salon App',
      'description':
          'SAAS-based Salon App built with GetX and MVC. '
          'Supports booking, client management, and staff scheduling. '
          'Similar to Fresha, ideal for salon business operations.',
      'tech': ['Flutter', 'GetX', 'MVC'],
      'github': '',
      'live': 'https://apps.apple.com/us/app/trim-business/id6742323827',
      'color': '00D4FF',
      'icon': '💇',
      'market': 'Trim',
      'image': 'assets/images/trim.jpg',
    },
    {
      'title': 'Trim Client App',
      'description':
          'SAAS-based Client App built with GetX and MVC. '
          'Helps clients book appointments, track services, and manage accounts. '
          'Similar to Fresha, providing seamless client experience.',
      'tech': ['Flutter', 'GetX', 'MVC'],
      'github': '',
      'live': 'https://apps.apple.com/cz/app/trim/id6742999519',
      'color': '00D4FF',
      'icon': '📱',
      'market': 'Trim',
      'image': 'assets/images/trim.jpg',
    },

    // MyAce Apps (like Foodpanda)
    {
      'title': 'MyAce Business App',
      'description':
          'A food delivery business app built with GetX and MVVM. '
          'Allows restaurants to manage orders, menus, and analytics. '
          'Similar to Foodpanda, designed for business operations.',
      'tech': ['Flutter', 'GetX', 'MVVM'],
      'github': '',
      'live':
          'https://play.google.com/store/apps/details?id=com.sigitechnologies.myaceupdated&hl=en',
      'color': '6C63FF',
      'icon': '💼',
      'market': 'MyAce',
      'image': 'assets/images/myace.jpg',
    },
    {
      'title': 'MyAce Rider App',
      'description':
          'A food delivery rider app built with GetX and MVVM. '
          'Supports order tracking, navigation, and delivery management. '
          'Similar to Foodpanda, designed for drivers on the go.',
      'tech': ['Flutter', 'GetX', 'MVVM'],
      'github': '',
      'live':
          'https://play.google.com/store/apps/details?id=com.sigitechnologies.myacedriverupdated&hl=en',
      'color': '6C63FF',
      'icon': '🏍️',
      'market': 'MyAce',
      'image': 'assets/images/myace.jpg',
    },
  ];
  // static const List<Map<String, dynamic>> projects = [

  //   {
  //     'title': 'Pakistan KFC Application',
  //     'description': 'A fully featured mobile application for Pakistan.',
  //     'tech': ['Flutter', 'Firebase', 'MoEngage', 'Bloc', 'Clean Architecture'],
  //     'github': '',
  //     'live':
  //         'https://play.google.com/store/apps/details?id=io.bramerz.kfc&hl=en',
  //     'color': '6C63FF',
  //     'icon': '🛒',
  //     'market': 'Pakistan',
  //     'image': 'assets/images/kfc_logo.png',
  //   },
  //   {
  //     'title': 'Oman KFC Application',
  //     'description': 'A fully featured mobile application for Oman.',
  //     'tech': ['Flutter', 'Firebase', 'MoEngage', 'Bloc', 'Clean Architecture'],
  //     'github': '',
  //     'live': 'https://play.google.com/store/apps/details?id=com.kfc.oman',
  //     'color': '6C63FF',
  //     'icon': '🛒',
  //     'market': 'Oman',
  //     'image': 'assets/images/kfc_logo.png',
  //   },
  //   {
  //     'title': 'Morocco KFC Application',
  //     'description': 'A fully featured mobile application for Morocco.',
  //     'tech': ['Flutter', 'Firebase', 'MoEngage', 'Bloc', 'Clean Architecture'],
  //     'github': '',
  //     'live': 'https://play.google.com/store/apps/details?id=com.kfc.morocco',
  //     'color': '6C63FF',
  //     'icon': '🛒',
  //     'market': 'Morocco',
  //     'image': 'assets/images/kfc_logo.png',
  //   },
  // ];

  static const List<Map<String, String>> experience = [
    {
      'role': 'Flutter Developer',
      'company': 'Simplext Technology Solution',
      'period': '12/2024 - 12/2025',
      'description':
          'Worked in a team of 4 developers building cross-platform apps serving 5 millions+ users. Architected scalable solutions using clean architecture .',
    },
    {
      'role': 'Junior Flutter Developer',
      'company': 'Sigi Technologies',
      'period': '4/2023 - 11/2024',
      'description':
          'Developed 10+ production Flutter applications for clients across  and e-commerce sectors. Reduced app load time by 40%.',
    },
    {
      'role': 'Associate Mobile Developer',
      'company': 'Digitale',
      'period': '9/2022 - 3/2023',
      'description': 'Built and maintained hybrid mobile applications. ',
    },
    {
      'role': 'Intership',
      'company': 'DEVSINC',
      'period': '6/2022 - 8/2022',
      'description': 'Complete Training  ',
    },
  ];

  static const List<Map<String, String>> stats = [
    {'value': '15+', 'label': 'Projects Completed'},
    // {'value': '30+', 'label': 'Happy Clients'},
    {'value': '3+', 'label': 'Years Experience'},
    // {'value': '15+', 'label': 'Open Source Contributions'},
  ];
}
