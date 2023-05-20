import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:porto/utilities/appcolors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:html' as html;

class ExperienceScreen extends StatefulWidget {
  final sw;
  const ExperienceScreen({super.key, this.sw});

  @override
  State<ExperienceScreen> createState() => _ExperienceScreenState();
}

class _ExperienceScreenState extends State<ExperienceScreen> {
  int id = 1;
  late Container adaptiveContainer;
  int index = 0;
  List exp_content = [
    [
      "Machine Learning Path",
      "@ Bangkit Academy led by Google, Tokopedia, Gojek, & Traveloka",
      "Feb 2022 - Aug 2022",
      "• Study in Machine Learning Path \n• TensorFlow Developer Certified \n• Built machine learning for classifying plant on a Capstone Project."
    ],
    [
      "Creative Manager and Research Assistant",
      "@ IMV Laboratory | Telkom University",
      "Jul 2022 - Present",
      "• Worked on Flutter and built applications for Web, IOS and Android \n• Depolyed the app on PlayStore and Appstore \n• Creative content manager for Social Media \n• Contributing in many Laboratory's project and research."
    ],
    [
      'Creative Manager and Practicum Assistant',
      '@ Basic Computing Laboratory | Telkom University',
      'May 2020 - Aug 2022',
      "• Creative Content Manager for Social Media \n• Teaches practicum on algorithms and programming in electrical, physics, biomedical and telecommunications engineering.",
    ],
  ];
  List hack_content = [
    [
      'https://www.credential.net/9a967f4b-ec94-4b83-9d87-0d7c1ade0263#gs.xihr8m',
      'TensorFlow Developer Certificate',
      'from TensorFlow Certificate Program',
      "This level one certificate exam tests a developers foundational knowledge of integrating machine learning into tools and applications. The certificate program requires an understanding of building TensorFlow models using Computer Vision, Convolutional Neural Networks, Natural Language Processing, and real-world image data and strategies."
    ],
    [
      'https://www.coursera.org/account/accomplishments/specialization/certificate/2NE3CNAM22YD',
      'Google IT Automation with Python',
      'from Coursera developed by Google',
      "This six-course certificate, developed by Google, is designed to provide IT professionals with in-demand skills  including Python, Git, and IT automation."
    ],
    [
      'https://courses.nvidia.com/certificates/8b1ad37ffb584639998275e14bdead76/',
      'Getting Started with Deep Learning',
      'from NVIDIA Deep Learning Institute',
      "Learn how deep learning works through hands-on exercises in computer vision and natural language processing. Train deep learning models from scratch, learning tools and tricks to achieve highly accurate results. Also learn to leverage freely available, state-of-the-art pre-trained models to save time and get your deep learning application up and running quickly."
    ],
    [
      'https://www.coursera.org/account/accomplishments/specialization/certificate/6EYVQ5CFAYDT',
      'Mathematics for Machine Learning',
      'from Coursera developed by Imperial College London',
      "A sequence of 3 courses on the prerequisite mathematics for applications in data science and machine learning. Successful participants learn how to represent data in a linear algebra context and manipulate these objects mathematically."
    ],
  ];

  @override
  void initState() {
    adaptiveContainer = setContainerContent(id);
    // selectedbtnContainer = defaultsmallContainer(Colors.green);
  }

  @override
  Widget build(BuildContext context) {
    adaptiveContainer = setContainerContent(id);

    // print(selectedbtnContainer);
    return Padding(
      padding: EdgeInsets.only(
          left: Adaptive.w(5), right: Adaptive.w(5), bottom: Adaptive.w(20)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          "Where I've Worked",
          style: TextStyle(
              color: AppColors.hoverTextColor,
              fontSize: 18.sp,
              fontWeight: FontWeight.w700),
        ),
        Container(
          color: AppColors.greyTextColor,
          width: widget.sw,
          height: 2,
        ),
        SizedBox(
          height: Adaptive.w(6),
        ),
        IntrinsicHeight(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(right: Adaptive.w(5)),
                child: Container(
                  width: Adaptive.w(15),
                  color: AppColors.primaryColor,
                  child: FieldButtons(),
                ),
              ),
              adaptiveContainer,
            ],
          ),
        )
      ]),
    );
  }

  FieldButtons() {
    return Column(
      children: [
        fieldbtnElement('Experiences', 1),
        fieldbtnElement('Certifications', 2),
        fieldbtnElement('Bootcamp', 3),
        fieldbtnElement('Volunteer', 4),
      ],
    );
  }

  fieldbtnElement(String text, int idss) {
    return IntrinsicHeight(
      child: Row(
        children: [
          selectedsmallContainer(
              id == idss ? AppColors.hoverTextColor : AppColors.darkgreyColor,
              id == idss ? Adaptive.w(0.15) : Adaptive.w(0.1)),
          Expanded(
            child: TextButton(
              style: TextButton.styleFrom(
                  backgroundColor: id == idss
                      ? AppColors.greyTextColor.withOpacity(0.08)
                      : Colors.transparent),
              onPressed: () {
                setState(() {
                  id = idss;
                  index = 0;
                  adaptiveContainer = setContainerContent(id);
                });
              },
              child: Padding(
                padding: EdgeInsets.all(12.sp),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(text,
                      style: TextStyle(
                          fontFamily: 'SFMono',
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w600,
                          color: id == idss
                              ? AppColors.hoverTextColor
                              : AppColors.darkgreyColor)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  setContainerContent(int id) {
    if (id == 1) {
      return internshipContainer();
    }
    if (id == 2) {
      return espContainer();
    }
    if (id == 3) {
      return profileContainer();
    }
    if (id == 4) {
      return volunteerContainer();
    }
  }

  // int getContainerLength(int id) {
  //   if (id == 1) {
  //     return 3;
  //   }
  //   if (id == 2) {
  //     return 1;
  //   }
  //   if (id == 3) {
  //     return 1;
  //   }
  //   if (id == 4) {
  //     return 1;
  //   } else {
  //     return 1;
  //   }
  // }

  profileContainer() {
    return Container(
        padding: EdgeInsets.all(10.sp),
        color: AppColors.primaryColor,
        width: Adaptive.w(30),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            'Artificial Intelligence Bootcamp',
            style: TextStyle(
                color: AppColors.greyTextColor,
                fontSize: 14.sp,
                fontWeight: FontWeight.bold),
          ),
          Text(
            '@ Indonesia AI Research Consortium (IARC)',
            style: TextStyle(
                color: AppColors.hoverTextColor,
                fontSize: 16.sp,
                fontWeight: FontWeight.bold),
          ),
          Text(
            '05 Jan 2023',
            style: TextStyle(
                color: AppColors.greyTextColor,
                fontSize: 12.sp,
                fontWeight: FontWeight.normal),
          ),
          SizedBox(
            height: Adaptive.w(3),
          ),
          Text(
              "• Study about Artificial Intelligence and how to implement in real life problem \n• Built Machine Learning to classifying trash.",
              style: TextStyle(
                  color: AppColors.greyTextColor,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.normal),
              textAlign: TextAlign.left),
        ]));
  }

  internshipContainer() {
    return Container(
      child: Column(
        children: [
          Container(
              padding: EdgeInsets.all(10.sp),
              color: AppColors.primaryColor,
              width: Adaptive.w(30),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(exp_content[index][0], //headText
                        style: TextStyle(
                            color: AppColors.greyTextColor,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500),
                        textAlign: TextAlign.left),
                    Text(exp_content[index][1], //subhead
                        style: TextStyle(
                            color: AppColors.hoverTextColor,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500),
                        textAlign: TextAlign.left),
                    Padding(
                      padding: EdgeInsets.only(top: Adaptive.h(1.5)),
                      child: Text(exp_content[index][2], //date
                          style: TextStyle(
                              color: AppColors.greyTextColor,
                              fontSize: 12.sp,
                              fontFamily: 'SFMono',
                              fontWeight: FontWeight.normal),
                          textAlign: TextAlign.left),
                    ),
                    SizedBox(
                      height: Adaptive.w(3),
                    ),
                    Text(exp_content[index][3], //content
                        style: TextStyle(
                            color: AppColors.greyTextColor,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.normal),
                        textAlign: TextAlign.left),
                  ])),
          if (exp_content.length > 1)
            Row(
              children: [
                TextButton(
                    onPressed: () {
                      setState(() {
                        if (index != 0) index--;
                      });
                    },
                    child: Icon(Icons.arrow_back_rounded,
                        color: index != 0
                            ? AppColors.darkgreyColor
                            : AppColors.greyTextColor)),
                TextButton(
                    onPressed: () {
                      setState(() {
                        if (index + 1 != exp_content.length) index++;
                      });
                    },
                    child: Icon(
                      Icons.arrow_forward_rounded,
                      color: index + 1 != exp_content.length
                          ? AppColors.darkgreyColor
                          : AppColors.greyTextColor,
                    )),
              ],
            ),
        ],
      ),
    );
  }

  espContainer() {
    return Container(
      child: Column(
        children: [
          Container(
              padding: EdgeInsets.all(10.sp),
              color: AppColors.primaryColor,
              width: Adaptive.w(30),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(hack_content[index][1],
                        style: TextStyle(
                            color: AppColors.hoverTextColor,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.left),
                    Text(hack_content[index][2],
                        style: TextStyle(
                            color: AppColors.greyTextColor,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.normal),
                        textAlign: TextAlign.left),
                    SizedBox(
                      height: Adaptive.w(2),
                    ),
                    Text(hack_content[index][3],
                        style: TextStyle(
                            color: AppColors.greyTextColor,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.normal),
                        textAlign: TextAlign.justify),
                    SizedBox(
                      height: Adaptive.w(1),
                    ),
                    TextButton(
                      onPressed: () {
                        html.window.open(hack_content[index][0], "Credential");
                      },
                      child: Text('Show Credential',
                          style: TextStyle(
                              color: AppColors.hoverTextColor,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.left),
                    ),
                  ])),
          if (hack_content.length > 1)
            Row(
              children: [
                TextButton(
                    onPressed: () {
                      setState(() {
                        if (index != 0) index--;
                      });
                    },
                    child: Icon(Icons.arrow_back_rounded,
                        color: index != 0
                            ? AppColors.darkgreyColor
                            : AppColors.greyTextColor)),
                TextButton(
                    onPressed: () {
                      setState(() {
                        if (index + 1 != hack_content.length) index++;
                      });
                    },
                    child: Icon(
                      Icons.arrow_forward_rounded,
                      color: index + 1 != hack_content.length
                          ? AppColors.darkgreyColor
                          : AppColors.greyTextColor,
                    )),
              ],
            ),
        ],
      ),
    );
  }

  volunteerContainer() {
    return Container(
        padding: EdgeInsets.all(10.sp),
        color: AppColors.primaryColor,
        width: Adaptive.w(30),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            'Content Creative',
            style: TextStyle(
                color: AppColors.greyTextColor,
                fontSize: 14.sp,
                fontWeight: FontWeight.bold),
          ),
          Text(
            '@ Samalowa Telkom University',
            style: TextStyle(
                color: AppColors.hoverTextColor,
                fontSize: 16.sp,
                fontWeight: FontWeight.bold),
          ),
          Text(
            'Aug 2019 - June 2020',
            style: TextStyle(
                color: AppColors.greyTextColor,
                fontSize: 12.sp,
                fontWeight: FontWeight.normal),
          ),
          SizedBox(
            height: Adaptive.w(3),
          ),
          Text(
              "• Created and managed campaigns to spread the word about their mission \n• Developed content for social media platforms \n• Used skills for a meaningful cause and made a positive impact.",
              style: TextStyle(
                  color: AppColors.greyTextColor,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.normal),
              textAlign: TextAlign.left),
        ]));
  }

  selectedsmallContainer(Color color, double contWidth) {
    return Container(
      width: contWidth,
      color: color,
    );
  }

  defaultsmallContainer(Color color, double contWidth) {
    return Container(
      width: contWidth,
      color: color,
    );
  }
}
