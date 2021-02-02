import 'package:flutter/material.dart';

class ButtonAction extends StatefulWidget {
  final Color colorShadow;
  final Color colorButton;
  final String textButton;
  final double paddingHorizontal;
  final double paddingVertical;
  final Function onPressed;

  const ButtonAction({
    Key key,
    @required this.colorShadow,
    @required this.colorButton,
    @required this.textButton,
    this.paddingHorizontal = 40,
    this.paddingVertical = 20,
    @required this.onPressed,
  }) : super(key: key);
  @override
  _ButtonActionState createState() => _ButtonActionState();
}

class _ButtonActionState extends State<ButtonAction> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: widget.colorShadow,
            blurRadius: 40,
            offset: Offset(0, 15),
          ),
          BoxShadow(
            color: widget.colorShadow,
            blurRadius: 13,
            offset: Offset(0, 3),
          )
        ],
        borderRadius: BorderRadius.all(Radius.circular(100)),
      ),
      child: FlatButton(
        onPressed: widget.onPressed,
        padding: EdgeInsets.symmetric(
          horizontal: widget.paddingHorizontal,
          vertical: widget.paddingVertical,
        ),
        color: widget.colorButton,
        shape: StadiumBorder(),
        child: Text(
          widget.textButton,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
