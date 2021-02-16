import 'package:e_learning_online_course/utils/colors.util.dart';
import 'package:e_learning_online_course/views/widgets/button_icon.widget.dart';
import 'package:e_learning_online_course/views/widgets/course_item_card.widget.dart';
import 'package:flutter/material.dart';

class CourseCategoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var mHeight = MediaQuery.of(context).size.height;
    var mWidth = MediaQuery.of(context).size.width;
    var isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: mHeight * .45,
              decoration: BoxDecoration(
                color: cCategory1BG,
              ),
            ),
            SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Align(
                          alignment: Alignment.topRight,
                          child: ButtonIcon(
                            icon: Icons.arrow_back,
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: ButtonIcon(
                            icon: Icons.menu,
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: mHeight,
              width: mWidth,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 40),
                    height: mHeight * .3,
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      isPortrait ? 'UI/UX\nCourses' : 'UI/UX Courses',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 25),
                    height: mHeight * .7,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(60)),
                    ),
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        Positioned(
                          top: 0,
                          child: Container(
                            height: 8,
                            width: 120,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                        Padding(
                          padding:  EdgeInsets.only(top: 20),
                          child: ListView(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 16),
                            children: [
                              CourseItemCard(
                                icon: 'assets/icons/adobe_xd.svg',
                                title: 'Adobe XD Prototyping',
                                subtitle: '10 hours, 19 lessons',
                                percentage: '25%',
                                playIcon: 'assets/icons/play_video_icon.svg',
                                colorBg: cAdobeXd,
                              ),
                              CourseItemCard(
                                icon: 'assets/icons/sketch_icon.svg',
                                title: 'Sketch shortcuts and tricks',
                                subtitle: '10 hours, 19 lessons',
                                percentage: '77%',
                                playIcon: 'assets/icons/play_video_icon.svg',
                                colorBg: cSketch,
                              ),
                              CourseItemCard(
                                icon: 'assets/icons/adobe_after_effect.svg',
                                title: 'UI Motion Design After Effects',
                                subtitle: '10 hours, 19 lessons',
                                percentage: '43%',
                                playIcon: 'assets/icons/play_video_icon.svg',
                                colorBg: cAdobeAF,
                              ),
                              CourseItemCard(
                                icon: 'assets/icons/adobe_ps.svg',
                                title: 'Adobe Photoshop Retouching',
                                subtitle: '10 hours, 19 lessons',
                                percentage: '78%',
                                playIcon: 'assets/icons/play_video_icon.svg',
                                colorBg: cAdobePS,
                              ),
                              CourseItemCard(
                                icon: 'assets/icons/adobe_xd.svg',
                                title: 'Adobe XD Prototyping',
                                subtitle: '10 hours, 19 lessons',
                                percentage: '25%',
                                playIcon: 'assets/icons/play_video_icon.svg',
                                colorBg: cAdobeXd,
                              ),
                              CourseItemCard(
                                icon: 'assets/icons/sketch_icon.svg',
                                title: 'Sketch shortcuts and tricks',
                                subtitle: '10 hours, 19 lessons',
                                percentage: '77%',
                                playIcon: 'assets/icons/play_video_icon.svg',
                                colorBg: cSketch,
                              ),
                              CourseItemCard(
                                icon: 'assets/icons/adobe_after_effect.svg',
                                title: 'UI Motion Design After Effects',
                                subtitle: '10 hours, 19 lessons',
                                percentage: '43%',
                                playIcon: 'assets/icons/play_video_icon.svg',
                                colorBg: cAdobeAF,
                              ),
                              CourseItemCard(
                                icon: 'assets/icons/adobe_ps.svg',
                                title: 'Adobe Photoshop Retouching',
                                subtitle: '10 hours, 19 lessons',
                                percentage: '78%',
                                playIcon: 'assets/icons/play_video_icon.svg',
                                colorBg: cAdobePS,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
