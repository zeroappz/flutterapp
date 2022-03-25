import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class GlobalWidget {
  // Global Alert Dialog Box
  AlertDialog showAlertDialog(
      String title, String content, BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: [
        TextButton(
          child: const Text(
            'OK',
            style: TextStyle(color: Colors.white),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateColor.resolveWith(
              (Set<MaterialState> states) {
                return states.contains(MaterialState.selected)
                    ? Colors.redAccent
                    : Colors.red;
              },
            ),
          ),
        ),
        // TextButton(
        //   child: const Text('Cancel'),
        //   onPressed: () {
        //     Navigator.of(context).pop();
        //   },
        // ),
      ],
    );
  }

  // Box Decoration
  BoxDecoration buttonDecoration(BuildContext context,
      [String primary = "", String secondary = ""]) {
    return BoxDecoration(
      color: primary.isNotEmpty
          ? HexColor(primary)
          : Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(12),
      boxShadow: [
        BoxShadow(
          color: secondary.isNotEmpty ? HexColor(secondary) : Colors.grey,
          // if(true) ? truth_value : false_value
          blurRadius: 10,
          offset: const Offset(0, 10),
        ),
      ],
    );
  }
}



class FullScreenImageView extends StatelessWidget {
  final String imageUrl;
  final String heroTag;

  const FullScreenImageView(this.imageUrl, this.heroTag);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body:  GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Center(child: Hero(
            tag: heroTag,
            child: Image.network(
              imageUrl,
              fit: BoxFit.contain,
              width: MediaQuery.of(context).size.width,
            ),
          ),
        ),
      ),
    );
  }
}




class SizeConfig {
  static MediaQueryData? _mediaQueryData;
  static double? screenW;
  static double? screenH;
  static double? blockH;
  static double? blockV;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenW = _mediaQueryData!.size.width;
    screenH = _mediaQueryData!.size.height;
    blockH = screenW! / 100;
    blockV = screenH! / 100;
  }
}
