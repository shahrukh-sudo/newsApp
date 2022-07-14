
import 'dart:ui';

import 'package:cv_project/utils/colors.dart';
import 'package:cv_project/utils/text.dart';
import 'package:flutter/material.dart';

class DividerWidget extends StatelessWidget {
  const DividerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(left: 20,right: 20),
        child: Divider(
          color: AppColors.lightWhite,
        ),
      ),
    );
  }
}

class BottomSheetImage extends StatelessWidget {
  final String imageUrl, title;
  const BottomSheetImage({Key? key,required this.title,required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: Stack(
        children: [
          Container(
            foregroundDecoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.black,Colors.transparent],
                begin: Alignment.bottomCenter,
                end:  Alignment.topCenter,
              ),
            ),
            decoration: BoxDecoration(
              borderRadius:const BorderRadius.only(
                topRight: Radius.circular(20),
                topLeft: Radius.circular(20),
              ),
              image: DecorationImage(
                image: NetworkImage(imageUrl),
                fit: BoxFit.cover,
              )


            ),
          ),
          Positioned(
            bottom: 10,
              child: Container(
                padding: const EdgeInsets.all(10),
                width: 300,
                child: boldText(text:title,size:18, color:Colors.white),

              ),
          )
        ],
      ),
    );
  }
}

