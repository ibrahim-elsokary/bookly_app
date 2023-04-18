import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'custom_app_bar.dart';
import 'custom_list_item.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const[
        SizedBox(height: 45,),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: CustomAppBar(),
        ),
        CustomListItem(),
      ],
    );
  }
}

