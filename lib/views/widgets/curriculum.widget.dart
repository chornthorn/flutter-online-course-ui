import 'package:e_learning_online_course/utils/colors.util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:flutter_svg/svg.dart';

class CurriculumItemCard extends StatelessWidget {
  final String no;
  final String title;
  final String subtitle;
  final String percentage;
  final String iconRight;
  final Color colorBg;
  final Function onPressed;
  final bool isLastOne;

  const CurriculumItemCard({
    Key key,
    this.no,
    this.title,
    this.subtitle,
    this.iconRight,
    this.colorBg,
    this.onPressed,
    this.percentage,
    this.isLastOne = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mHeight = MediaQuery.of(context).size.height;
    var mWidth = MediaQuery.of(context).size.width;
    var isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    return InkWell(
      onTap: onPressed,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: isPortrait ? mHeight * .09 : mHeight * .22,
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(horizontal: 10),
            //margin: EdgeInsets.symmetric(vertical: 5),
            child: Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: 30,
                      width: 30,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: cSalmonMain.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        no,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(left: 16, top: 0),
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
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 5),
                              child: Text(
                                subtitle,
                                style: TextStyle(
                                  color: cSalmonMain,
                                  fontWeight: FontWeight.w200,
                                ),
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
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              color: cHeadingText,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: SvgPicture.asset(iconRight),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          !isLastOne ?Padding(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Dash(
                direction: Axis.vertical,
                length: 25,
                dashLength: 5,
                //thickness:3.0,
                dashColor: Colors.grey[400],
              ),
            ),
          ) : Container(),
        ],
      ),
    );
  }
}
