import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class HomeView extends StatelessWidget {
  HomeView({super.key});
  final List<Map<String, String>> appsList = [
    {
      "market": "Pakistan",
      "image": "assets/images/kfc_logo.png",
      "AppType": "Mobile Application",
      "url":
          "https://play.google.com/store/apps/details?id=io.bramerz.kfc&hl=en",
    },
    {
      "market": "Oman",
      "image": "assets/images/kfc_logo.png",
      "AppType": "Mobile Application",
      "url": "https://play.google.com/store/apps/details?id=com.kfc.oman",
    },
    {
      "market": "Morocco",
      "image": "assets/images/kfc_logo.png",
      "AppType": "Mobile Application",
      "url": "https://play.google.com/store/apps/details?id=com.kfc.morocco",
    },
    {
      "market": "Pakistan",
      "image": "assets/images/kfc_logo.png",
      "AppType": "KIOSK",
      "url": "",
    },
    {
      "market": "Pakistan",
      "image": "assets/images/pizza_hut.png",
      "AppType": "Mobile Application",
      "url":
          "https://play.google.com/store/apps/details?id=com.pizzahut.pakistan&hl=en",
    },
    {
      "market": "South Africa",
      "image": "assets/images/pizza_hut.png",
      "AppType": "Mobile Application",
      "url":
          "https://play.google.com/store/search?q=pizza%20hut%20south%20africa&c=apps&hl=en",
    },
    {
      "market": "Qatar",
      "image": "assets/images/pizza_hut.png",
      "AppType": "Mobile Application",
      "url":
          "https://play.google.com/store/search?q=pizza+hut+qatar&c=apps&hl=en",
    },

    {
      "market": "Pakistan",
      "image": "assets/images/pizza_hut.png",
      "AppType": "KIOSK",
      "url": "",
    },
    {
      "market": "Johnny & Jugnu",
      "image": "assets/images/j&j.jpg",
      "AppType": "KIOSK",
      "url": "",
    },
    {
      "market": "Trim",
      "image": "assets/images/trim.jpg",
      "AppType": "Salon App",
      "url": "https://apps.apple.com/us/app/trim-business/id6742323827",
    },
    {
      "market": "Trim",
      "image": "assets/images/trim.jpg",
      "AppType": "Client App",
      "url": "https://apps.apple.com/cz/app/trim/id6742999519",
    },
    {
      "market": "MyAce",
      "image": "assets/images/myace.jpg",
      "AppType": "Business App",
      "url":
          "https://play.google.com/store/apps/details?id=com.sigitechnologies.myaceupdated&hl=en",
    },
    {
      "market": "MyAce",
      "image": "assets/images/myace.jpg",
      "AppType": "Rider App",
      "url":
          "https://play.google.com/store/apps/details?id=com.sigitechnologies.myacedriverupdated&hl=en",
    },
  ];
  List<String> skills = [
    "Flutter",
    "Dart",
    "BLoC",
    "GetX",
    "Provider",
    "Firebase",
    "Hive",
    "REST API",
    "Maps",
    "Payments",
    "Cursor AI",
    "In App Purchases",
    "PlayStore",
    "AppStore",
    "Clean Architechure",
    "MVC",
    "MVVM",
    "Flutter Window and Mobile Applications Etc...",
  ];
  void openUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            100.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(1),
                  decoration: BoxDecoration(
                    //border: Border.all(color: Colors.black,width: 3,),
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                  child: Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15.r),
                      child: Image(
                        image: AssetImage("assets/images/p2.jpeg"),
                        height: 700.h,
                        width: 400.w,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                100.horizontalSpace,
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 20,
                  children: [
                    Text(
                      'Zeeshan Mehmood Sheikh ',
                      style: TextStyle(
                        fontSize: 40.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      'UET Lahore Session (2018-2022) ',
                      style: TextStyle(
                        fontSize: 40.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      'Flutter Developer',
                      style: TextStyle(
                        fontSize: 40.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      'Experience: 3+ Years',
                      style: TextStyle(
                        fontSize: 40.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      'Mobile Apps: 15+ Live Apps ',
                      style: TextStyle(
                        fontSize: 40.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      'Windows Apps: 3 ',
                      style: TextStyle(
                        fontSize: 40.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ],
            ),

            100.verticalSpace,
            Text(
              'Skills',
              style: TextStyle(
                fontSize: 40.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                decoration: TextDecoration.underline,
              ),
            ),
            100.verticalSpace,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 150.w),
              child: Wrap(
                spacing: 30.w, // horizontal space
                runSpacing: 30.h, // vertical space
                children: skills.map((skill) {
                  return Chip(
                    label: Text(
                      skill,
                      style: TextStyle(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                  );
                }).toList(),
              ),
            ),
            100.verticalSpace,
            Text(
              'Projects',
              style: TextStyle(
                fontSize: 40.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                decoration: TextDecoration.underline,
              ),
            ),
            50.verticalSpace,
            Text(
              'Tap On Mobile Apps for Download',
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                decoration: TextDecoration.underline,
              ),
            ),
            100.verticalSpace,

            GridView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount:
                    3, // 🔥 change based on screen (2 for mobile, 3–4 for web)
                crossAxisSpacing: 30.w,
                mainAxisSpacing: 30.h,
                childAspectRatio: 0.7, // adjust card height/width ratio
              ),
              physics: NeverScrollableScrollPhysics(),
              itemCount: appsList.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    if (index != 3 && index != 7 && index != 8) {
                      openUrl(appsList[index]['url'].toString());
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15.r),
                      border: Border.all(color: Colors.black, width: 1),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        30.verticalSpace,

                        // Image Box
                        Container(
                          height: 500.h,
                          width: double.infinity,
                          decoration: BoxDecoration(color: Colors.white),
                          child: Center(
                            child: Image.asset(
                              appsList[index]['image'].toString(),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),

                        30.verticalSpace,

                        Text(
                          appsList[index]['market'].toString(),
                          style: TextStyle(
                            fontSize: 28.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),

                        20.verticalSpace,

                        Text(
                          appsList[index]['AppType'].toString(),
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),

            100.verticalSpace,
            Text(
              'Project Built From Scratch',
              style: TextStyle(
                fontSize: 40.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                decoration: TextDecoration.underline,
              ),
            ),
            30.verticalSpace,
            Text(
              'KIOSK of  KFC,Pizza Hut,Johnny & Jugnu',
              style: TextStyle(
                fontSize: 30.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                decoration: TextDecoration.underline,
              ),
            ),
            50.verticalSpace,
            Text(
              '''In this project, I handled the complete order management for both takeaway and dine-in flows, seamlessly integrating the kiosk systems with MPOs and the CMS. I ensured robust, end-to-end functionality across all kiosk operations. The application was developed using BLoC with Clean Architecture and is now successfully live across multiple outlets in Pakistan, serving renowned brands such as KFC, Pizza Hut, and J&J.''',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            100.verticalSpace,
            Text(
              'Projects  Maintained',
              style: TextStyle(
                fontSize: 40.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                decoration: TextDecoration.underline,
              ),
            ),
            30.verticalSpace,
            Text(
              '''In this mobile application project, I managed complete order flows and implemented key business features across multiple markets. Reverse Calculation was implemented for KFC Pakistan, Lottery & Bonus features were added for Pizza Hut Qatar and other markets, and the PSL deal was successfully integrated in KFC Pakistan. The application was developed using BLoC with Clean Architecture, ensuring stable, end-to-end functionality across all operations.
   and many features and functionalities...''',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            100.verticalSpace,
            Text(
              'How To Approach Me',
              style: TextStyle(
                fontSize: 40.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                decoration: TextDecoration.underline,
              ),
            ),
            30.verticalSpace,
            Text(
              'zeeshansheikh921837@gmail.com',
              style: TextStyle(
                fontSize: 25.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                decoration: TextDecoration.underline,
              ),
            ),
            100.verticalSpace,
          ],
        ),
      ),
    );
  }
}
