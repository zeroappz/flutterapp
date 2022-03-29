import 'dart:math';

// import 'package:dealsapp/commonwidget/global_widget.dart';
import 'package:dealsapp/values/values.dart';
import 'package:flutter/material.dart';

class CardGestureWidget extends StatefulWidget {
  const CardGestureWidget({Key? key}) : super(key: key);

  @override
  State<CardGestureWidget> createState() => _CardGestureWidgetState();
}

class _CardGestureWidgetState extends State<CardGestureWidget> {
  Color _color = Colors.redAccent;
  var _scaleFactor = 0.5;
  var _baseScaleFactor = 0.5;
  bool makeCircular = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: GestureDetector(
          // onDoubleTap: () {}
          onDoubleTap: () {
            setState(() {
              _color =
                  Colors.primaries[Random().nextInt(Colors.primaries.length)];
            });
          },

          // Long Press action for a card
          onLongPress: () {
            // GlobalWidget()
            //     .showAlertDialog("Color code: $_color", "Tap", context);
            setState(() {
              makeCircular = !makeCircular;
            });
          },

          // onScaleEnd,
          onScaleEnd: (details) {
            // it is returning to its original state
            _baseScaleFactor = _scaleFactor;
          },
          // onScaleUpdate

          onScaleUpdate: (details) {
            setState(() {
              _scaleFactor = _baseScaleFactor * details.scale;
            });
          },

          child: Transform.scale(
            scale: _scaleFactor,
            child: Card(
              color: _color,
              child: const Image(
                image: NetworkImage(
                    "https://images.pexels.com/photos/67636/rose-blue-flower-rose-blooms-67636.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260"),
                height: 200.0,
                fit: BoxFit.cover,
              ),
              shape: makeCircular == true
                  ? CircleBorder(side: BorderSide(color: _color, width: 2.0))
                  : RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(Sizes.radius_8),
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
