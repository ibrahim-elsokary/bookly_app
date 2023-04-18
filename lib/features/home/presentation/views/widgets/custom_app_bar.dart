import 'package:bookly_app/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      SvgPicture.asset(AssetsData.logo ),
      const Spacer(),
      IconButton(onPressed: () {
        
      }, icon:SvgPicture.asset(AssetsData.searchIcon) )
    ],);
  }
}