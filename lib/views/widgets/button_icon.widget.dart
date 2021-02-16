import 'package:flutter/material.dart';

class ButtonIcon extends StatelessWidget {
  final IconData icon;
  final double opacity;
  final Function onPressed;

  ButtonIcon({
    Key key,
    this.icon,
    this.opacity = 0.3,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 50,
        width: 50,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(opacity),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(
          icon,
          size: 30,
          color: Colors.white,
        ),
      ),
    );
  }
}
