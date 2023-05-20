import 'package:flutter/material.dart';
import 'package:porto/changables.dart';
import 'package:porto/utilities/appcolors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:percent_indicator/percent_indicator.dart';

class AboutScreen extends StatelessWidget {
  late final sw;
  AboutScreen({super.key});
  late String val;

  @override
  Widget build(BuildContext context) {
    sw = MediaQuery.of(context).size.width;
    return ValueListenableBuilder(
        valueListenable: changables.changableCount,
        builder: (context, value, _) {
          print("object");
          val = value.toString();
          return Padding(
            padding: EdgeInsets.only(
                left: Adaptive.w(5),
                right: Adaptive.w(5),
                bottom: Adaptive.w(20)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'About me',
                  style: TextStyle(
                      color: AppColors.hoverTextColor,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w700),
                ),
                Container(
                  color: AppColors.greyTextColor,
                  width: sw,
                  height: 2,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: IntrinsicHeight(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              // SizedBox(
                              //   height: Adaptive.w(3.5),
                              // ),
                              Container(
                                height:
                                    sw <= 900 ? Adaptive.h(15) : Adaptive.w(15),
                                width:
                                    sw <= 900 ? Adaptive.h(15) : Adaptive.w(15),
                                // decoration: BoxDecoration(
                                //   border: Border.all(
                                //     color: AppColors.greyTextColor,
                                //     width: 1.0,
                                //     style: BorderStyle.solid,
                                //   ),
                                // ),
                                child: Padding(
                                  padding: EdgeInsets.all(Adaptive.w(1)),
                                  child: Image.asset(
                                    'assets/profil.jpg',
                                    fit: BoxFit.fitWidth,
                                  ),
                                ),
                              ),
                              (sw) < 300 ? ShowSkills() : showNull(),
                            ]),
                        SizedBox(
                          width: Adaptive.w(8),
                        ),
                        Container(
                          width: Adaptive.w(35),
                          child: Text(
                            "Hello, and welcome to my web portfolio! My name is Imaduddin Abdul Karim, a final year Telecommunication Engineering student at Telkom University in Bandung, Indonesia. I possess excellent soft skills, such as a good attitude, dedication, creativity, and effective communication, which have helped me excel in various projects. Additionally, my strong work ethic and commitment to learning have earned me a current GPA of 3.64 out of 4. Through this web portfolio, I hope to showcase my skills and expertise in web development, mobile development, design, and various other related fields. Thank you for visiting, and please feel free to explore my work!",
                            style: TextStyle(
                                color: AppColors.greyTextColor,
                                fontWeight: FontWeight.w400,
                                fontSize: 14.sp),
                            textAlign: TextAlign.justify,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                (sw) >= 300 ? ShowSkills() : showNull(),
              ],
            ),
          );
        });
  }

  ShowSkills() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 20.sp),
          child: Text(
            'Skills',
            style: TextStyle(
                color: AppColors.hoverTextColor,
                fontSize: 18.sp,
                fontWeight: FontWeight.w700),
          ),
        ),
        ((sw) >= 300) ? showSkillsinRow() : showSkillsinColumn(),
      ],
    );
  }

  showNull() {
    return Container();
  }

  showSkillsinRow() {
    return Row(
      children: [
        Column(
          children: [
            skillbar(0.8, 'Flutter'),
            SizedBox(
              height: Adaptive.w(2),
            ),
            skillbar(0.9, 'Python'),
            SizedBox(
              height: Adaptive.w(2),
            ),
            skillbar(0.8, 'Machine Learning'),
          ],
        ),
        SizedBox(
          width: Adaptive.w(20),
        ),
        Column(
          children: [
            skillbar(0.8, 'Graphic Design'),
            SizedBox(
              height: Adaptive.w(2),
            ),
            skillbar(0.7, 'UI/UX'),
            SizedBox(
              height: Adaptive.w(2),
            ),
            skillbar(0.9, 'C/C++'),
          ],
        )
      ],
    );
  }

  showSkillsinColumn() {
    return Column(
      children: [
        skillbar(0.8, 'Flutter'),
        SizedBox(
          height: Adaptive.w(2),
        ),
        skillbar(0.9, 'Python'),
        SizedBox(
          height: Adaptive.w(2),
        ),
        skillbar(0.8, 'Machine Learning'),
        SizedBox(
          height: Adaptive.w(2),
        ),
        skillbar(0.8, 'Graphic Design'),
        SizedBox(
          height: Adaptive.w(2),
        ),
        skillbar(0.7, 'UI/UX'),
        SizedBox(
          height: Adaptive.w(2),
        ),
        skillbar(0.9, 'C/C++'),
      ],
    );
  }

  skillbar(double percentage, String titleText) {
    // print(changables.changableCount.value);
    print("jkhkjh");
    return Padding(
      padding: EdgeInsets.only(top: 7.sp),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            titleText,
            style: TextStyle(
                color: AppColors.greyTextColor,
                fontWeight: FontWeight.w400,
                fontSize: 14.sp),
          ),
          LinearPercentIndicator(
            key: Key(val),
            width: Adaptive.w(25),
            lineHeight: Adaptive.w(0.6),
            percent: percentage,
            animation: true,
            animationDuration: 2000,
            backgroundColor: AppColors.bgProgressTextColor,
            barRadius: Radius.circular(20.sp),
            progressColor: AppColors.hoverTextColor.withOpacity(0.7),
          ),
        ],
      ),
    );
  }
}
