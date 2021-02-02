import 'package:flutter/material.dart';

class Input extends StatefulWidget {
  final String label;
  final String msgErro;
  final Function onChange;
  final bool visiblePassord;
  final TextInputType typeText;
  final Widget suffixIcon;

  const Input({
    Key key,
    @required this.label,
    @required this.msgErro,
    @required this.onChange,
    this.visiblePassord = false,
    @required this.typeText,
    this.suffixIcon,
  }) : super(key: key);
  @override
  _InputState createState() => _InputState();
}

class _InputState extends State<Input> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 40,
        vertical: 20,
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(300.0),
            bottomLeft: Radius.circular(300.0),
            bottomRight: Radius.circular(300.0),
            topRight: Radius.circular(300.0),
          ),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 50, right: 5),
          child: TextFormField(
            onChanged: widget.onChange,
            textAlign: TextAlign.center,
            keyboardType: widget.typeText,
            obscureText: widget.visiblePassord,
            decoration: InputDecoration(
              errorText: widget.msgErro,
              contentPadding: EdgeInsets.symmetric(vertical: 12),
              hintText: widget.label,
              hintStyle: TextStyle(
                color: Colors.black45,
                fontSize: 21,
              ),
              suffixIcon: widget.suffixIcon,
              disabledBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              border: InputBorder.none,
              errorBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              focusedErrorBorder: InputBorder.none,
            ),
          ),
        ),
      ),
    );
  }
}
