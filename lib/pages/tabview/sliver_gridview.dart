import 'package:dealsapp/commonwidget/global_widget.dart';
import 'package:flutter/material.dart';
import 'package:dealsapp/values/values.dart';

class SliverGridView extends StatelessWidget {
  const SliverGridView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _imgList = Images.networkImgList;
    return CustomScrollView(
      slivers: [
        SliverGrid(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 5.0,
            childAspectRatio: 1.0,
          ),
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return GestureDetector(
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
                child: ClipRRect(
                  child: Image(
                    image: NetworkImage(_imgList[index]),
                    height: double.infinity,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
            childCount: _imgList.length,
          ),
        ),
      ],
    );
  }
}
