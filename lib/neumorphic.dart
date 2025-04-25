import 'package:flutter/material.dart';

class NeuContainer extends StatelessWidget {

  NeuContainer({
    this.softness,
    this.child,
    this.width,
    this.height,
    this.margin,
    required this.colorCode,
    required this.opacity,
  });

  final Widget? child;
  Color colorCode;
  double? width;
  double? height;
  double? softness;
  EdgeInsetsGeometry? margin;
  double opacity;

  @override
  Widget build(BuildContext context) {
    softness ??= 0;
    softness = softness !+ 8; // set min softness to 8
    double spread = 3;

    shadow({required Color shadowColor,
      required Offset offset}) {
      return BoxShadow(
        color: shadowColor,
        offset: offset,
        blurRadius: softness ?? 8,
        spreadRadius: spread,
        blurStyle: BlurStyle.normal,
      );
    }
    containerEdgeSoftner({required Color softEdgeColor,
      required Offset offset}) {
      // Create a softening shadow wrapping,
      // between the container & shadow.
      double edgeSoftness = softness ! / 2;
      return BoxShadow(
        // Container Edges modifier
        color: colorCode,
        offset: offset,
        blurRadius: edgeSoftness,
        spreadRadius: spread / 2,
        blurStyle: BlurStyle.normal,
      );
    }

    Color lightShadow = Color.fromRGBO(255, 255, 255, opacity);

    Color darkShadow = Color.fromRGBO(120, 120, 120, opacity);

    return Container(
      margin: margin,
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: colorCode,
        borderRadius: BorderRadius.circular(16),
        boxShadow:
        [
          shadow( // only for raised button while pressed in light theme
            shadowColor: lightShadow,
            offset: const Offset(-10, -10),
          ),
          containerEdgeSoftner(
            softEdgeColor: colorCode,
            offset: const Offset(-1.5, -1.5),
          ),
          shadow( // only for raised button while pressed in light theme
            shadowColor: darkShadow,
            offset: const Offset(10, 10),
          ),
          containerEdgeSoftner(
            softEdgeColor: colorCode,
            offset: const Offset(1.5, 1.5),
          ),
        ],
      ),
      child: child,
    );
  }
}