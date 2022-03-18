import 'dart:math';
import 'package:dealsapp/commonwidget/global_widget.dart';
import 'package:flutter/material.dart';
import 'package:dealsapp/values/values.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class DynamicGridView extends StatelessWidget {
  const DynamicGridView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _imgList = Images.networkImgList;
    return MasonryGridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 10.0,
        crossAxisSpacing: 10.0,
        itemCount: _imgList.length,
        itemBuilder: (context, index) {
          var height = Random().nextInt(220).toDouble() + 150.0;
          return Card(
            elevation: (Random().nextInt(20).toDouble() + 10.0),
            shadowColor: Colors.grey.withOpacity(0.8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FullScreenImageView(
                    _imgList[index],
                    StringConstant.IMG_TAG + '_' + index.toString(),
                  ),
                ),
              );
            },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image(
                  image: NetworkImage(_imgList[index]),
                  height: height,
                  fit: BoxFit.cover,
                ),
            ),
            ),
          );
          // card title
          // card desc
          // card image
          // card button, icon
        });
  }
}
