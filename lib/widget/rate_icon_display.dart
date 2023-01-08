import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RateDisplay extends StatelessWidget {
  final double value;

  const RateDisplay({Key? key, this.value = 0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        return Icon(
          index >= value
              ? CupertinoIcons.star
              : index > value - 1 && index < value
                  ? CupertinoIcons.star_lefthalf_fill
                  : CupertinoIcons.star_fill,
          color: Colors.amber,
          size: 14,
        );
      }),
    );
  }
}
