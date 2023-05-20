import 'package:flutter/material.dart';
import 'package:porto/changables.dart';
import 'package:porto/screens/about_screen.dart';
import 'package:porto/screens/contact_screen.dart';
import 'package:porto/screens/experience_screen.dart';
import 'package:porto/screens/projects_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:porto/utilities/appcolors.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'dart:html' as html;
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  static late AutoScrollController controller;

  @override
  void initState() {
    super.initState();
    controller = AutoScrollController(
        viewportBoundaryGetter: () =>
            Rect.fromLTRB(0, 0, 0, MediaQuery.of(context).padding.bottom),
        axis: Axis.vertical);
  }

  @override
  Widget build(BuildContext context) {
    final sh = MediaQuery.of(context).size.height;
    return ValueListenableBuilder(
        valueListenable: changables.changableCount,
        builder: (context, value, _) {
          return Row(
            children: [
              Expanded(
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {
                          html.window.open(
                              'https://www.linkedin.com/in/imaduddin-abdul-karim-0b79b6228',
                              'LinkedIn');
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width >
                                  MediaQuery.of(context).size.height
                              ? Adaptive.w(2)
                              : Adaptive.h(3),
                          child: FittedBox(
                            child: FaIcon(
                              FontAwesomeIcons.linkedin,
                              color: AppColors.hoverTextColor,
                            ),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      SizedBox(height: Adaptive.h(2)),
                      InkWell(
                        onTap: () {
                          html.window
                              .open('https://github.com/imadaka19', 'Github');
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width >
                                  MediaQuery.of(context).size.height
                              ? Adaptive.w(2)
                              : Adaptive.h(3),
                          child: FittedBox(
                            child: FaIcon(
                              FontAwesomeIcons.github,
                              color: AppColors.hoverTextColor,
                            ),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      SizedBox(height: Adaptive.h(2)),
                      InkWell(
                        onTap: () {
                          html.window.open(
                              'https://www.instagram.com/imad.aka/',
                              'instagram');
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width >
                                  MediaQuery.of(context).size.height
                              ? Adaptive.w(2)
                              : Adaptive.h(3),
                          child: FittedBox(
                            child: FaIcon(
                              FontAwesomeIcons.instagram,
                              color: AppColors.hoverTextColor,
                            ),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      // SizedBox(height: Adaptive.h(2)),
                      // InkWell(
                      //   onTap: () {},
                      //   child: Container(
                      //     width: MediaQuery.of(context).size.width >
                      //             MediaQuery.of(context).size.height
                      //         ? Adaptive.w(2)
                      //         : Adaptive.h(3),
                      //     child: Image.asset(
                      //       'assets/behance.png',
                      //       color: AppColors.hoverTextColor,
                      //       fit: BoxFit.fill,
                      //     ),
                      //   ),
                      // ),
                      SizedBox(height: Adaptive.h(2)),
                      InkWell(
                        onTap: () {
                          html.window
                              .open('https://wa.me/6281246623828', 'WhatsApp');
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width >
                                  MediaQuery.of(context).size.height
                              ? Adaptive.w(2)
                              : Adaptive.h(3),
                          child: FittedBox(
                            child: FaIcon(
                              FontAwesomeIcons.whatsapp,
                              color: AppColors.hoverTextColor,
                            ),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      SizedBox(height: Adaptive.h(2)),
                      Container(
                        width: 1,
                        height: MediaQuery.of(context).size.height / 4,
                        color: AppColors.hoverTextColor,
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 9,
                child: ListView(
                  scrollDirection: Axis.vertical,
                  controller: controller,
                  children: <Widget>[
                    ...List.generate(5, (index) {
                      return AutoScrollTag(
                        key: ValueKey(index),
                        controller: controller,
                        index: index,
                        child: getScrollItem(index),
                        highlightColor: Colors.black.withOpacity(0.1),
                      );
                    }),
                  ],
                ),
              ),
              Expanded(
                  child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () async {
                        var url = Uri.parse("mailto:imadaka19@gmail.com");
                        if (await canLaunchUrl(url)) {
                          await launchUrl(url);
                        } else {
                          throw 'Could not launch ';
                        }
                      },
                      child: RotatedBox(
                        quarterTurns: 1,
                        child: Text(
                          'imadaka19@gmail.com',
                          style: TextStyle(
                              color: AppColors.hoverTextColor,
                              fontSize: 16.sp,
                              fontFamily: 'SFMono',
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    SizedBox(height: Adaptive.h(2)),
                    Container(
                      width: 1,
                      height: Adaptive.h(10),
                      color: AppColors.hoverTextColor,
                    )
                  ],
                ),
              ))
            ],
          );
        });
  }

  HomeContent() {
    return Padding(
      padding: EdgeInsets.only(
          left: Adaptive.w(5),
          right: Adaptive.w(5),
          top: Adaptive.h(10),
          bottom: Adaptive.w(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Hello there!",
            style: TextStyle(
                color: AppColors.darkgreyColor,
                fontFamily: 'SFMono',
                fontWeight: FontWeight.w400,
                fontSize: 12.sp),
          ),
          SizedBox(
            height: Adaptive.h(2),
          ),
          Text(
            'Welcome to',
            style: TextStyle(
                color: AppColors.hoverTextColor,
                fontFamily: 'Calibre',
                fontWeight: FontWeight.w600,
                fontSize: 25.sp),
          ),
          Text(
            'Imaduddin Abdul Karim\'s Portofolio',
            style: TextStyle(
                color: AppColors.darkgreyColor,
                fontFamily: 'Calibre',
                fontWeight: FontWeight.w600,
                fontSize: 25.sp),
          ),
          Padding(
            padding: EdgeInsets.only(top: Adaptive.w(3)),
            child: Text(
              "An 8-semester Telecommunication Engineering student from Telkom University with a wide interest and passion for technology and programming who enjoys taking on new projects and facing new challenges. Previous experience in laboratory organizations has given me good time management, leadership and communication skills. I love learning new things, especially in the areas of mobile development, artificial intelligence and data science. In addition, I have experience in the field of graphic design.",
              style: TextStyle(
                  color: AppColors.greyTextColor,
                  fontFamily: 'Calibre',
                  fontWeight: FontWeight.w400,
                  fontSize: 14.sp),
              textAlign: TextAlign.justify,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: Adaptive.w(5)),
            child: TextButton(
                onPressed: () {
                  html.window.open("assets/resume.pdf", 'Resume');
                },
                style: ButtonStyle(
                    side: MaterialStateProperty.all(BorderSide(
                        style: BorderStyle.solid,
                        color: AppColors.hoverTextColor,
                        width: 1.0))),
                child: Padding(
                  padding: EdgeInsets.all(15.sp),
                  child: Text(
                    'My Resume',
                    style: TextStyle(
                        fontSize: 12.sp,
                        color: AppColors.hoverTextColor,
                        fontFamily: 'SFMono',
                        fontWeight: FontWeight.w200),
                  ),
                )),
          )
        ],
      ),
    );
  }

  getScrollItem(int index) {
    print(changables.changableCount.value);
    switch (index) {
      case 0:
        return Container(
          color: AppColors.primaryColor,
          child: HomeContent(),
        );
      case 1:
        return Container(
          color: AppColors.primaryColor,
          child: AboutScreen(),
        );

      case 2:
        return Container(
          color: AppColors.primaryColor,
          child: ExperienceScreen(sw: MediaQuery.of(context).size.width),
        );
      case 3:
        return Container(
          color: AppColors.primaryColor,
          child: ProjectsScreen(),
        );
      case 4:
        return Container(
          color: AppColors.primaryColor,
          child: ConatactScreen(),
        );
    }
  }
}
//we acn make widget list for multiple containers with single btn
//and add them to for loop within the length for their particular widgetlist
//then also show bottom dot or next btn to move if length associated is greater than 1
//can also add slide to next

//image add border dotted
