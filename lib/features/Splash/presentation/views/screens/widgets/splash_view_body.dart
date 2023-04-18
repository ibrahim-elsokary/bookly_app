import 'package:bookly_app/core/utils/assets.dart';
import 'package:bookly_app/features/Splash/presentation/views/screens/widgets/sliding_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({Key? key}) : super(key: key);

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));

    slidingAnimation =
        Tween<Offset>(begin: const Offset(0, 10), end: Offset.zero)
            .animate(animationController);

     animationController.forward();    

  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    //to prevent memory leak
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SvgPicture.asset(AssetsData.logo, width: 300),
        const SizedBox(
          height: 10,
        ),
        SlidingText(slidingAnimation: slidingAnimation),
      ],
    );
  }
}

