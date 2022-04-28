import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:shimmer/shimmer.dart';

class LessonViewShimmer1 extends StatelessWidget {
  bool _enabled = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Stack(
          children: <Widget>[

            ClipPath(
              clipper: WaveClipperTwo(),
              child: Container(
                decoration: BoxDecoration(color: Colors.white70),
                height: 200,
              ),
            ),
            Shimmer.fromColors(
                baseColor: Colors.grey, // Colors.grey.shade300,
                highlightColor: Colors.grey, // Colors.grey.shade100,
                enabled: true,
                child: Container(height: 40,width: 100,)
            ),
          ],
        ));
  }

  Widget _buildLessonItem(BuildContext context, int index) {
    return Container(
      width: 130,

      color: Colors.white,
    );
  }
}
