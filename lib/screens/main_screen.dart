import 'package:flutter/material.dart';
import 'package:porto/changables.dart';
import 'package:porto/screens/home_screen.dart';
import 'package:porto/utilities/appcolors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'dart:html' as html;

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    final sw = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: sw <= 600 ? showSmallNavBar() : showWideNavbar(),
      endDrawer: sw >= 600 ? null : showNavBar(),
      body: HomePage(),
    );
  }

  PreferredSizeWidget showWideNavbar() {
    return AppBar(
      // leading: Image.asset(
      //   'assets/I.png',
      //   width: 50,
      // ),

      toolbarHeight: 100,
      backgroundColor: AppColors.primaryColor,
      elevation: 0,
      toolbarTextStyle: TextStyle(fontSize: 12.sp),
      actions: [
        TextButton(
          onPressed: () async {
            await HomePageState.controller
                .scrollToIndex(0, preferPosition: AutoScrollPosition.begin);
            changables.changableCount.value += 1;
          },
          style: ButtonStyle(
            overlayColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
              return Colors.transparent;
            }),
            foregroundColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
              if (states.contains(MaterialState.hovered))
                return AppColors.hoverTextColor;
              return AppColors.greyTextColor;
            }),
          ),
          child: Row(
            children: [
              Text(
                'Home',
                style: TextStyle(
                    color: AppColors.hoverTextColor,
                    fontSize: 12.sp,
                    fontFamily: 'SFMono'),
              ),
            ],
          ),
        ),
        SizedBox(width: Adaptive.w(1)),
        TextButton(
          onPressed: () async {
            await HomePageState.controller
                .scrollToIndex(1, preferPosition: AutoScrollPosition.begin);
            changables.changableCount.value += 1;
          },
          style: ButtonStyle(
            overlayColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
              return Colors.transparent;
            }),
            foregroundColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
              if (states.contains(MaterialState.hovered))
                return AppColors.hoverTextColor;
              return AppColors.greyTextColor;
            }),
          ),
          child: Row(
            children: [
              Text(
                'About',
                style: TextStyle(
                    color: AppColors.hoverTextColor,
                    fontSize: 12.sp,
                    fontFamily: 'SFMono'),
              ),
            ],
          ),
        ),
        SizedBox(width: Adaptive.w(1)),
        TextButton(
          onPressed: () async {
            await HomePageState.controller
                .scrollToIndex(2, preferPosition: AutoScrollPosition.begin);
          },
          style: ButtonStyle(
            overlayColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
              return Colors.transparent;
            }),
            foregroundColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
              if (states.contains(MaterialState.hovered))
                return AppColors.hoverTextColor;
              return AppColors.greyTextColor;
            }),
          ),
          child: Row(
            children: [
              Text(
                'Experience',
                style: TextStyle(
                    color: AppColors.hoverTextColor,
                    fontSize: 12.sp,
                    fontFamily: 'SFMono'),
              ),
            ],
          ),
        ),
        SizedBox(width: Adaptive.w(1)),
        TextButton(
          onPressed: () async {
            await HomePageState.controller
                .scrollToIndex(3, preferPosition: AutoScrollPosition.begin);
          },
          style: ButtonStyle(
            overlayColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
              return Colors.transparent;
            }),
            foregroundColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
              if (states.contains(MaterialState.hovered))
                return AppColors.hoverTextColor;
              return AppColors.greyTextColor;
            }),
          ),
          child: Row(
            children: [
              Text(
                'Projects',
                style: TextStyle(
                    color: AppColors.hoverTextColor,
                    fontSize: 12.sp,
                    fontFamily: 'SFMono'),
              ),
            ],
          ),
        ),
        SizedBox(width: Adaptive.w(1)),
        TextButton(
          onPressed: () async {
            await HomePageState.controller
                .scrollToIndex(4, preferPosition: AutoScrollPosition.begin);
          },
          style: ButtonStyle(
            overlayColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
              return Colors.transparent;
            }),
            foregroundColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
              if (states.contains(MaterialState.hovered))
                return AppColors.hoverTextColor;
              return AppColors.greyTextColor;
            }),
          ),
          child: Row(
            children: [
              Text(
                'Contact',
                style: TextStyle(
                    color: AppColors.hoverTextColor,
                    fontSize: 12.sp,
                    fontFamily: 'SFMono'),
              ),
            ],
          ),
        ),
        SizedBox(
          width: Adaptive.w(5),
        ),
        // Padding(
        //   padding: const EdgeInsets.all(30.0),
        //   child: TextButton(
        //     onPressed: () {
        //       html.window.open("assets/resume.pdf", 'Resume');
        //     },
        //     style: ButtonStyle(
        //         side: MaterialStateProperty.all(BorderSide(
        //             style: BorderStyle.solid,
        //             color: AppColors.hoverTextColor,
        //             width: 1.0))),
        //     child: Padding(
        //       padding: const EdgeInsets.all(8.0),
        //       child: Text(
        //         'Resume',
        //         style: TextStyle(
        //             fontSize: 12,
        //             color: AppColors.hoverTextColor,
        //             fontFamily: 'SFMono'),
        //       ),
        //     ),
        //   ),
        // )
      ],
    );
  }

  PreferredSizeWidget showSmallNavBar() {
    return AppBar(
      backgroundColor: AppColors.primaryColor,
      elevation: 0,
      // title: Image.asset(
      //   'assets/I.png',
      //   width: 50,
      // ),
      toolbarHeight: 100,
    );
  }

  Widget showNavBar() {
    return Drawer(
      backgroundColor: AppColors.bgProgressTextColor.withOpacity(0.7),
      child: ListView(
        padding: const EdgeInsets.only(
          left: 8,
          top: 80,
        ),
        children: [
          ListTile(
            title: Padding(
              padding: EdgeInsets.only(
                top: Adaptive.h(5),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Home',
                    style: TextStyle(
                        color: AppColors.hoverTextColor,
                        fontSize: 18.sp,
                        fontFamily: 'SFMono'),
                  ),
                ],
              ),
            ),
            onTap: () async {
              Navigator.pop(context);
              await HomePageState.controller
                  .scrollToIndex(0, preferPosition: AutoScrollPosition.begin);
              changables.changableCount.value += 1;
            },
          ),
          ListTile(
            title: Padding(
              padding: EdgeInsets.only(
                top: Adaptive.h(5),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'About',
                    style: TextStyle(
                        color: AppColors.hoverTextColor,
                        fontSize: 18.sp,
                        fontFamily: 'SFMono'),
                  ),
                ],
              ),
            ),
            onTap: () async {
              Navigator.pop(context);
              await HomePageState.controller
                  .scrollToIndex(1, preferPosition: AutoScrollPosition.begin);
              changables.changableCount.value += 1;
            },
          ),
          ListTile(
            title: Padding(
              padding: EdgeInsets.only(
                top: Adaptive.h(5),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Experience',
                    style: TextStyle(
                        color: AppColors.hoverTextColor,
                        fontSize: 18.sp,
                        fontFamily: 'SFMono'),
                  ),
                ],
              ),
            ),
            onTap: () async {
              Navigator.pop(context);
              await HomePageState.controller
                  .scrollToIndex(2, preferPosition: AutoScrollPosition.begin);
            },
          ),
          ListTile(
            title: Padding(
              padding: EdgeInsets.only(
                top: Adaptive.h(5),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Projects',
                    style: TextStyle(
                        color: AppColors.hoverTextColor,
                        fontSize: 18.sp,
                        fontFamily: 'SFMono'),
                  ),
                ],
              ),
            ),
            onTap: () async {
              Navigator.pop(context);
              await HomePageState.controller
                  .scrollToIndex(3, preferPosition: AutoScrollPosition.begin);
            },
          ),
          ListTile(
            title: Padding(
              padding: EdgeInsets.only(
                top: Adaptive.h(5),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Contact',
                    style: TextStyle(
                        color: AppColors.hoverTextColor,
                        fontSize: 18.sp,
                        fontFamily: 'SFMono'),
                  ),
                ],
              ),
            ),
            onTap: () async {
              await HomePageState.controller
                  .scrollToIndex(4, preferPosition: AutoScrollPosition.begin);
              Navigator.pop(context);
            },
          ),
          // Padding(
          //   padding: EdgeInsets.only(
          //       top: Adaptive.h(5),
          //       left: Adaptive.w(15),
          //       right: Adaptive.w(15)),
          //   child: TextButton(
          //     onPressed: () {
          //       Navigator.pop(context);
          //     },
          //     style: ButtonStyle(
          //         side: MaterialStateProperty.all(BorderSide(
          //             style: BorderStyle.solid,
          //             color: AppColors.hoverTextColor,
          //             width: 1.0))),
          //     child: Padding(
          //       padding: const EdgeInsets.all(16.0),
          //       child: Text(
          //         'Resume',
          //         style: TextStyle(
          //             fontSize: 12,
          //             color: AppColors.hoverTextColor,
          //             fontFamily: 'SFMono'),
          //       ),
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }
}
