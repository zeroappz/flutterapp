import 'package:dealsapp/values/values.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'dart:math';

class GlobalWidget {
  // Global Alert Dialog Box

  Random random = new Random();

  Color _getColor() {
    return Color.fromARGB(
      255,
      random.nextInt(255),
      random.nextInt(255),
      random.nextInt(255),
    );
  }

  final List<IconData> _iconList = [
    Icons.add,
    Icons.add_circle,
    Icons.add_circle_outline,
    Icons.add_comment,
    Icons.add_location,
    Icons.add_photo_alternate,
    Icons.add_shopping_cart,
    Icons.add_to_home_screen,
    Icons.add_to_photos,
    Icons.add_to_queue,
    Icons.adjust,
    Icons.airline_seat_flat,
    Icons.airline_seat_flat_angled,
    Icons.airline_seat_individual_suite,
    Icons.airline_seat_legroom_extra,
    Icons.airline_seat_legroom_normal,
    Icons.airline_seat_legroom_reduced,
    Icons.airline_seat_recline_extra,
    Icons.airline_seat_recline_normal,
    Icons.airplanemode_active,
    Icons.airplanemode_inactive,
    Icons.airplay,
    Icons.airport_shuttle,
    Icons.alarm,
    Icons.alarm_add,
    Icons.alarm_off,
    Icons.alarm_on,
    Icons.album,
    Icons.all_inclusive,
    Icons.all_out,
    Icons.alternate_email,
    Icons.android,
    Icons.announcement,
    Icons.apps,
    Icons.archive,
    Icons.arrow_back,
    Icons.arrow_back_ios,
    Icons.arrow_downward,
    Icons.arrow_drop_down,
    Icons.arrow_drop_down_circle,
    Icons.arrow_drop_up,
    Icons.arrow_forward,
    Icons.arrow_forward_ios,
    Icons.arrow_left,
    Icons.arrow_right,
    Icons.arrow_upward,
    Icons.art_track,
    Icons.star_rate,
    Icons.android,
    Icons.eco,
    Icons.scanner,
    Icons.miscellaneous_services,
    Icons.whatshot
  ];

  // Global AppBar Design
  PreferredSizeWidget globalAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      title: const Text(
        'AlgoxFusion',
        style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      centerTitle: true,
      elevation: 0.0,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      bottom: PreferredSize(
        child: Container(color: Colors.grey[200], height: 1.0),
        preferredSize: const Size.fromHeight(1.0),
      ),
      iconTheme: const IconThemeData(
        color: Colors.black,
      ),
    );
  }

  // Dynamic ScreenDesign
  Widget screenDetailList(
      {required BuildContext context,
      required String title,
      required StatefulWidget page}) {
    Color _color = _getColor();

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => page,
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10.0),
        // padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
        child: Card(
          child: Container(
            margin: const EdgeInsets.all(16.0),
            child: Row(
              children: <Widget>[
                Icon(
                  _iconList[random.nextInt(_iconList.length)],
                  color: _color,
                  size: 30.0,
                ),
                const SizedBox(
                  width: 24.0,
                ),
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                Icon(Icons.chevron_right, color: _color, size: 30.0),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Create Dynamic Detailed Widget
  Widget createDetailWidget({
    required String title,
    required String description,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 8.0),
          child: Text(
            description,
            style: const TextStyle(
              fontSize: 16.0,
              color: Colors.black,
            ),
          ),
        ),
        Container(
          margin:
              const EdgeInsets.only(top: Sizes.SIZE_24, bottom: Sizes.SIZE_8),
          child: const Text(
            'Example',
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.black,
            ),
          ),
        )
      ],
    );
  }

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
      body: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Center(
          child: Hero(
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
