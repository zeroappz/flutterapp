import 'package:dealsapp/commonwidget/global_widget.dart';
import 'package:flutter/material.dart';
import 'package:dealsapp/values/values.dart';

class DynamicGridView extends StatelessWidget {
  const DynamicGridView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _imgList = Images.networkImgList;
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 1.0,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
      ),
      itemCount: _imgList.length,
      itemBuilder: (context, index) {
        return Container(
          // decoration: BoxDecoration(
          //   borderRadius: BorderRadius.circular(Sizes.RADIUS_0),
          //   image: DecorationImage(
          //     image: NetworkImage(_imgList[index]),
          //     fit: BoxFit.cover,
          //   ),
          // ),
          height: Sizes.HEIGHT_10 * 10,
          margin: const EdgeInsets.only(top: 10.0),
          color: Colors.grey,
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
            child: Image(
              image: NetworkImage(_imgList[index]),
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    );
  }
}
