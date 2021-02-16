import 'package:e_learning_online_course/utils/colors.util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class VisaItemCard extends StatelessWidget {
  final String icon;
  final String title;
  final String subtitle;
  final String iconRight;
  final Color colorBg;
  final Function onPressed;

  const VisaItemCard({
    Key key,
    this.icon,
    this.title,
    this.subtitle,
    this.iconRight,
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
      child: Column(
        children: [
          Container(
            height: isPortrait ? mHeight * .05 : mHeight * .10,
            alignment: Alignment.center,
            padding: EdgeInsets.all(0),
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
                              padding: EdgeInsets.symmetric(vertical: 0),
                              child: Text(
                                subtitle,
                                style: TextStyle(
                                  color: cSalmonMain,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      child: SvgPicture.asset(iconRight),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Divider(),
          ),
        ],
      ),
    );
  }
}
