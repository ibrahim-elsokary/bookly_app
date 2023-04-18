import 'package:bookly_app/core/utils/assets.dart';
import 'package:flutter/material.dart';

class CustomListItem extends StatelessWidget {
  const CustomListItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   
   return  SizedBox(
    height: MediaQuery.of(context).size.height/3.6,
     child: AspectRatio(
      aspectRatio: 2/2.8,
       child: Container(
          decoration: BoxDecoration(
            color: Colors.blue,
            image: const DecorationImage(image:  AssetImage(AssetsData.testImage),fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(20),),
        ),
     ),
   );
  }
}
