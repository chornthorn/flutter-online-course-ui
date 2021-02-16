import 'package:e_learning_online_course/utils/colors.util.dart';
import 'package:flutter/material.dart';

class ButtonNavigation extends StatelessWidget {
  final String title;
  final Function onPressed;

  const ButtonNavigation({Key key, this.title, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(flex: 3),
          Text(
            title,
            style: TextStyle(
              color: cSalmonMain,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          Spacer(flex: 2),
          Icon(Icons.arrow_forward,color: cSalmonMain,),
          Spacer(flex: 1),
        ],
      ),
      color: Color(0xffFEF3F3),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}
