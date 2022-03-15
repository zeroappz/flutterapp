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
