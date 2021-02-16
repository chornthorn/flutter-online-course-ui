import 'package:e_learning_online_course/utils/colors.util.dart';
import 'package:fdottedline/fdottedline.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class PricingItemCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final Function onPressed;
  final String price;
  final Color selectedColor;
  final Color unselectedColor;
  final bool isSelected;

  PricingItemCard({
    Key key,
    this.title,
    this.subtitle,
    this.onPressed,
    this.price = '0',
    this.selectedColor = cSalmonMain,
    this.isSelected = false,
    this.unselectedColor = cSelectedBorder,
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
            margin: EdgeInsets.symmetric(vertical: 5),
            child: FDottedLine(
              color: isSelected ? selectedColor : unselectedColor,
              strokeWidth: 1.0,
              dottedLength: 5.0,
              space: isSelected ? 0 : 2.0,
              corner: FDottedLineCorner.all(12.0),
              child: Container(
                height: isPortrait ? mHeight * .11 : mHeight * .22,
                alignment: Alignment.center,
                padding: EdgeInsets.all(10),
                foregroundDecoration: isSelected ? BadgeDecoration(
                  badgeColor: cSalmonMain,
                  badgeSize: 35,
                  textSpan: TextSpan(
                    text: 'OK',
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ) : null,
                child: Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.only(left: 16, top: 5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  title,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: isSelected ? cSalmonMain : cHeadingText,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 8),
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
                          child: Text(
                            '\$$price',
                            style: TextStyle(
                              fontSize: 24,
                              color: cSalmonMain,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
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
    );
  }
}

class BadgeDecoration extends Decoration {
  final Color badgeColor;
  final double badgeSize;
  final TextSpan textSpan;

  const BadgeDecoration(
      {@required this.badgeColor,
      @required this.badgeSize,
      @required this.textSpan});

  @override
  BoxPainter createBoxPainter([onChanged]) =>
      _BadgePainter(badgeColor, badgeSize, textSpan);
}

class _BadgePainter extends BoxPainter {
  static const double BASELINE_SHIFT = 1;
  static const double CORNER_RADIUS = 4;
  final Color badgeColor;
  final double badgeSize;
  final TextSpan textSpan;

  _BadgePainter(this.badgeColor, this.badgeSize, this.textSpan);

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    canvas.save();
    canvas.translate(
        offset.dx + configuration.size.width - badgeSize, offset.dy);
    canvas.drawPath(buildBadgePath(), getBadgePaint());
    // draw text
    final hyp = math.sqrt(badgeSize * badgeSize + badgeSize * badgeSize);
    final textPainter = TextPainter(
        text: textSpan,
        textDirection: TextDirection.ltr,
        textAlign: TextAlign.center);
    textPainter.layout(minWidth: hyp, maxWidth: hyp);
    final halfHeight = textPainter.size.height / 2;
    final v = math.sqrt(halfHeight * halfHeight + halfHeight * halfHeight) +
        BASELINE_SHIFT;
    canvas.translate(v, -v);
    canvas.rotate(0.785398); // 45 degrees
    textPainter.paint(canvas, Offset.zero);
    canvas.restore();
  }

  Paint getBadgePaint() => Paint()
    ..isAntiAlias = true
    ..color = badgeColor;

  Path buildBadgePath() => Path.combine(
      PathOperation.difference,
      Path()
        ..addRRect(RRect.fromLTRBAndCorners(0, 0, badgeSize, badgeSize,
            topRight: Radius.circular(CORNER_RADIUS))),
      Path()
        ..lineTo(0, badgeSize)
        ..lineTo(badgeSize, badgeSize)
        ..close());
}
