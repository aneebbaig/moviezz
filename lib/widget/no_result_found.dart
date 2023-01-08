import 'package:flutter/material.dart';

import '../utils/utils.dart';
import 'custom_text.dart';
class ErrorPage extends StatelessWidget {
  const ErrorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.error,
                size: 45,
                color: Colors.white.withOpacity(.6),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Something wrong!",
                style: headingText.copyWith(color: Colors.white.withOpacity(.9)),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Try again,Please.",
                textAlign: TextAlign.center,
                style: normalText.copyWith(color: Colors.white.withOpacity(.9)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}