import 'package:flutter/material.dart';

class ButtonText extends StatefulWidget {
  final String label;
  final Color colorText;
  final Color colorShadow;
  final Function onPressed;
  final double directionShadowX;
  final double directionShadowY;

  const ButtonText({
    Key key,
    @required this.label,
    this.colorText = Colors.white,
    this.colorShadow = Colors.black,
    @required this.onPressed,
    this.directionShadowX = 1.7,
    this.directionShadowY = 1.7,
  }) : super(key: key);
  @override
  _ButtonTextState createState() => _ButtonTextState();
}

class _ButtonTextState extends State<ButtonText> {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: widget.onPressed,
      textColor: Theme.of(context).hintColor,
      child: Text(
        widget.label,
        style: TextStyle(
          color: widget.colorText,
          shadows: <BoxShadow>[
            BoxShadow(
              color: widget.colorShadow,
              offset: Offset(widget.directionShadowX, widget.directionShadowY),
              blurRadius: 2.0,
            ),
          ],
        ),
      ),
    );
  }
}
