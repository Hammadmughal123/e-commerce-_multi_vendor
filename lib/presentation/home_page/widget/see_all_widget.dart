import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_routes.dart';

class SeeAllWidget extends StatelessWidget {
  final String text;
  final Function() onTap;
  const SeeAllWidget({Key? key, required this.text, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 17),
          child: Text(
            text,
            style: TextStyle(
                fontSize: 16, color: Colors.black, fontWeight: FontWeight.w700),
          ),
        ),
        Spacer(),
        GestureDetector(
          onTap: onTap,
          child: Row(
            children: [
              Text(
                'See All ',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 17, left: 8),
                child: Icon(
                  Icons.arrow_forward_ios_sharp,
                  size: 15,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
