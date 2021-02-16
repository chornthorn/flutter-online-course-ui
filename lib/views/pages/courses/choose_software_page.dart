import 'package:e_learning_online_course/utils/colors.util.dart';
import 'package:e_learning_online_course/views/pages/courses/pricing_page.dart';
import 'package:e_learning_online_course/views/widgets/button_icon.widget.dart';
import 'package:e_learning_online_course/views/widgets/button_navigation.widget.dart';
import 'package:e_learning_online_course/views/widgets/course_category_card.widget.dart';
import 'package:flutter/material.dart';

class ChooseSoftwarePage extends StatelessWidget {
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
                      isPortrait
                          ? 'Choose what\nto learn'
                          : 'Choose what to learn',
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
                          padding: EdgeInsets.only(top: 20,bottom: 35),
                          child: ListView(
                            padding: EdgeInsets.symmetric(
                                horizontal: 0, vertical: 16),
                            children: [
                              CourseCategoryCard(
                                icon: 'assets/icons/adobe_xd_2.svg',
                                title: 'Adobe XD',
                                subtitle: '90 Courses',
                                iconRight: 'assets/icons/selected_icon.svg',
                                colorBg: cAdobeXd,
                              ),
                              CourseCategoryCard(
                                icon: 'assets/icons/sketch_2.svg',
                                title: 'Sketch',
                                subtitle: '99 Courses',
                                iconRight: 'assets/icons/unselected_icon.svg',
                                colorBg: cSketch,
                              ),
                              CourseCategoryCard(
                                icon: 'assets/icons/adobe_ef_2.svg',
                                title: 'After Effects',
                                subtitle: '12 Courses',
                                iconRight: 'assets/icons/unselected_icon.svg',
                                colorBg: cSketch,
                              ),
                              CourseCategoryCard(
                                icon: 'assets/icons/figma_2.svg',
                                title: 'Figma',
                                subtitle: '9 Courses',
                                iconRight: 'assets/icons/selected_icon.svg',
                                colorBg: cSketch,
                              ),
                              CourseCategoryCard(
                                icon: 'assets/icons/adobe_photoshop_2.svg',
                                title: 'Adobe Photoshop',
                                subtitle: '20 Courses',
                                iconRight: 'assets/icons/unselected_icon.svg',
                                colorBg: cSketch,
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
      bottomNavigationBar: Container(
        height: 70,
        padding: EdgeInsets.only(right: 22,left: 22,bottom: 16),
        color: Colors.white,
        child: ButtonNavigation(
          onPressed: (){
            MaterialPageRoute route = MaterialPageRoute(
                builder: (_) => PricingPage());
            Navigator.push(context, route);
          },
          title: 'Continue with 2',
        ),
      ),
    );
  }
}
