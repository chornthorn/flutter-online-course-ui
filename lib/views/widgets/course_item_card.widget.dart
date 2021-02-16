import 'package:e_learning_online_course/utils/colors.util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CourseItemCard extends StatelessWidget {
  final String icon;
  final String title;
  final String subtitle;
  final String percentage;
  final String playIcon;
  final Color colorBg;
  final Function onPressed;

  const CourseItemCard({
    Key key,
    this.icon,
    this.title,
    this.subtitle,
    this.percentage,
    this.playIcon,
    this.colorBg,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mHeight = MediaQuery.of(context).size.height;
    var mWidth = MediaQuery.of(context).size.width;
    var isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: isPortrait ? mHeight * .12 : mHeight * .22,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: colorBg,
          borderRadius: BorderRadius.circular(32),
        ),
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.symmetric(vertical: 5),
        child: Align(
          alignment: Alignment.center,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  child: SvgPicture.asset(icon),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(left: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: cHeadingText,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          subtitle,
                          style: TextStyle(
                            color: cSalmonMain,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  child: Row(
                    children: [
                      Text(
                        percentage,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: cHeadingText,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: SvgPicture.asset(playIcon),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
