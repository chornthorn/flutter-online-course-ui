import 'package:e_learning_online_course/utils/colors.util.dart';
import 'package:e_learning_online_course/views/pages/courses/choose_software_page.dart';
import 'package:e_learning_online_course/views/pages/courses/course_category_page.dart';
import 'package:e_learning_online_course/views/pages/courses/course_page.dart';
import 'package:e_learning_online_course/views/widgets/button_icon.widget.dart';
import 'package:e_learning_online_course/views/widgets/course_item_card.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                color: cSalmonMain,
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(60),
                ),
              ),
            ),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: Align(
                        alignment: Alignment.topRight,
                        child: ButtonIcon(icon: Icons.menu,onPressed: (){},),
                      ),
                    ),
                    SizedBox(height: mHeight * .03),
                    Container(
                      alignment: Alignment.center,
                      child: Text(
                        'Welcome back!\nBong Thorn',
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 28,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                      margin: EdgeInsets.symmetric(vertical: 30),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(18),
                        border: Border.all(width: 1,color: Colors.white.withOpacity(0.9)),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            icon: SvgPicture.asset('assets/icons/search.svg'),
                            hintText: 'Search for new knowledge!'),
                      ),
                    ),
                    Container(
                      height: isPortrait ? mHeight * .15 : mHeight * .35,
                      decoration: BoxDecoration(
                        color: cCategoryBG,
                        borderRadius: BorderRadius.circular(39),
                      ),
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Start learning new Staff!',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: cHeadingText,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Expanded(
                                  child: InkWell(
                                    splashColor: cAdobeAF,
                                    onTap: () {
                                      MaterialPageRoute route = MaterialPageRoute(
                                          builder: (_) => CourseCategoryPage());
                                      Navigator.push(context, route);
                                    },
                                    child: Container(
                                      height: 45,
                                      width: mWidth * .4,
                                      alignment: Alignment.center,
                                      margin: EdgeInsets.symmetric(vertical: 10),
                                      decoration: BoxDecoration(
                                          color: cSalmonMain,
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                      child: Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 16),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                'Categories',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                              Spacer(),
                                              Icon(
                                                Icons.arrow_forward,
                                                color: Colors.white,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Expanded(
                              child: Container(
                                child: SvgPicture.asset(
                                    'assets/images/people_reading_book.svg'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 16, horizontal: 10),
                      child: Text(
                        'Courses in progress',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: cHeadingText,
                        ),
                      ),
                    ),
                    CourseItemCard(
                      icon: 'assets/icons/adobe_xd.svg',
                      title: 'Adobe XD Prototyping',
                      subtitle: '10 hours, 19 lessons',
                      percentage: '25%',
                      playIcon: 'assets/icons/play_video_icon.svg',
                      colorBg: cAdobeXd,
                      onPressed: () {
                        MaterialPageRoute route = MaterialPageRoute(
                            builder: (_) => CoursePage());
                        Navigator.push(context, route);
                      },
                    ),
                    CourseItemCard(
                      icon: 'assets/icons/sketch_icon.svg',
                      title: 'Sketch shortcuts and tricks',
                      subtitle: '10 hours, 19 lessons',
                      percentage: '77%',
                      playIcon: 'assets/icons/play_video_icon.svg',
                      colorBg: cSketch,
                      onPressed: () {
                        MaterialPageRoute route = MaterialPageRoute(
                            builder: (_) => ChooseSoftwarePage());
                        Navigator.push(context, route);
                      },
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
            ),
          ],
        ),
      ),
    );
  }
}
