
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:shimmer/shimmer.dart';


class LessonViewShimmer extends StatelessWidget {
  bool _enabled = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Stack(
          children: <Widget>[
            // new Image.asset(
            //   "assets/images/homebg.jpg",
            //   height: MediaQuery.of(context).size.height,
            //   width: MediaQuery.of(context).size.width,
            //   fit: BoxFit.fill,
            // ),
            ClipPath(
              clipper: WaveClipperTwo(),
              child: Container(
                decoration: BoxDecoration(color: Colors.white70),
                height: 200,
              ),
            ),
            Shimmer.fromColors(
              baseColor: Colors.white54,// Colors.grey.shade300,
              highlightColor:Colors.white54,// Colors.grey.shade100,
              enabled: true,
              child: CustomScrollView(
                physics: BouncingScrollPhysics(),
                slivers: <Widget>[
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 15.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Container(
                            width: 30,
                            height: 30,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Container(
                            width: 150,
                            height: 30,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                  ),
                  SliverPadding(
                    padding: const EdgeInsets.all(16.0),
                    sliver: SliverGrid(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: MediaQuery.of(context).size.width > 1000
                                ? 6
                                : MediaQuery.of(context).size.width > 600
                                ? 4
                                : 2,
                            childAspectRatio: 1.2,
                            crossAxisSpacing: 10.0,
                            mainAxisSpacing: 10.0),
                        delegate: SliverChildBuilderDelegate(
                          _buildLessonItem,
                          childCount: 20,
                        )),
                  ),
                ],
              ),
            ),
          ],
        ));
  }

  Widget _buildLessonItem(BuildContext context, int index) {
    return Container(
      width: 130,
      height: 130,
      color: Colors.white,
    );
  }
}