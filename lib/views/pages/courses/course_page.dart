import 'package:e_learning_online_course/utils/colors.util.dart';
import 'package:e_learning_online_course/views/pages/courses/pricing_page.dart';
import 'package:e_learning_online_course/views/widgets/button_icon.widget.dart';
import 'package:e_learning_online_course/views/widgets/button_navigation.widget.dart';
import 'package:e_learning_online_course/views/widgets/course_category_card.widget.dart';
import 'package:e_learning_online_course/views/widgets/curriculum.widget.dart';
import 'package:fdottedline/fdottedline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fsuper/fsuper.dart';

import 'video_lesson_page.dart';

class CoursePage extends StatelessWidget {

  final List _listCurriculum = [
    {
      "no": "1",
      "title": "Introduction",
      "subtitle": "2 hours 20 minutes",
      "percentage": '25%'
    },
    {
      "no": "2",
      "title": "Design Tools",
      "subtitle": "2 hours 20 minutes",
      "percentage": '25%'
    },
    {
      "no": "3",
      "title": "Prototyping Tools",
      "subtitle": "2 hours 20 minutes",
      "percentage": '25%'
    },
    {
      "no": "4",
      "title": "Summary & Exercise",
      "subtitle": "1 hours 20 minutes",
      "percentage": '25%'
    },
    {
      "no": "5",
      "title": "Conclusion",
      "subtitle": "1 hours 20 minutes",
      "percentage": '25%'
    },
    {
      "no": "6",
      "title": "Finished!",
      "subtitle": "30 minutes",
      "percentage": '25%'
    }
  ];
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
              height: isPortrait ? mHeight * .45 : mHeight * .8,
              decoration: BoxDecoration(
                color: cCourseBG,
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
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 40),
                    height: isPortrait ?mHeight * .3 : mHeight * .5,
                    alignment: Alignment.bottomCenter,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          child: SvgPicture.asset('assets/icons/adobe_xd_2.svg'),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: Text(
                            isPortrait
                                ? 'Adobe XD\nEssentials'
                                : 'Adobe XD Essentials',
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.w900,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 25),
                    height: isPortrait ? mHeight * .7 : mHeight * .5,
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
                          padding: EdgeInsets.only(top: 20,bottom: 0),
                          child: SafeArea(
                            top: false,
                            child: ListView.builder(
                              itemCount: _listCurriculum.length +1,
                              padding: EdgeInsets.zero,
                              itemBuilder: (context,int index) {
                                if(index == 0 ){
                                  return CourseCategoryCard(
                                    icon: 'assets/icons/adobe_xd_2.svg',
                                    title: 'Bong Thorn',
                                    subtitle: 'Author, Flutter Developer',
                                    iconRight: 'assets/icons/arrow_forward_icon.svg',
                                    colorBg: cAdobeXd,
                                  );
                                }
                                final data = _listCurriculum[index-1];
                                return CurriculumItemCard(
                                  no: data['no'],
                                  title: data['title'],
                                  subtitle: data['subtitle'],
                                  iconRight: 'assets/icons/play_video_icon.svg',
                                  percentage: data['percentage'],
                                  isLastOne: _listCurriculum.length == index ? true : false,
                                  onPressed: (){
                                    MaterialPageRoute route = MaterialPageRoute(
                                        builder: (_) => VideoLessonPage());
                                    Navigator.push(context, route);
                                  },
                                );
                              },
                            ),
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
      bottomNavigationBar: Container(
        height: 70,
        padding: EdgeInsets.only(right: 22,left: 22,bottom: 16),
        color: Colors.white,
        child: ButtonNavigation(
          onPressed: (){
            MaterialPageRoute route = MaterialPageRoute(
                builder: (_) => VideoLessonPage());
            Navigator.push(context, route);
          },
          title: 'Resume last lesson',
        ),
      ),
    );
  }
}
