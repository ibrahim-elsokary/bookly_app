import 'package:bookly_app/core/utils/app_router.dart';
import 'package:bookly_app/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      SvgPicture.asset(AssetsData.logo ),
      const Spacer(),
      IconButton(onPressed: () {
        GoRouter.of(context).push(AppRouter.search);
      }, icon:SvgPicture.asset(AssetsData.searchIcon) )
    ],);
  }
}