



import 'package:cv_project/auth_service.dart';
import 'package:cv_project/utils/colors.dart';
import 'package:cv_project/utils/text.dart';
import 'package:flutter/material.dart';

class appbar extends StatefulWidget {
  const appbar({Key? key}) : super(key: key);

  @override
  State<appbar> createState() => _appbarState();
}

class _appbarState extends State<appbar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
        IconButton(
          onPressed: () {
            AuthService().signOut();
          },
          icon: const Icon(Icons.logout),
        ),
      ],
      backgroundColor: AppColors.black,
      elevation: 0,
      title: Container(
          height: 40,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              boldText(text: 'Tech', size: 20, color: AppColors.primary),
              modifiedText(text: 'Newz', size: 20, color: AppColors.lightWhite),
            ],
          )),
      centerTitle: true,

    );
  }
}